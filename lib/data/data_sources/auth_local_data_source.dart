import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';

import '../firebase_db/create_user_collection.dart';

abstract class AuthLocalDataSource {
  Future<bool> loginUser(email, password);
  Future<dynamic> loginWithGoogle();
  Future<bool> registerUser(email, password);
  Future<void> logout();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Logger? _logger;

  AuthLocalDataSourceImpl(this._logger);

  @override
  Future<bool> loginUser(email, password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      await CreateUserCollection().createUserCollection();

      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == "wrong-password") {
        return Future.error("Wrong Password");
      } else if (e.code == "user-not-found") {
        return Future.error("User Not Found");
      } else {
        return Future.error(e.message ?? "");
      }
    } catch (e) {
      _logger!.e('AuthLocalDataSourceImpl - loginUser : $e');
      return false;
    }
  }

  @override
  Future<bool> loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      await CreateUserCollection().createUserCollection();
      return true;
    } on Exception catch (e) {
      _logger!.e('AuthLocalDataSourceImpl - loginWithGoogle : $e');
      return false;
    }
  }

  @override
  Future<void> logout() async {
    await _auth.signOut();
  }

  @override
  Future<bool> registerUser(email, password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        return Future.error("Please enter strong password");
      } else {
        return Future.error(e.message ?? "");
      }
    } catch (e) {
      _logger!.e('AuthLocalDataSourceImpl - registerUser : $e');
      return false;
    }
  }
}
