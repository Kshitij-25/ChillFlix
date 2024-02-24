import 'package:chillflix2/presentation/pages/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'main.dart';
import 'presentation/pages/details_screen.dart';
import 'presentation/pages/homepage.dart';
import 'presentation/pages/login.dart';
import 'presentation/pages/now_playing_screen.dart';
import 'presentation/pages/popular_screen.dart';
import 'presentation/pages/upcoming_screen.dart';
import 'presentation/providers/auth_providers.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // darkTheme: ThemeData.dark(),
      darkTheme: ThemeData(
        colorScheme: const ColorScheme.dark(background: Colors.black, primary: Colors.white),
      ),
      theme: ThemeData(
        colorScheme: const ColorScheme.light(background: Colors.white, primary: Colors.black),
      ),
      themeMode: ThemeMode.system,
      initialRoute: InitialPage.route,
      routes: {
        InitialPage.route: (context) => const InitialPage(),
        LoginScreen.route: (context) => LoginScreen(),
        HomePage.route: (context) => const HomePage(),
        NowPlayingScreen.route: (context) => const NowPlayingScreen(),
        PopularScreen.route: (context) => const PopularScreen(),
        UpcomingScreen.route: (context) => const UpcomingScreen(),
        DetailsScreen.route: (context) => const DetailsScreen(),
        RegisterScreen.route: (context) => RegisterScreen(),
      },
    );
  }
}

class InitialPage extends ConsumerWidget {
  const InitialPage({super.key});

  static const route = "/";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authProvider = ref.watch(authChangeProvider);
    return authProvider.user != null ? const HomePage() : LoginScreen();
  }
}
