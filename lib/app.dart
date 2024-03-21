import 'package:flutter/material.dart';

import 'common/routes.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        colorScheme: const ColorScheme.dark(background: Colors.black, primary: Colors.white),
      ),
      theme: ThemeData(
        colorScheme: const ColorScheme.light(background: Colors.white, primary: Colors.black),
      ),
      themeMode: ThemeMode.system,
      routerConfig: router,
    );
  }
}
