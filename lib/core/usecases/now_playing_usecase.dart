import 'package:chillflix2/data/models/movies.dart';
import 'package:chillflix2/data/repository/movies_repository.dart';
import 'package:chillflix2/presentation/state_notifiers/now_playing_state_notifier.dart';

import '../../main.dart';
import '../error/failure.dart';

abstract class NowPlayingUseCase {
  Future<List<Movies>?> getNowPlaying(int page);
}

class NowPlayingUseCaseImpl implements NowPlayingUseCase {
  NowPlayingUseCaseImpl(this.moviesRepository, NowPlayingStateNotifier read);
  final MoviesRepository moviesRepository;

  @override
  Future<List<Movies>?> getNowPlaying(int page) async {
    try {
      return moviesRepository.getNowPlaying(page);
    } catch (e) {
      if (e is ServerFailure) {
        throw ServerFailure(serverFailureMessage: e.message);
      } else if (e is NetworkFailure) {
        throw NetworkFailure(networkFailureMessage: e.message);
      } else {
        logger.e('NowPlayingUseCase - getNowPlaying : $e');
      }
    }
    return null;
  }
}
