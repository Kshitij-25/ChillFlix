import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tmdb_chillflix/data/models/movie_model.dart';

class NowPlayingStateNotifier extends StateNotifier<List<MovieModel>> {
  NowPlayingStateNotifier() : super([]);

  void addData(List<MovieModel> newData) {
    state = [...state, ...newData];
  }
}

final nowPlayingStateNotifierProvider = StateNotifierProvider<NowPlayingStateNotifier, List<MovieModel>>((ref) {
  return NowPlayingStateNotifier();
});
