import 'package:flutter/material.dart';

import 'common/routes.dart';
import 'presentation/themes/theme.dart';
import 'presentation/themes/util.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;
    TextTheme textTheme = createTextTheme(context, "Open Sans", "Bebas Neue");

    MaterialTheme theme = MaterialTheme(textTheme);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      darkTheme: theme.dark(),
      theme: theme.light(),
      // darkTheme: ThemeData(
      //   colorScheme: const ColorScheme.dark(surface: Colors.black, primary: Colors.white),
      // ),
      // theme: ThemeData(
      //   colorScheme: ColorScheme.light(surface: Colors.grey[300]!, primary: Colors.black),
      // ),
      routerConfig: router,
    );
  }
}
