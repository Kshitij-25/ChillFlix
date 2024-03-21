import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/now_playing_provider.dart';
import '../providers/popular_provider.dart';
import '../providers/upcoming_movies_provider.dart';
import '../screens/now_playing_screen.dart';
import '../screens/popular_screen.dart';
import '../screens/upcoming_screen.dart';
import 'horizontal_list.dart';
import 'trending_card.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'ChillFlix',
                style: GoogleFonts.raleway(
                  fontSize: 27,
                  color: Colors.red[900],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const TrendingCard(),
            Consumer(
              builder: (context, ref, child) => HorizontalList(
                title: "NOW PLAYING",
                data: ref.watch(nowPlayingProvider),
                onPressed: () {
                  context.push(NowPlayingScreen.route);
                },
              ),
            ),
            Consumer(
              builder: (context, ref, child) => HorizontalList(
                data: ref.watch(popularProvider),
                title: "POPULAR MOVIES",
                onPressed: () {
                  context.push(PopularScreen.route);
                },
              ),
            ),
            Consumer(
              builder: (context, ref, child) => HorizontalList(
                data: ref.watch(upcomingMovieProvider),
                title: "UPCOMING MOVIES",
                onPressed: () {
                  context.push(UpcomingScreen.route);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
