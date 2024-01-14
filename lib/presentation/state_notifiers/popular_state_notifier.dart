import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/movies.dart';

class PopularStateNotifier extends StateNotifier<List<Movies>> {
  PopularStateNotifier() : super([]);

  void addData(List<Movies> newData) {
    state = [...state, ...newData];
  }
}

final popularStateNotifierProvider = StateNotifierProvider<PopularStateNotifier, List<Movies>>((ref) {
  return PopularStateNotifier();
});
