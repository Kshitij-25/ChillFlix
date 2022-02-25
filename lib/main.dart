import 'package:chillflix/ui/screens/home_screen.dart';
import 'package:chillflix/ui/screens/video_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
        '/': (ctx) => const HomeScreen(),
        VideoApp.route: (ctx) => const VideoApp(),
      },
    );
  }
}
