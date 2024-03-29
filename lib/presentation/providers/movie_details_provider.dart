import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/models/movie_details.dart';
import 'movie_provider.dart';

part 'movie_details_provider.g.dart';

@riverpod
Future<MovieDetails> moviesDetails(MoviesDetailsRef ref, {required int movieId}) async {
  final moviesRepository = ref.read(movieRepositoryProvider);
  final eitherMovieDetailsOrError = await moviesRepository.getMoviesDetails(movieId);
  return eitherMovieDetailsOrError!.fold(
    (error) {
      throw error; // Throw the error for Riverpod to handle
    },
    (moviesDetails) => moviesDetails!,
  );
}
