import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/movies.dart';

class NowPlayingStateNotifier extends StateNotifier<List<Movies>> {
  NowPlayingStateNotifier() : super([]);

  void addData(List<Movies> newData) {
    state = [...state, ...newData];
  }
}

final nowPlayingStateNotifierProvider = StateNotifierProvider<NowPlayingStateNotifier, List<Movies>>((ref) {
  return NowPlayingStateNotifier();
});
