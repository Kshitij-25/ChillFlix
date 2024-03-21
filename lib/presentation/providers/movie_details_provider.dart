import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/models/movie_details.dart';
import 'movie_provider.dart';

final moviesDetailsProvider = FutureProvider.family<MovieDetails, int>((ref, movieId) async {
  final moviesRepository = ref.read(movieRepositoryProvider);
  final eitherMovieDetailsOrError = await moviesRepository.getMoviesDetails(movieId);
  return eitherMovieDetailsOrError!.fold(
    (error) {
      throw error; // Throw the error for Riverpod to handle
    },
    (moviesDetails) => moviesDetails!,
  );
});
