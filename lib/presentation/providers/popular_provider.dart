import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/usecases/movies_usecase.dart';
import '../../data/models/movies.dart';
import 'common_providers.dart';

final popularUseCaseProvider = Provider<MoviesUseCase>((ref) {
  final popularRepository = ref.read(moviesDeatilsRepositoryProvider);
  return MoviesUseCaseImpl(popularRepository);
});

final popular = FutureProvider.autoDispose<List<Movies>?>((ref) async {
  final popularUseCase = ref.read(popularUseCaseProvider);
  return popularUseCase.getPopular(1); // Initialize with page 1
});
