import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/models/movie_model.dart';
import 'movie_provider.dart';

final multiSearchProvider = FutureProvider.family<List<MovieModel>?, String>((ref, query) async {
  final moviesRepository = ref.read(movieRepositoryProvider);
  final eitherMultiSearchOrError = await moviesRepository.multiSearch(query);
  return eitherMultiSearchOrError!.fold(
    (error) {
      throw error; // Throw the error for Riverpod to handle
    },
    (multiSearch) => multiSearch!,
  );
});
