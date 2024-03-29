import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/models/movie_model.dart';
import 'movie_provider.dart';

part 'multi_search_provider.g.dart';

@riverpod
Future<List<MovieModel>> multiSearch(MultiSearchRef ref, {required String query}) async {
  final moviesRepository = ref.read(movieRepositoryProvider);
  final eitherMultiSearchOrError = await moviesRepository.multiSearch(query);
  return eitherMultiSearchOrError!.fold(
    (error) {
      throw error; // Throw the error for Riverpod to handle
    },
    (multiSearch) => multiSearch!,
  );
}
