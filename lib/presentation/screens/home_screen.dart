import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tmdb_chillflix/data/models/movie_model.dart';

import '../providers/discover_movie_provider.dart';
import '../providers/genre_provider.dart';
import '../providers/multi_search_provider.dart';
import '../widgets/custom_search_widget.dart';
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
            discoverMovies = ref.watch(discoverMovieProvider(genreListAsyncValue.value![activeGenreIndex - 3].id!));
          }
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomSidebar(genreListAsyncValue: genreListAsyncValue),
              activeGenreIndex == 0
                  ? const HomeWidget()
                  : activeGenreIndex == 1
                      ? CustomSearchWidget(
                          onChanged: (value) {
                            print(value);
                            ref.read(multiSearchProvider(value));
                          },
                        )
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
