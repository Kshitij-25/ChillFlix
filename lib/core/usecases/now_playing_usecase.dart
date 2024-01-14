import 'package:chillflix2/data/models/movies.dart';
import 'package:chillflix2/data/repository/now_playing_repo.dart';
import 'package:chillflix2/presentation/state_notifiers/now_playing_state_notifier.dart';

import '../error/failure.dart';

abstract class NowPlayingUseCase {
  Future<List<Movies>?> getNowPlaying(int page);
}

class NowPlayingUseCaseImpl implements NowPlayingUseCase {
  NowPlayingUseCaseImpl(this.nowPlayingRepository, NowPlayingStateNotifier read);
  final NowPlayingRepository nowPlayingRepository;

  @override
  Future<List<Movies>?> getNowPlaying(int page) async {
    try {
      return nowPlayingRepository.getNowPlaying(page);
    } catch (e) {
      if (e is ServerFailure) {
        throw ServerFailure(serverFailureMessage: e.message);
      } else if (e is NetworkFailure) {
        throw NetworkFailure(networkFailureMessage: e.message);
      } else {
        // Optionally, log the error or handle it in some way
        print('Unexpected error: $e');
      }
    }
  }
}
