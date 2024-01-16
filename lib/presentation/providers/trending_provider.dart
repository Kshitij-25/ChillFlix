import 'package:chillflix2/core/usecases/trending_usecase.dart';
import 'package:chillflix2/data/models/movies.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repository/movies_repository.dart';
import 'common_providers.dart';

final trendingRepositoryProvider = Provider<MoviesRepository>((ref) {
  final trendingApiService = ref.read(moviesRemoteDataSourceProvider);
  return MoviesRepository(trendingApiService);
});

final trendingUseCaseProvider = FutureProvider<TrendingUseCaseImpl>((ref) {
  final trendingRpository = ref.read(trendingRepositoryProvider);
  return TrendingUseCaseImpl(trendingRpository);
});

final trendingMovies = FutureProvider<List<Movies>?>((ref) async {
  final trendingMoviesUseCase = await ref.read(trendingUseCaseProvider.future);
  return trendingMoviesUseCase.getAllTrending();
});
