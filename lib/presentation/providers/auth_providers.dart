import 'package:chillflix2/data/models/movies_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../data/models/movies.dart';
import '../../main.dart';

final authChangeProvider = ChangeNotifierProvider<AuthProvider>((ref) => AuthProvider());

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? get user => _auth.currentUser;

  Stream<User?> get userStream => _auth.authStateChanges();

  String _email = "";
  String get email => _email;

  set email(email) {
    _email = email;
    notifyListeners();
  }

  String _password = "";
  String get password => _password;

  set password(password) {
    _password = password;
    notifyListeners();
  }

  String _confirmPassword = "";
  String get confirmPassword => _confirmPassword;

  set confirmPassword(confirmPassword) {
    _confirmPassword = confirmPassword;
    notifyListeners();
  }

  bool _obscurePassword = true;
  bool get obscurePassword => _obscurePassword;
  set obscurePassword(bool obscureText) {
    _obscurePassword = obscureText;
    notifyListeners();
  }

  bool _obscureConfirmPassword = true;
  bool get obscureConfirmPassword => _obscureConfirmPassword;
  set obscureConfirmPassword(bool obscureConfirmPassword) {
    _obscureConfirmPassword = obscureConfirmPassword;
    notifyListeners();
  }

  bool _loading = false;
  bool get loading => _loading;

  set loading(loading) {
    _loading = loading;
    notifyListeners();
  }

  String? emailValidate(String value) {
    const String format =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$";
    return !RegExp(format).hasMatch(value) ? "Enter Valid Email" : null;
  }

  Future<void> loginUser() async {
    loading = true;
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // After successful login, check if the user document exists
      final user = _auth.currentUser;
      _loading = false;
      if (user != null) {
        final userDocSnapshot = await _firestore.collection('users').doc(user.uid).get();
        if (!userDocSnapshot.exists) {
          // If user document doesn't exist, create it
          await _firestore.collection('users').doc(user.uid).set({
            'username': user.displayName ?? '',
            'email': user.email ?? '',
            // Add more initial user data as needed
          });

          // Create subcollections for liked_movies and watchlist
          // await _createInitialMoviesCollection(user.uid, 'liked_movies');
          // await _createInitialMoviesCollection(user.uid, 'watchlist');
        }
      }
    } on FirebaseAuthException catch (e) {
      print(e);
      loading = false;
      if (e.code == "wrong-password") {
        return Future.error("Wrong Password");
      } else if (e.code == "user-not-found") {
        return Future.error("User Not Found");
      } else {
        return Future.error(e.message ?? "");
      }
    } catch (e) {
      loading = false;
      logger.e('AuthProvider - loginUser : $e');
    }
  }

  Future<dynamic> loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      // After successful login, check if the user document exists
      final user = _auth.currentUser;
      print(user?.displayName);
      _loading = false;
      if (user != null) {
        final userDocSnapshot = await _firestore.collection('users').doc(user.uid).get();
        if (!userDocSnapshot.exists) {
          // If user document doesn't exist, create it
          await _firestore.collection('users').doc(user.uid).set({
            'username': user.displayName ?? '',
            'email': user.email ?? '',
            // Add more initial user data as needed
          });

          // Create subcollections for liked_movies and watchlist
          await _createInitialMoviesCollection(user.uid, 'my_list');
          await _createInitialMoviesCollection(user.uid, 'watchlist');
        }
      }
      return userCredential;
    } on Exception catch (e) {
      print('exception->$e');
    }
  }

  Future<void> registerUser() async {
    loading = true;
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      _loading = false;
    } on FirebaseAuthException catch (e) {
      loading = false;
      if (e.code == "weak-password") {
        return Future.error("Please enter strong password");
      } else {
        return Future.error(e.message ?? "");
      }
    } catch (e) {
      loading = false;
      logger.e('AuthProvider - loginUser : $e');
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
  }

  Future<void> _createInitialMoviesCollection(String userId, String collectionName) async {
    final batch = _firestore.batch();
    final dummyMovieData = MoviesDetails(
      backdrop_path: '',
      id: 0,
      title: '',
      original_title: '',
      overview: '',
      poster_path: '',
      adult: false,
      budget: 0,
      genres: [],
      homepage: '',
      imdb_id: '',
      original_language: '',
      popularity: 0,
      release_date: '',
      revenue: 0,
      runtime: 0,
      status: '',
      tagline: '',
      video: false,
      vote_average: 0,
      vote_count: 0,
      addedToMyList: false,
      addedToWatchlist: false,
    );
    final dummyMovieDataMap = dummyMovieData.toJson();

    final querySnapshot = await _firestore.collection('users').doc(userId).collection(collectionName).get();
    if (querySnapshot.docs.isEmpty) {
      // If collection is empty, add a dummy movie document
      batch.set(_firestore.collection('users').doc(userId).collection(collectionName).doc('dummy'), dummyMovieDataMap);
      await batch.commit();
    }
  }
}
