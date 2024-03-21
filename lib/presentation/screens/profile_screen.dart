import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../change_notifier_providers/auth_change_notifier_provider.dart';
import '../providers/auth_provider.dart';
import '../widgets/myList_provider.dart';
import '../widgets/user_movies_widget.dart';
import '../widgets/watchList_provider.dart';
import 'initial_screen.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  static const route = "/ProfileScreen";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authChangeProvider = ref.watch(authChangeNotifierProvider);
    final authProvider = ref.watch(authRepositoryProvider);
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'Profile',
                style: GoogleFonts.raleway(
                  fontSize: 27,
                  color: Colors.red[900],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.red[900],
                    radius: 60,
                    child: Text(
                      authChangeProvider.user!.displayName![0],
                      style: GoogleFonts.raleway(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        "WELCOME ${authChangeProvider.user!.displayName!}",
                        style: GoogleFonts.raleway(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        authChangeProvider.email!,
                        style: const TextStyle(color: Colors.white70),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Consumer(
              builder: (context, ref, child) => UserMoviesWidget(
                title: "My List",
                data: ref.watch(myListProvider),
                onPressed: () {
                  // context.push(
                  //   NowPlayingScreen.route,
                  // );
                },
              ),
            ),
            Consumer(
              builder: (context, ref, child) => UserMoviesWidget(
                title: "Watchlist",
                data: ref.watch(watchlistProvider),
                onPressed: () {
                  // context.push(
                  //   NowPlayingScreen.route,
                  // );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                await authProvider.logout();
                context.pushReplacement(InitialScreen.route);
              },
              child: const Text("SignOut"),
            )
          ],
        ),
      ),
    );
  }
}
