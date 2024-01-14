import 'package:chillflix2/data/models/movies.dart';
import 'package:chillflix2/data/repository/popular_repo.dart';
import 'package:chillflix2/presentation/state_notifiers/popular_state_notifier.dart';

import '../error/failure.dart';

abstract class PopularUseCase {
  Future<List<Movies>?> getPopular(int page);
}

class PopularUseCaseImpl implements PopularUseCase {
  PopularUseCaseImpl(this.popularRepository, PopularStateNotifier read);
  final PopularRepository popularRepository;

  @override
  Future<List<Movies>?> getPopular(int page) async {
    try {
      return popularRepository.getPopular(page);
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
