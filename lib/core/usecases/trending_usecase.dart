import 'package:chillflix2/data/models/movies.dart';

import '../../data/repository/movies_repository.dart';
import '../error/failure.dart';

abstract class TrendingUseCase {
  Future<List<Movies>?>? getAllTrending();
}

class TrendingUseCaseImpl implements TrendingUseCase {
  TrendingUseCaseImpl(this.moviesRepository);
  final MoviesRepository moviesRepository;

  @override
  Future<List<Movies>?>? getAllTrending() {
    try {
      return moviesRepository.getAllTrending();
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
