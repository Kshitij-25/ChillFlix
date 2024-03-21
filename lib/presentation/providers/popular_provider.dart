import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/models/movie_model.dart';
import 'movie_provider.dart';

final popularProvider = FutureProvider<List<MovieModel>>((ref) async {
  final moviesRepository = ref.read(movieRepositoryProvider);
  final eitherPopularOrError = await moviesRepository.getPopular(1);
  return eitherPopularOrError!.fold(
    (error) {
      throw error; // Throw the error for Riverpod to handle
    },
    (popular) => popular!,
  );
});
