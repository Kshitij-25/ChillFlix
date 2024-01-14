import 'package:chillflix2/core/usecases/now_playing_usecase.dart';
import 'package:chillflix2/data/repository/now_playing_repo.dart';
import 'package:chillflix2/data/sources/now_playing_api_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/movies.dart';
import '../state_notifiers/now_playing_state_notifier.dart';

final nowPlayingApiServiceProvider = Provider<NowPlayingApiService>((ref) {
  return NowPlayingApiService();
});

final nowPlayingRepositoryProvider = Provider<NowPlayingRepository>((ref) {
  final nowPlayingApiService = ref.read(nowPlayingApiServiceProvider);
  return NowPlayingRepository(nowPlayingApiService);
});

final nowPlayingUseCaseProvider = Provider<NowPlayingUseCaseImpl>((ref) {
  final nowPlayingRepository = ref.read(nowPlayingRepositoryProvider);
  return NowPlayingUseCaseImpl(nowPlayingRepository, ref.read(nowPlayingStateNotifierProvider.notifier));
});

final nowPlaying = FutureProvider.autoDispose<List<Movies>?>((ref) async {
  final nowPlayingUseCase = ref.read(nowPlayingUseCaseProvider);
  return nowPlayingUseCase.getNowPlaying(1); // Initialize with page 1
});
