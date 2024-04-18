import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/models/movie_model.dart';
import 'movie_provider.dart';

part 'popular_provider.g.dart';

@riverpod
Future<List<MovieModel>> popular(PopularRef ref, {required int page}) async {
  final moviesRepository = ref.read(movieRepositoryProvider);
  final eitherPopularOrError = await moviesRepository.getPopular(page);
  return eitherPopularOrError!.fold(
    (error) {
      throw error; // Throw the error for Riverpod to handle
    },
    (popular) => popular!,
  );
}
