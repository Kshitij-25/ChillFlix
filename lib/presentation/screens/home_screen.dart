import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tmdb_chillflix/presentation/screens/search_screen.dart';

import '../../data/models/movie_model.dart';
import '../providers/discover_movie_provider.dart';
import '../providers/genre_provider.dart';
import '../widgets/custom_sidebar.dart';
import '../widgets/discover_titles_widget.dart';
import '../widgets/home_widget.dart';
import 'profile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const route = "/homepage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyWidget(context),
    );
  }

  bodyWidget(context) {
    return SafeArea(
      child: Consumer(
        builder: (context, WidgetRef ref, _) {
          final genreListAsyncValue = ref.watch(genreListProvider);
          final activeGenreIndex = ref.watch(activeGenreIndexProvider);
          AsyncValue<List<MovieModel>?>? discoverMovies;
          if (genreListAsyncValue.hasValue && activeGenreIndex != null && activeGenreIndex >= 3) {
            discoverMovies = ref.watch(discoverMovieProvider(genresId: genreListAsyncValue.value![activeGenreIndex - 3].id!, page: 1));
          }
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomSidebar(genreListAsyncValue: genreListAsyncValue),
              activeGenreIndex == 0
                  ? const HomeWidget()
                  : activeGenreIndex == 1
                      ? SearchScreen()
                      : activeGenreIndex == 2
                          ? const ProfileScreen()
                          : DiscoverTitlesWidget(
                              discoverMovies: discoverMovies,
                              genreListAsyncValue: genreListAsyncValue,
                              activeGenreIndex: activeGenreIndex,
                            )
            ],
          );
        },
      ),
    );
  }
}
