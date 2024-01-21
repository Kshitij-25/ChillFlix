import 'package:chillflix2/main.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import 'presentation/pages/details_screen.dart';
import 'presentation/pages/homepage.dart';
import 'presentation/pages/login.dart';
import 'presentation/pages/now_playing_screen.dart';
import 'presentation/pages/popular_screen.dart';
import 'presentation/pages/upcoming_screen.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    String initialRoute;
    var sessionId = prefs!.getString("sessionId");

    if (sessionId != null) {
      initialRoute = HomePage.route;
    } else {
      initialRoute = LoginScreen.route;
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: FlexThemeData.dark(
        darkIsTrueBlack: true,
      ),
      theme: ThemeData.light(),
      themeMode: ThemeMode.system,
      initialRoute: initialRoute,
      // initialRoute: HomePage.route,
      routes: {
        LoginScreen.route: (context) => LoginScreen(),
        HomePage.route: (context) => const HomePage(),
        NowPlayingScreen.route: (context) => const NowPlayingScreen(),
        PopularScreen.route: (context) => const PopularScreen(),
        UpcomingScreen.route: (context) => const UpcomingScreen(),
        DetailsScreen.route: (context) => const DetailsScreen(),
      },
    );
  }
}
