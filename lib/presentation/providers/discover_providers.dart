import 'package:chillflix2/core/usecases/movies_usecase.dart';
import 'package:chillflix2/presentation/providers/common_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/movies.dart';

final discoverMoviesUseCaseProvider = FutureProvider<MoviesUseCase>((ref) async {
  final moviesRepository = ref.read(moviesDeatilsRepositoryProvider);
  return MoviesUseCaseImpl(moviesRepository);
});

final discoverMoviesProvider = FutureProvider.family<List<Movies>?, int>((ref, genresId) async {
  final discoverMoviesUseCase = await ref.read(discoverMoviesUseCaseProvider.future);
  return discoverMoviesUseCase.discoverMovies(genresId);
});
