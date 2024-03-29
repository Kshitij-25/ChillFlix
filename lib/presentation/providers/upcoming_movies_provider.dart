import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/models/movie_model.dart';
import 'movie_provider.dart';

part 'upcoming_movies_provider.g.dart';

@riverpod
Future<List<MovieModel>> upcomingMovie(UpcomingMovieRef ref) async {
  final moviesRepository = ref.read(movieRepositoryProvider);
  final eitherUpcomingMovieOrError = await moviesRepository.getUpcomingMovies(1);
  return eitherUpcomingMovieOrError!.fold(
    (error) {
      throw error; // Throw the error for Riverpod to handle
    },
    (upcomingMovie) => upcomingMovie!,
  );
}
