import 'package:chillflix2/data/models/genrelist.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../core/common/api.dart';

class GenreApiService {
  String? apiKey = dotenv.env['API_KEY_AUTH'];
  String? baseUrl = dotenv.env['API_URL'];
  final DioRequest dioRequest = DioRequest();

  Future<List<GenreList>?>? getMoviesGenre() async {
    final url = "$baseUrl/genre/movie/list?api_key=$apiKey";

    try {
      Response response = await dioRequest.getReq(
        url: url,
      );
      if (response.statusCode == 200) {
        List<dynamic> jsonList = response.data['genres'];
        List<GenreList> genres = jsonList.map((json) => GenreList.fromJson(json)).toList();
        print("GETMOVIESGENRE URL===> $url ====> $genres");
        return genres;
      }
    } catch (e) {
      print(e);
      return [];
    }
    return [];
  }

  Future<List<GenreList>?>? getTvGenre() async {
    final url = "$baseUrl/genre/tv/list?api_key=$apiKey";

    try {
      Response response = await dioRequest.getReq(
        url: url,
      );
      if (response.statusCode == 200) {
        debugPrint(response.data.toString());
      }
    } catch (e) {
      print(e);
      return [];
    }
    return [];
  }
}
