// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/models/genre_list.dart';
import '../../data/models/movie_model.dart';
import '../screens/details_screen.dart';
import 'custom_gridview.dart';

class DiscoverTitlesWidget extends StatelessWidget {
  DiscoverTitlesWidget({super.key, this.discoverMovies, this.genreListAsyncValue, this.activeGenreIndex});

  final AsyncValue<List<MovieModel>?>? discoverMovies;
  AsyncValue<List<GenreList>?>? genreListAsyncValue;
  int? activeGenreIndex;
  final ScrollController scrollController = ScrollController();

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
                genreListAsyncValue!.value![activeGenreIndex! - 3].name!,
                style: GoogleFonts.raleway(
                  fontSize: 27,
                  color: Colors.red[900],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: discoverMovies?.value == null ? 0 : discoverMovies!.value!.length,
              itemBuilder: (context, index) {
                // final page = index ~/ pageSize + 1;
                // final indexInPage = index % pageSize;

                // final nowPlayingAsyncValue = ref.watch(nowPlayingProvider(page: page));

                final movie = discoverMovies!.value![index];
                return GestureDetector(
                  onTap: () {
                    context.push(
                      DetailsScreen.route,
                      extra: movie.id,
                    );
                  },
                  child: CustomGridView(
                    data: movie,
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
