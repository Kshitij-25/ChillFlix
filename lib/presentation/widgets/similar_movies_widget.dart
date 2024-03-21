// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/models/movie_model.dart';
import 'custom_gridview.dart';

class SimilarMoviesWidget extends StatelessWidget {
  SimilarMoviesWidget({super.key, this.similarMoviesAsyncValue});

  AsyncValue<List<MovieModel>?>? similarMoviesAsyncValue;
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return similarMoviesAsyncValue!.when(
      data: (similarMovies) {
        return CustomGridView(
          scrollController: controller,
          itemCount: 4,
          data: similarMovies,
        );
      },
      loading: () => const Center(child: CircularProgressIndicator.adaptive()),
      error: (error, stackTrace) {
        return Center(child: Text('Error: $error'));
      },
    );
  }
}
