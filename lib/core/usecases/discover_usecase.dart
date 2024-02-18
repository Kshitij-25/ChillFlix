import 'package:chillflix2/data/repositories/movies_repo.dart';

import '../../data/models/movies.dart';
import '../../main.dart';
import '../error/failure.dart';

abstract class DiscoverMoviesUseCase {
  Future<List<Movies>?>? discoverMovies(genresId);
}

class DiscoverMoviesUseCaseImpl implements DiscoverMoviesUseCase {
  DiscoverMoviesUseCaseImpl(this._moviesRepository);

  final MoviesRepository _moviesRepository;

  @override
  Future<List<Movies>?>? discoverMovies(genresId) async {
    try {
      return _moviesRepository.discoverMovies(genresId);
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
