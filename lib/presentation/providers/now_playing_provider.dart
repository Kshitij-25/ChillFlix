import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tmdb_chillflix/data/models/movie_model.dart';

import 'movie_provider.dart';

final nowPlayingProvider = FutureProvider<List<MovieModel>>((ref) async {
  final moviesRepository = ref.read(movieRepositoryProvider);
  final eitherNowPlayingOrError = await moviesRepository.getNowPlaying(1);
  return eitherNowPlayingOrError!.fold(
    (error) {
      throw error; // Throw the error for Riverpod to handle
    },
    (nowPlaying) => nowPlaying!,
  );
});
