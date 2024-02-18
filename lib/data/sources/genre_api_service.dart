import 'package:chillflix2/data/models/genre_list.dart';
import 'package:chillflix2/main.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../constants/api_client.dart';
import '../constants/api_constants.dart';

class GenreApiService {
  final DioRequest dioRequest = DioRequest();

  Future<List<GenreList>?>? getMoviesGenre() async {
    final url = "${ApiConstants.BASE_URL}/genre/movie/list?api_key=${ApiConstants.API_KEY}";

    try {
      Response? response = await dioRequest.getReq(
        url: url,
      );
      if (response!.statusCode == 200) {
        List<dynamic> jsonList = response.data['genres'];
        List<GenreList> genres = jsonList.map((json) => GenreList.fromJson(json)).toList();
        logger.d("GETMOVIESGENRE URL===> $url ====> $genres");
        return genres;
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      logger.e('GenreApiService - getMoviesGenre: $e');
      return [];
    }
  }

  Future<List<GenreList>?>? getTvGenre() async {
    final url = "${ApiConstants.BASE_URL}/genre/tv/list?api_key=${ApiConstants.API_KEY}";

    try {
      Response? response = await dioRequest.getReq(
        url: url,
      );
      if (response!.statusCode == 200) {
        debugPrint(response.data.toString());
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      logger.e('GenreApiService - getTvGenre: $e');
      return [];
    }
    return [];
  }
}
