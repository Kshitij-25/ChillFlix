<<<<<<< HEAD
import 'package:chillflix/ui/screens/home_screen.dart';
import 'package:chillflix/ui/screens/video_screen.dart';
import 'package:flutter/material.dart';
=======
import 'package:flutter/material.dart';
import './ui/screens/home_screen.dart';
import './ui/screens/video_screen.dart';
>>>>>>> 2ba981ebe713a8f7fb5456ed1fdbfbb1bd188626

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
<<<<<<< HEAD
  const MyApp({Key? key}) : super(key: key);

=======
>>>>>>> 2ba981ebe713a8f7fb5456ed1fdbfbb1bd188626
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
<<<<<<< HEAD
        '/': (ctx) => const HomeScreen(),
        VideoApp.route: (ctx) => const VideoApp(),
=======
        '/': (ctx) => HomeScreen(),
        VideoApp.route: (ctx) => VideoApp(),
>>>>>>> 2ba981ebe713a8f7fb5456ed1fdbfbb1bd188626
      },
    );
  }
}
