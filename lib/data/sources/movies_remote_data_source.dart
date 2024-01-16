import 'package:dio/dio.dart';

import '../constants/api_client.dart';
import '../constants/api_constants.dart';
import '../models/movies.dart';

class MoviesRemoteDataSource {
  final DioRequest dioRequest = DioRequest();

  Future<List<Movies>?>? getAllTrending() async {
    final url = "${ApiConstants.BASE_URL}/trending/all/day?api_key=${ApiConstants.API_KEY}";
    try {
      Response response = await dioRequest.getReq(
        url: url,
      );
      if (response.statusCode == 200) {
        List<dynamic> jsonList = response.data['results'];
        List<Movies> allTrending = jsonList.map((json) => Movies.fromJson(json)).toList();
        print("GETALLTRENDING URL===> $url ====> $allTrending");
        return allTrending;
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<Movies>?>? getPopular(page) async {
    final url = "${ApiConstants.BASE_URL}/movie/popular?api_key=${ApiConstants.API_KEY}&page=$page";

    try {
      Response response = await dioRequest.getReq(
        url: url,
      );
      if (response.statusCode == 200) {
        List<dynamic> jsonList = response.data['results'];
        List<Movies> popular = jsonList.map((json) => Movies.fromJson(json)).toList();
        print("GETPOPULAR URL===> $url ====> $popular");
        return popular;
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<Movies>?>? getNowPlaying(page) async {
    final url = "${ApiConstants.BASE_URL}/movie/now_playing?api_key=${ApiConstants.API_KEY}&page=$page";

    try {
      Response response = await dioRequest.getReq(
        url: url,
      );
      if (response.statusCode == 200) {
        List<dynamic> jsonList = response.data['results'];
        List<Movies> nowPlaying = jsonList.map((json) => Movies.fromJson(json)).toList();
        print("GETNOWPLAYING URL===> $url ====> $nowPlaying");
        return nowPlaying;
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<Movies>?>? getUpcomingMovies(page) async {
    final url = "${ApiConstants.BASE_URL}/movie/upcoming?api_key=${ApiConstants.API_KEY}&page=$page";

    try {
      Response response = await dioRequest.getReq(
        url: url,
      );
      if (response.statusCode == 200) {
        List<dynamic> jsonList = response.data['results'];
        List<Movies> upcoming = jsonList.map((json) => Movies.fromJson(json)).toList();
        print("GETUPCOMING URL===> $url ====> $upcoming");
        return upcoming;
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      print(e);
      return [];
    }
  }
}
