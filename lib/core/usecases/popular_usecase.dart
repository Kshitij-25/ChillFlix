import 'package:chillflix2/data/models/movies.dart';
import 'package:chillflix2/presentation/state_notifiers/popular_state_notifier.dart';

import '../../data/repositories/movies_repo.dart';
import '../../main.dart';
import '../error/failure.dart';

abstract class PopularUseCase {
  Future<List<Movies>?> getPopular(int page);
}

class PopularUseCaseImpl implements PopularUseCase {
  PopularUseCaseImpl(this.moviesRepository, PopularStateNotifier read);
  final MoviesRepository moviesRepository;

  @override
  Future<List<Movies>?> getPopular(int page) async {
    try {
      return moviesRepository.getPopular(page);
    } catch (e) {
      if (e is ServerFailure) {
        throw ServerFailure(serverFailureMessage: e.message);
      } else if (e is NetworkFailure) {
        throw NetworkFailure(networkFailureMessage: e.message);
      } else {
        logger.e('PopularUseCase - getPopular : $e');
      }
    }
    return null;
  }
}
