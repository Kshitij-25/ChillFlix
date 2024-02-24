import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../pages/now_playing_screen.dart';
import '../pages/popular_screen.dart';
import '../pages/upcoming_screen.dart';
import '../providers/now_playing_provider.dart';
import '../providers/popular_provider.dart';
import '../providers/upcoming_movies_provider.dart';
import 'section_container.dart';
import 'trending_today_card.dart';

class HomeWidgets extends StatelessWidget {
  const HomeWidgets({super.key});

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
                  color: Colors.red.shade900,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const TrendingTodayCard(),
            Consumer(
              builder: (context, ref, child) => SectionContainer(
                title: "NOW PLAYING",
                data: ref.watch(nowPlaying),
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    NowPlayingScreen.route,
                    arguments: ref.watch(nowPlaying),
                  );
                },
              ),
            ),
            Consumer(
              builder: (context, ref, child) => SectionContainer(
                data: ref.watch(popular),
                title: "POPULAR MOVIES",
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    PopularScreen.route,
                    arguments: ref.watch(popular),
                  );
                },
              ),
            ),
            Consumer(
              builder: (context, ref, child) => SectionContainer(
                data: ref.watch(upcomingMovies),
                title: "UPCOMING MOVIES",
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    UpcomingScreen.route,
                    arguments: ref.watch(upcomingMovies),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
