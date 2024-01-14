import 'package:chillflix2/data/models/genrelist.dart';
import 'package:chillflix2/data/repository/genre_repo.dart';

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
        // Optionally, log the error or handle it in some way
        print('Unexpected error: $e');
      }
      return [];
    }
  }
}
