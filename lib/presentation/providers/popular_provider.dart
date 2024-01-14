import 'package:chillflix2/core/usecases/popular_usecase.dart';
import 'package:chillflix2/data/repository/popular_repo.dart';
import 'package:chillflix2/data/sources/popular_api_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/movies.dart';
import '../state_notifiers/popular_state_notifier.dart';

final popularApiServiceProvider = Provider<PopularApiService>((ref) {
  return PopularApiService();
});

final popularRepositoryProvider = Provider<PopularRepository>((ref) {
  final populargApiService = ref.read(popularApiServiceProvider);
  return PopularRepository(populargApiService);
});

final popularUseCaseProvider = Provider<PopularUseCaseImpl>((ref) {
  final popularRepository = ref.read(popularRepositoryProvider);
  return PopularUseCaseImpl(popularRepository, ref.read(popularStateNotifierProvider.notifier));
});

final popular = FutureProvider.autoDispose<List<Movies>?>((ref) async {
  final popularUseCase = ref.read(popularUseCaseProvider);
  return popularUseCase.getPopular(1); // Initialize with page 1
});
