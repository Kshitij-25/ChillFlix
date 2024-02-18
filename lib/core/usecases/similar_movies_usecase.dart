import '../../data/models/movies.dart';
import '../../data/repositories/movies_repo.dart';
import '../../main.dart';
import '../error/failure.dart';

abstract class SimilarMoviesUseCase {
  Future<List<Movies>?>? getSimilarMovies(movieId);
}

class SimilarMoviesUseCaseImpl implements SimilarMoviesUseCase {
  SimilarMoviesUseCaseImpl(this.moviesRepository);
  final MoviesRepository moviesRepository;

  @override
  Future<List<Movies>?>? getSimilarMovies(movieId) async {
    try {
      return moviesRepository.getSimilarMovies(movieId);
    } catch (e) {
      if (e is ServerFailure) {
        throw ServerFailure(serverFailureMessage: e.message);
      } else if (e is NetworkFailure) {
        throw NetworkFailure(networkFailureMessage: e.message);
      } else {
        logger.e('SimilarMoviesUseCase - getSimilarMovies : $e');
      }
    }

    return null;
  }
}
