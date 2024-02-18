import 'package:chillflix2/data/models/movies_details.dart';

import '../../data/repositories/movies_repo.dart';
import '../../main.dart';
import '../error/failure.dart';

abstract class MoviesDetailsUseCase {
  Future<MoviesDetails?>? getMoviesDetails(movieId);
}

class MoviesDetailsUseCaseImpl implements MoviesDetailsUseCase {
  MoviesDetailsUseCaseImpl(this.moviesRepository);
  final MoviesRepository moviesRepository;

  @override
  Future<MoviesDetails?>? getMoviesDetails(movieId) async {
    try {
      return moviesRepository.getMoviesDetails(movieId);
    } catch (e) {
      if (e is ServerFailure) {
        throw ServerFailure(serverFailureMessage: e.message);
      } else if (e is NetworkFailure) {
        throw NetworkFailure(networkFailureMessage: e.message);
      } else {
        logger.e('UpcomingMoviesUseCase - getUpcomingMovies : $e');
      }
    }

    return null;
  }
}
