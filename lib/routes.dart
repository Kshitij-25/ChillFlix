import 'package:chillflix2/presentation/pages/profile_screen.dart';
import 'package:go_router/go_router.dart';

import 'presentation/pages/details_screen.dart';
import 'presentation/pages/homepage.dart';
import 'presentation/pages/initial_screen.dart';
import 'presentation/pages/login.dart';
import 'presentation/pages/now_playing_screen.dart';
import 'presentation/pages/popular_screen.dart';
import 'presentation/pages/register_screen.dart';
import 'presentation/pages/upcoming_screen.dart';

final router = GoRouter(
  initialLocation: InitialScreen.route,
  routes: [
    GoRoute(
      path: InitialScreen.route,
      builder: (context, state) => const InitialScreen(),
    ),
    GoRoute(
      path: LoginScreen.route,
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: HomePage.route,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: NowPlayingScreen.route,
      builder: (context, state) => const NowPlayingScreen(),
    ),
    GoRoute(
      path: PopularScreen.route,
      builder: (context, state) => const PopularScreen(),
    ),
    GoRoute(
      path: UpcomingScreen.route,
      builder: (context, state) => const UpcomingScreen(),
    ),
    GoRoute(
      path: DetailsScreen.route,
      builder: (context, state) => DetailsScreen(
        id: state.extra as int?,
      ),
    ),
    GoRoute(
      path: RegisterScreen.route,
      builder: (context, state) => RegisterScreen(),
    ),
    GoRoute(
      path: ProfileScreen.route,
      builder: (context, state) => const ProfileScreen(),
    ),
  ],
);
