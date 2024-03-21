import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tmdb_chillflix/data/models/movie_model.dart';

import 'movie_provider.dart';

final upcomingMovieProvider = FutureProvider<List<MovieModel>>((ref) async {
  final moviesRepository = ref.read(movieRepositoryProvider);
  final eitherUpcomingMovieOrError = await moviesRepository.getUpcomingMovies(1);
  return eitherUpcomingMovieOrError!.fold(
    (error) {
      throw error; // Throw the error for Riverpod to handle
    },
    (upcomingMovie) => upcomingMovie!,
  );
});
