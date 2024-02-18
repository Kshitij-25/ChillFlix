import 'package:chillflix2/data/models/movies_details.dart';
import 'package:chillflix2/data/models/videos_model.dart';
import 'package:dio/dio.dart';

import '../../main.dart';
import '../constants/api_client.dart';
import '../constants/api_constants.dart';
import '../models/movies.dart';

class MoviesRemoteDataSource {
  final DioRequest dioRequest = DioRequest();

  Future<List<Movies>?>? getAllTrending() async {
    final url = "${ApiConstants.BASE_URL}/trending/all/day?api_key=${ApiConstants.API_KEY}";
    try {
      Response? response = await dioRequest.getReq(
        url: url,
      );
      if (response!.statusCode == 200) {
        List<dynamic> jsonList = response.data['results'];
        List<Movies> allTrending = jsonList.map((json) => Movies.fromJson(json)).toList();
        logger.d("GETALLTRENDING URL===> $url ====> $allTrending");
        return allTrending;
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      logger.e('MoviesRemoteDataSource - getAllTrending: $e');
      return [];
    }
  }

  Future<List<Movies>?>? getPopular(page) async {
    final url = "${ApiConstants.BASE_URL}/movie/popular?api_key=${ApiConstants.API_KEY}&page=$page";

    try {
      Response? response = await dioRequest.getReq(
        url: url,
      );
      if (response!.statusCode == 200) {
        List<dynamic> jsonList = response.data['results'];
        List<Movies> popular = jsonList.map((json) => Movies.fromJson(json)).toList();
        logger.d("GETPOPULAR URL===> $url ====> $popular");
        return popular;
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      logger.e('MoviesRemoteDataSource - getPopular: $e');
      return [];
    }
  }

  Future<List<Movies>?>? getNowPlaying(page) async {
    final url = "${ApiConstants.BASE_URL}/movie/now_playing?api_key=${ApiConstants.API_KEY}&page=$page";

    try {
      Response? response = await dioRequest.getReq(
        url: url,
      );
      if (response!.statusCode == 200) {
        List<dynamic> jsonList = response.data['results'];
        List<Movies> nowPlaying = jsonList.map((json) => Movies.fromJson(json)).toList();
        logger.d("GETNOWPLAYING URL===> $url ====> $nowPlaying");
        return nowPlaying;
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      logger.e('MoviesRemoteDataSource - getNowPlaying: $e');
      return [];
    }
  }

  Future<List<Movies>?>? getUpcomingMovies(page) async {
    final url = "${ApiConstants.BASE_URL}/movie/upcoming?api_key=${ApiConstants.API_KEY}&page=$page";

    try {
      Response? response = await dioRequest.getReq(
        url: url,
      );
      if (response!.statusCode == 200) {
        List<dynamic> jsonList = response.data['results'];
        List<Movies> upcoming = jsonList.map((json) => Movies.fromJson(json)).toList();
        logger.d("GETUPCOMING URL===> $url ====> $upcoming");
        return upcoming;
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      logger.e('MoviesRemoteDataSource - getUpcomingMovies: $e');
      return [];
    }
  }

  Future<MoviesDetails?>? getMoviesDetails(movieId) async {
    final url = "${ApiConstants.BASE_URL}/movie/$movieId?api_key=${ApiConstants.API_KEY}";

    try {
      Response? response = await dioRequest.getReq(
        url: url,
      );
      if (response!.statusCode == 200) {
        logger.d("GETMOVIESDETAILS URL ===> $url ===> ${response.data}");
        return MoviesDetails.fromJson(response.data);
      }
    } catch (e) {
      logger.e('MoviesRemoteDataSource - getMoviesDetails: $e');
    }
    return null;
  }

  Future<List<Movies>?>? getSimilarMovies(movieId) async {
    final url = "${ApiConstants.BASE_URL}/movie/$movieId/similar?api_key=${ApiConstants.API_KEY}";

    try {
      Response? response = await dioRequest.getReq(
        url: url,
      );
      if (response!.statusCode == 200) {
        List<dynamic> jsonList = response.data['results'];
        List<Movies> similar = jsonList.map((json) => Movies.fromJson(json)).toList();
        logger.d("GETSIMILARMOVIE URL===> $url ====> $similar");
        return similar;
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      logger.e('MoviesRemoteDataSource - getSimilarMovies: $e');
      return [];
    }
  }

  Future<List<VideosModel>?>? getVideos(movieId) async {
    final url = "${ApiConstants.BASE_URL}/movie/$movieId/videos?api_key=${ApiConstants.API_KEY}";

    try {
      Response? response = await dioRequest.getReq(
        url: url,
      );
      if (response!.statusCode == 200) {
        List<dynamic> jsonList = response.data['results'];
        List<VideosModel> videos = jsonList.map((json) => VideosModel.fromJson(json)).toList();
        logger.d("GETVIDEOS URL===> $url ====> $videos");
        return videos;
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      logger.e('MoviesRemoteDataSource - getVideos: $e');
      return [];
    }
  }

  Future<List<Movies>?>? discoverMovies(genresId) async {
    final url =
        "${ApiConstants.BASE_URL}/discover/movie?include_adult=true&page=1&sort_by=popularity.desc&with_genres=$genresId&api_key=${ApiConstants.API_KEY}";

    try {
      Response? response = await dioRequest.getReq(
        url: url,
      );
      if (response!.statusCode == 200) {
        List<dynamic> jsonList = response.data['results'];
        List<Movies> discoverMovies = jsonList.map((json) => Movies.fromJson(json)).toList();
        logger.d("DISCOVERMOVIES URL===> $url ====> $discoverMovies");
        return discoverMovies;
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      logger.e('MoviesRemoteDataSource - discoverMovies: $e');
      return [];
    }
  }
}
