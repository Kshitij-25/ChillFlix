import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/models/movie_model.dart';

class PopularStateNotifier extends StateNotifier<List<MovieModel>> {
  PopularStateNotifier() : super([]);

  void addData(List<MovieModel> newData) {
    state = [...state, ...newData];
  }
}

final popularStateNotifierProvider = StateNotifierProvider<PopularStateNotifier, List<MovieModel>>((ref) {
  return PopularStateNotifier();
});
