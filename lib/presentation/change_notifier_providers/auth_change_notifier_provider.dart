import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authChangeNotifierProvider = ChangeNotifierProvider<AuthProvider>((ref) => AuthProvider());

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
}
