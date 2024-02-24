import 'package:chillflix2/data/models/movies.dart';
import 'package:chillflix2/presentation/providers/auth_providers.dart';
import 'package:chillflix2/presentation/providers/discover_providers.dart';
import 'package:chillflix2/presentation/providers/search_providers.dart';
import 'package:chillflix2/presentation/widgets/custom_sidebar.dart';
import 'package:chillflix2/presentation/widgets/home_widgets.dart';
import 'package:chillflix2/presentation/widgets/profile_widget.dart';
import 'package:chillflix2/presentation/widgets/search_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/genre_list_provider.dart';
import '../widgets/discover_titles_widget.dart';

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
      child: Consumer(
        builder: (context, WidgetRef ref, _) {
          final genreListAsyncValue = ref.watch(genreListProvider);
          final activeGenreIndex = ref.watch(activeGenreIndexProvider);
          AsyncValue<List<Movies>?>? discoverMovies;
          if (genreListAsyncValue.hasValue && activeGenreIndex != null && activeGenreIndex >= 3) {
            discoverMovies = ref.watch(discoverMoviesProvider(genreListAsyncValue.value![activeGenreIndex - 3].id!));
          }
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomSidebar(genreListAsyncValue: genreListAsyncValue),
              activeGenreIndex == 0
                  ? const HomeWidgets()
                  : activeGenreIndex == 1
                      ? SearchWidget(
                          onChanged: (value) {
                            print(value);
                            ref.read(multiSearchProvider(value));
                          },
                        )
                      : activeGenreIndex == 2
                          ? Container()
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
