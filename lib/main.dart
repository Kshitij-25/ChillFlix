import 'dart:async';
import 'dart:io';

import 'package:chillflix2/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';

var logger = Logger();
SharedPreferences? prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  unawaited(SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));

  HttpOverrides.global = MyHttpOverrides();

  await dotenv.load(fileName: "flutter.env");

  prefs = await SharedPreferences.getInstance();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const ProviderScope(child: MainApp()));
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}
