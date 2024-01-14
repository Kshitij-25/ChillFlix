import 'package:flutter/material.dart';

import 'presentation/pages/homepage.dart';
import 'presentation/pages/now_playing_screen.dart';
import 'presentation/pages/popular_screen.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      theme: ThemeData.light(),
      themeMode: ThemeMode.system,
      initialRoute: HomePage.route,
      routes: {
        HomePage.route: (context) => const HomePage(),
        NowPlayingScreen.route: (context) => NowPlayingScreen(),
        PopularScreen.route: (context) => PopularScreen(),
      },
    );
  }
}
