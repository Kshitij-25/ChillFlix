import '../../data/models/movies.dart';
import '../../data/repository/movies_repository.dart';
import '../../main.dart';
import '../error/failure.dart';

abstract class UpcomingMoviesUseCase {
  Future<List<Movies>?>? getUpcomingMovies(page);
}

class UpcomingMoviesUseCaseImpl implements UpcomingMoviesUseCase {
  UpcomingMoviesUseCaseImpl(this.moviesRepository);
  final MoviesRepository moviesRepository;

  @override
  Future<List<Movies>?>? getUpcomingMovies(page) {
    try {
      return moviesRepository.getUpcomingMovies(page);
    } catch (e) {
      if (e is ServerFailure) {
        throw ServerFailure(serverFailureMessage: e.message);
      } else if (e is NetworkFailure) {
        throw NetworkFailure(networkFailureMessage: e.message);
      } else {
        logger.e('UpcomingMoviesUseCase - getUpcomingMovies : $e');
      }
    }

    throw UnimplementedError();
  }
}
