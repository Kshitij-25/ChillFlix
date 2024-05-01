import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../core/api_client.dart';
import '../core/api_constants.dart';
import '../models/genre_list.dart';

abstract class GenreRemoteDataSource {
  Future<List<GenreList>?>? getCombinedGenres();
}

class GenreRemoteDataSourceImpl implements GenreRemoteDataSource {
  final ApiClient? _apiClient;
  final Logger? _logger;

  GenreRemoteDataSourceImpl(this._apiClient, this._logger);

  @override
  Future<List<GenreList>> getCombinedGenres() async {
    List<GenreList> combinedGenres = [];

    final movieGenreUrl = "${ApiConstants.BASE_URL}/genre/movie/list?api_key=${ApiConstants.API_KEY}";
    // ignore: unused_local_variable
    final tvGenreurl = "${ApiConstants.BASE_URL}/genre/tv/list?api_key=${ApiConstants.API_KEY}";

    try {
      // Fetch genres from API 1
      Response? response1 = await _apiClient!.getReq(url: movieGenreUrl);
      List<dynamic> genres1 = response1!.data['genres'];
      _logger!.d("GETMOVIESGENRE URL===> $movieGenreUrl ====> $genres1");
      combinedGenres.addAll(genres1.map((genre) => GenreList.fromJson(genre)));

      // // Fetch genres from API 2
      // Response? response2 = await _apiClient.getReq(url: tvGenreurl);
      // List<dynamic> genres2 = response2!.data['genres'];
      // _logger.d("GETTVGENRE URL===> $tvGenreurl ====> $genres2");
      // for (var genre in genres2) {
      //   // Check if a genre with the same name already exists, if not, add it to combinedGenres
      //   if (!combinedGenres.any((existingGenre) => existingGenre.name == genre['name'])) {
      //     combinedGenres.add(GenreList.fromJson(genre));
      //   }
      // }

      return combinedGenres;
    } catch (e) {
      _logger!.e('GenreRemoteDataSourceImpl - getCombinedGenres: $e');
      return [];
    }
  }
}
