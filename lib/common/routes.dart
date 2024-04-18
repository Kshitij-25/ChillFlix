import 'package:go_router/go_router.dart';

import '../presentation/screens/details_screen.dart';
import '../presentation/screens/home_screen.dart';
import '../presentation/screens/initial_screen.dart';
import '../presentation/screens/login_screen.dart';
import '../presentation/screens/my_list_screen.dart';
import '../presentation/screens/now_playing_screen.dart';
import '../presentation/screens/popular_screen.dart';
import '../presentation/screens/profile_screen.dart';
import '../presentation/screens/register_screen.dart';
import '../presentation/screens/search_screen.dart';
import '../presentation/screens/upcoming_screen.dart';
import '../presentation/screens/watchlist_screen.dart';

final router = GoRouter(
  initialLocation: InitialScreen.route,
  routes: [
    GoRoute(
      path: InitialScreen.route,
      builder: (context, state) => const InitialScreen(),
    ),
    GoRoute(
      path: LoginScreen.route,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: RegisterScreen.route,
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: HomeScreen.route,
      builder: (context, state) => const HomeScreen(),
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
      path: MyListScreen.route,
      builder: (context, state) => const MyListScreen(),
    ),
    GoRoute(
      path: WatchListScreen.route,
      builder: (context, state) => const WatchListScreen(),
    ),
    GoRoute(
      path: DetailsScreen.route,
      builder: (context, state) => DetailsScreen(
        id: state.extra as int?,
      ),
    ),
    GoRoute(
      path: ProfileScreen.route,
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: SearchScreen.route,
      builder: (context, state) => SearchScreen(),
    ),
  ],
);
