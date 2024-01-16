import 'package:chillflix2/core/usecases/now_playing_usecase.dart';
import 'package:chillflix2/data/repository/movies_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/movies.dart';
import '../state_notifiers/now_playing_state_notifier.dart';
import 'common_providers.dart';

final nowPlayingRepositoryProvider = Provider<MoviesRepository>((ref) {
  final nowPlayingApiService = ref.read(moviesRemoteDataSourceProvider);
  return MoviesRepository(nowPlayingApiService);
});

final nowPlayingUseCaseProvider = Provider<NowPlayingUseCaseImpl>((ref) {
  final nowPlayingRepository = ref.read(nowPlayingRepositoryProvider);
  return NowPlayingUseCaseImpl(nowPlayingRepository, ref.read(nowPlayingStateNotifierProvider.notifier));
});

final nowPlaying = FutureProvider.autoDispose<List<Movies>?>((ref) async {
  final nowPlayingUseCase = ref.read(nowPlayingUseCaseProvider);
  return nowPlayingUseCase.getNowPlaying(1); // Initialize with page 1
});
