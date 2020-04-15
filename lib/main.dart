import 'package:flutter/material.dart';
import './ui/screens/home_screen.dart';
import './ui/screens/video_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        fontFamily: 'Raleway',
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => HomeScreen(),
        VideoApp.route: (ctx) => VideoApp(),
      },
    );
  }
}
