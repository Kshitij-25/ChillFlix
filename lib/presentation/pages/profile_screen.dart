import 'package:chillflix2/presentation/pages/initial_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../providers/auth_providers.dart';
import '../providers/firestore_provider.dart';
import '../providers/now_playing_provider.dart';
import '../widgets/section_container.dart';
import '../widgets/user_movies_widget.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  static const route = "/ProfileScreen";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authChangeProvider);
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
                      user.user!.displayName![0],
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
                        "WELCOME ${user.user!.displayName!}",
                        style: GoogleFonts.raleway(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        user.email!,
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
                await user.logout();
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
