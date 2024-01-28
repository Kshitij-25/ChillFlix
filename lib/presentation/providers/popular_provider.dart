import 'package:chillflix2/core/usecases/popular_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/movies.dart';
import '../state_notifiers/popular_state_notifier.dart';
import 'common_providers.dart';

final popularUseCaseProvider = Provider<PopularUseCaseImpl>((ref) {
  final popularRepository = ref.read(moviesDeatilsRepositoryProvider);
  return PopularUseCaseImpl(popularRepository, ref.read(popularStateNotifierProvider.notifier));
});

final popular = FutureProvider.autoDispose<List<Movies>?>((ref) async {
  final popularUseCase = ref.read(popularUseCaseProvider);
  return popularUseCase.getPopular(1); // Initialize with page 1
});
