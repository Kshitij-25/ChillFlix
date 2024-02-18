import 'package:chillflix2/data/models/genre_list.dart';
import 'package:chillflix2/data/repositories/genre_repo.dart';

import '../../main.dart';
import '../error/failure.dart';

abstract class GenreUseCase {
  Future<List<GenreList>?>? getGenreList();
}

class GenreUseCaseImpl implements GenreUseCase {
  GenreUseCaseImpl(this.genreRepository);
  final GenreRepository genreRepository;

  @override
  Future<List<GenreList>?>? getGenreList() async {
    try {
      return genreRepository.getMoviesGenre();
    } catch (e) {
      if (e is ServerFailure) {
        throw ServerFailure(serverFailureMessage: e.message);
      } else if (e is NetworkFailure) {
        throw NetworkFailure(networkFailureMessage: e.message);
      } else {
        logger.e('GenreUseCase - getGenreList : $e');
      }
      return null;
    }
  }
}
