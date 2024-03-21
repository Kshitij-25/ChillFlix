import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/models/movie_model.dart';
import 'movie_provider.dart';

final similarMoviesProvider = FutureProvider.family<List<MovieModel>, int>((ref, moviesId) async {
  final moviesRepository = ref.read(movieRepositoryProvider);
  final eitherSimilarMovieOrError = await moviesRepository.getSimilarMovies(moviesId);
  return eitherSimilarMovieOrError!.fold(
    (error) {
      throw error; // Throw the error for Riverpod to handle
    },
    (similarMovies) => similarMovies!,
  );
});
