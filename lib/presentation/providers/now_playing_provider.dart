import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/usecases/movies_usecase.dart';
import '../../data/models/movies.dart';
import 'common_providers.dart';

final nowPlayingUseCaseProvider = Provider<MoviesUseCase>((ref) {
  final nowPlayingRepository = ref.read(moviesDeatilsRepositoryProvider);
  return MoviesUseCaseImpl(nowPlayingRepository);
});

final nowPlaying = FutureProvider.autoDispose<List<Movies>?>((ref) async {
  final nowPlayingUseCase = ref.read(nowPlayingUseCaseProvider);
  return nowPlayingUseCase.getNowPlaying(1); // Initialize with page 1
});
