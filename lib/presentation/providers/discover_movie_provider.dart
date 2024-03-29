import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/models/movie_model.dart';
import 'movie_provider.dart';

part 'discover_movie_provider.g.dart';

@riverpod
Future<List<MovieModel>> discoverMovie(DiscoverMovieRef ref, {required int genresId}) async {
  final moviesRepository = ref.read(movieRepositoryProvider);
  final eitherDiscoverMovieOrError = await moviesRepository.discoverMovies(genresId);
  return eitherDiscoverMovieOrError!.fold(
    (error) {
      throw error; // Throw the error for Riverpod to handle
    },
    (discoverMovie) => discoverMovie!,
  );
}
