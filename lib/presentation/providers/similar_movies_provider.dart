import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/usecases/movies_usecase.dart';
import '../../data/models/movies.dart';
import 'common_providers.dart';

final similarMoviesUseCaseProvider = FutureProvider<MoviesUseCase>((ref) {
  final similarMovies = ref.read(moviesDeatilsRepositoryProvider);
  return MoviesUseCaseImpl(similarMovies);
});

final similarMoviesProvider = FutureProvider.family<List<Movies>?, int>((ref, moviesId) async {
  final similarMoviesUseCase = await ref.read(similarMoviesUseCaseProvider.future);
  return similarMoviesUseCase.getSimilarMovies(moviesId);
});
