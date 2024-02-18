import 'package:chillflix2/data/sources/genre_api_service.dart';

import '../models/genre_list.dart';

class GenreRepository {
  GenreRepository(this._genreApiService);
  final GenreApiService _genreApiService;

  Future<List<GenreList>?>? getMoviesGenre() async {
    return _genreApiService.getMoviesGenre();
  }

  Future<List<GenreList>?>? getTvGenre() async {
    return _genreApiService.getTvGenre();
  }
}
