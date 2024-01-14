import 'package:chillflix2/core/usecases/trending_usecase.dart';
import 'package:chillflix2/data/models/movies.dart';
import 'package:chillflix2/data/repository/trending_repo.dart';
import 'package:chillflix2/data/sources/trending_api_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final trendingApiServiceProvider = Provider<TrendingApiService>((ref) => TrendingApiService());

final trendingRepositoryProvider = Provider<TrendingRepository>((ref) {
  final trendingApiService = ref.read(trendingApiServiceProvider);
  return TrendingRepository(trendingApiService);
});

final trendingUseCaseProvider = FutureProvider<TrendingUseCaseImpl>((ref) {
  final trendingRpository = ref.read(trendingRepositoryProvider);
  return TrendingUseCaseImpl(trendingRpository);
});

final trendingMovies = FutureProvider<List<Movies>?>((ref) async {
  final trendingMoviesUseCase = await ref.read(trendingUseCaseProvider.future);
  return trendingMoviesUseCase.getAllTrending();
});
