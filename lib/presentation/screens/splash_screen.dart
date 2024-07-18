import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:tmdb_chillflix/presentation/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const route = '/splashScreen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _controller = AnimationController(vsync: this);

    // Add a status listener to navigate to the next screen when the animation completes
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Navigate to the next screen
        context.go(LoginScreen.route);
      }
    });
  }

  @override
  void dispose() {
    // Dispose of the animation controller
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/splash_bg.png'),
        ),
      ),
      child: Lottie.asset(
        'assets/chillflix_anim60f_21x9_FINAL.json',
        controller: _controller,
        onLoaded: (composition) {
          _controller.duration = composition.duration;
          _controller.forward();
        },
        fit: BoxFit.fitWidth,
        repeat: false,
      ),
    );
  }
}
