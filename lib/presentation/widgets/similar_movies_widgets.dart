import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/movies.dart';
import 'custom_gridview.dart';

class SimilarMoviesWidget extends StatelessWidget {
  SimilarMoviesWidget({super.key, this.similarMoviesAsyncValue});

  AsyncValue<List<Movies>?>? similarMoviesAsyncValue;
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
