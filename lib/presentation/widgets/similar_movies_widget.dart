// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/models/movie_model.dart';
import '../screens/details_screen.dart';
import 'custom_gridview.dart';

class SimilarMoviesWidget extends StatelessWidget {
  SimilarMoviesWidget({super.key, this.similarMoviesAsyncValue});

  AsyncValue<List<MovieModel>?>? similarMoviesAsyncValue;
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemCount: 4,
      itemBuilder: (context, index) {
        // final page = index ~/ pageSize + 1;
        // final indexInPage = index % pageSize;

        // final nowPlayingAsyncValue = ref.watch(nowPlayingProvider(page: page));

        return similarMoviesAsyncValue!.when(
          data: (similarMovies) {
            // if (indexInPage >= nowPlaying.length) {
            //   return null;
            // }
            final movie = similarMovies![index];
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
          loading: () => const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
          error: (error, stackTrace) {
            return Center(child: Text('Error: $error'));
          },
        );
      },
    );
  }
}
