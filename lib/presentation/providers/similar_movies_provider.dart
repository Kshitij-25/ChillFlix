import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/models/movie_model.dart';
import 'movie_provider.dart';

part 'similar_movies_provider.g.dart';

@riverpod
Future<List<MovieModel>> similarMovies(SimilarMoviesRef ref, {required int moviesId}) async {
  final moviesRepository = ref.read(movieRepositoryProvider);
  final eitherSimilarMovieOrError = await moviesRepository.getSimilarMovies(moviesId);
  return eitherSimilarMovieOrError!.fold(
    (error) {
      throw error; // Throw the error for Riverpod to handle
    },
    (similarMovies) => similarMovies!,
  );
}
