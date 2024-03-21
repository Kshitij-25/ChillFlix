import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/models/movie_model.dart';
import 'movie_provider.dart';

final trendingMovieProvider = FutureProvider<List<MovieModel>>((ref) async {
  final moviesRepository = ref.read(movieRepositoryProvider);
  final eitherTrendingMovieOrError = await moviesRepository.getAllTrending();
  return eitherTrendingMovieOrError!.fold(
    (error) {
      throw error; // Throw the error for Riverpod to handle
    },
    (trendingMovie) => trendingMovie!,
  );
});
