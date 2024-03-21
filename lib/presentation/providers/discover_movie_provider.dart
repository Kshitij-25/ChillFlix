import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tmdb_chillflix/data/models/movie_model.dart';

import 'movie_provider.dart';

final discoverMovieProvider = FutureProvider.family<List<MovieModel>, int>((ref, genresId) async {
  final moviesRepository = ref.read(movieRepositoryProvider);
  final eitherDiscoverMovieOrError = await moviesRepository.discoverMovies(genresId);
  return eitherDiscoverMovieOrError!.fold(
    (error) {
      throw error; // Throw the error for Riverpod to handle
    },
    (discoverMovie) => discoverMovie!,
  );
});
