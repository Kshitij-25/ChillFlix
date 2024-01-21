import 'package:chillflix2/presentation/pages/popular_screen.dart';
import 'package:chillflix2/presentation/pages/upcoming_screen.dart';
import 'package:chillflix2/presentation/providers/popular_provider.dart';
import 'package:chillflix2/presentation/providers/upcoming_movies_provider.dart';
import 'package:chillflix2/presentation/widgets/custom_sidebar.dart';
import 'package:chillflix2/presentation/widgets/trending_today_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../providers/now_playing_provider.dart';
import '../widgets/section_container.dart';
import 'now_playing_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const route = "/homepage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyWidget(context),
    );
  }

  bodyWidget(context) {
    return SafeArea(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomSidebar(),
          Expanded(
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
                        color: Colors.red,
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
          ),
        ],
      ),
    );
  }
}
