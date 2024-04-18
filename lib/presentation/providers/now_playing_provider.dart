import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/models/movie_model.dart';
import 'movie_provider.dart';

part 'now_playing_provider.g.dart';

@riverpod
Future<List<MovieModel>> nowPlaying(NowPlayingRef ref, {required int page}) async {
  final moviesRepository = ref.read(movieRepositoryProvider);
  final eitherNowPlayingOrError = await moviesRepository.getNowPlaying(page);
  return eitherNowPlayingOrError!.fold(
    (error) {
      throw error; // Throw the error for Riverpod to handle
    },
    (nowPlaying) => nowPlaying!,
  );
}
