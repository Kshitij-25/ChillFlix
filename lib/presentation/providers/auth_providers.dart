// import 'package:chillflix2/core/usecases/auth_usecase.dart';
// import 'package:chillflix2/data/repositories/auth_repo.dart';
// import 'package:chillflix2/data/sources/auth_data_source.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// final authDataSourceProvider = Provider<AuthDataSource>((ref) {
//   return AuthDataSource();
// });

// final authRepositoryProvider = Provider<AuthRepository>((ref) {
//   final authDataSource = ref.read(authDataSourceProvider);
//   return AuthRepository(authDataSource);
// });

// final authUseCaseProvider = FutureProvider<AuthUseCase>((ref) {
//   final authRepository = ref.read(authRepositoryProvider);
//   return AuthUseCaseImpl(authRepository);
// });

// final loginProvider = FutureProvider.family<bool?, Map<String, dynamic>>((ref, credentails) async {
//   final authUseCase = await ref.read(authUseCaseProvider.future);
//   var username = credentails['username'];
//   var password = credentails['password'];
//   return authUseCase.loginUser(username, password);
// });

// final logoutProvider = FutureProvider.family<bool?, String>((ref, sessionId) async {
//   final authUseCase = await ref.read(authUseCaseProvider.future);
//   return authUseCase.logoutUser(sessionId);
// });

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../main.dart';

final authChangeProvider = ChangeNotifierProvider<AuthProvider>((ref) {
  return AuthProvider();
});

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
      _loading = false;
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

      return await FirebaseAuth.instance.signInWithCredential(credential);
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
}
