import 'package:chillflix2/core/usecases/similar_movies_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/movies.dart';
import 'common_providers.dart';

final similarMoviesUseCaseProvider = FutureProvider<SimilarMoviesUseCase>((ref) {
  final similarMovies = ref.read(moviesDeatilsRepositoryProvider);
  return SimilarMoviesUseCaseImpl(similarMovies);
});

final similarMoviesProvider = FutureProvider.family<List<Movies>?, int>((ref, moviesId) async {
  final similarMoviesUseCase = await ref.read(similarMoviesUseCaseProvider.future);
  return similarMoviesUseCase.getSimilarMovies(moviesId);
});
