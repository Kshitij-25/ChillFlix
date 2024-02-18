import 'package:chillflix2/data/models/movies.dart';

import '../../data/repositories/movies_repo.dart';
import '../../main.dart';
import '../error/failure.dart';

abstract class MoviesUseCase {
  Future<List<Movies>?>? getAllTrending();
  Future<List<Movies>?> getNowPlaying(int page);
  Future<List<Movies>?> getPopular(int page);
  Future<List<Movies>?>? getUpcomingMovies(page);
  Future<List<Movies>?>? getSimilarMovies(movieId);
  Future<List<Movies>?>? discoverMovies(genresId);
  Future<List<Movies>?>? multiSearch(query);
}

class MoviesUseCaseImpl implements MoviesUseCase {
  MoviesUseCaseImpl(this.moviesRepository);
  final MoviesRepository moviesRepository;

  @override
  Future<List<Movies>?>? getAllTrending() async {
    try {
      return moviesRepository.getAllTrending();
    } catch (e) {
      if (e is ServerFailure) {
        throw ServerFailure(serverFailureMessage: e.message);
      } else if (e is NetworkFailure) {
        throw NetworkFailure(networkFailureMessage: e.message);
      } else {
        logger.e('MoviesUseCase - getAllTrending : $e');
      }
    }
    return null;
  }

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
        logger.e('MoviesUseCase - getNowPlaying : $e');
      }
    }
    return null;
  }

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

  @override
  Future<List<Movies>?>? getUpcomingMovies(page) async {
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
    return null;
  }

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

  @override
  Future<List<Movies>?>? discoverMovies(genresId) async {
    try {
      return moviesRepository.discoverMovies(genresId);
    } catch (e) {
      if (e is ServerFailure) {
        throw ServerFailure(serverFailureMessage: e.message);
      } else if (e is NetworkFailure) {
        throw NetworkFailure(networkFailureMessage: e.message);
      } else {
        logger.e('SearchUseCase - multiSearch : $e');
      }
    }
    return null;
  }

  @override
  Future<List<Movies>?>? multiSearch(query) async {
    try {
      return moviesRepository.multiSearch(query);
    } catch (e) {
      if (e is ServerFailure) {
        throw ServerFailure(serverFailureMessage: e.message);
      } else if (e is NetworkFailure) {
        throw NetworkFailure(networkFailureMessage: e.message);
      } else {
        logger.e('SearchUseCase - multiSearch : $e');
      }
    }
    return null;
  }
}
