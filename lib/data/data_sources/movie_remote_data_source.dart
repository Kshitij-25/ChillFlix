import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../core/api_client.dart';
import '../core/api_constants.dart';
import '../models/movie_details.dart';
import '../models/movie_model.dart';
import '../models/video_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>?>? getAllTrending();
  Future<List<MovieModel>?>? getPopular(page);
  Future<List<MovieModel>?>? getNowPlaying(page);
  Future<List<MovieModel>?>? getUpcomingMovies(page);
  Future<MovieDetails?>? getMoviesDetails(movieId);
  Future<List<MovieModel>?>? getSimilarMovies(movieId);
  Future<List<VideoModel>?>? getVideos(movieId);
  Future<List<MovieModel>?>? discoverMovies(genresId);
  Future<List<MovieModel>?>? multiSearch(query);
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final ApiClient? _apiClient;
  final Logger? _logger;

  MovieRemoteDataSourceImpl(this._apiClient, this._logger);

  @override
  Future<List<MovieModel>?>? discoverMovies(genresId) async {
    final url =
        "${ApiConstants.BASE_URL}/discover/movie?include_adult=true&page=1&sort_by=popularity.desc&with_genres=$genresId&api_key=${ApiConstants.API_KEY}";

    try {
      Response? response = await _apiClient!.getReq(
        url: url,
      );
      if (response!.statusCode == 200) {
        List<dynamic> jsonList = response.data['results'];
        List<MovieModel> discoverMovies = jsonList.map((json) => MovieModel.fromJson(json)).toList();
        _logger!.d("DISCOVERMOVIES URL===> $url ====> $discoverMovies");
        return discoverMovies;
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      _logger!.e('MovieRemoteDataSourceImpl - discoverMovies: $e');
      return [];
    }
  }

  @override
  Future<List<MovieModel>?>? getAllTrending() async {
    final url = "${ApiConstants.BASE_URL}/trending/all/day?api_key=${ApiConstants.API_KEY}";
    try {
      Response? response = await _apiClient!.getReq(
        url: url,
      );
      if (response!.statusCode == 200) {
        List<dynamic> jsonList = response.data['results'];
        List<MovieModel> allTrending = jsonList.map((json) => MovieModel.fromJson(json)).toList();
        _logger!.d("GETALLTRENDING URL===> $url ====> $allTrending");
        return allTrending;
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      _logger!.e('MovieRemoteDataSourceImpl - getAllTrending: $e');
      return [];
    }
  }

  @override
  Future<MovieDetails?>? getMoviesDetails(movieId) async {
    final url = "${ApiConstants.BASE_URL}/movie/$movieId?api_key=${ApiConstants.API_KEY}";

    try {
      Response? response = await _apiClient!.getReq(
        url: url,
      );
      if (response!.statusCode == 200) {
        _logger!.d("GETMOVIESDETAILS URL ===> $url ===> ${response.data}");
        return MovieDetails.fromJson(response.data);
      }
    } catch (e) {
      _logger!.e('MovieRemoteDataSourceImpl - getMoviesDetails: $e');
    }
    return null;
  }

  @override
  Future<List<MovieModel>?>? getNowPlaying(page) async {
    final url = "${ApiConstants.BASE_URL}/movie/now_playing?api_key=${ApiConstants.API_KEY}&page=$page";

    try {
      Response? response = await _apiClient!.getReq(
        url: url,
      );
      if (response!.statusCode == 200) {
        List<dynamic> jsonList = response.data['results'];
        List<MovieModel> nowPlaying = jsonList.map((json) => MovieModel.fromJson(json)).toList();
        _logger!.d("GETNOWPLAYING URL===> $url ====> $nowPlaying");
        return nowPlaying;
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      _logger!.e('MovieRemoteDataSourceImpl - getNowPlaying: $e');
      return [];
    }
  }

  @override
  Future<List<MovieModel>?>? getPopular(page) async {
    final url = "${ApiConstants.BASE_URL}/movie/popular?api_key=${ApiConstants.API_KEY}&page=$page";

    try {
      Response? response = await _apiClient!.getReq(
        url: url,
      );
      if (response!.statusCode == 200) {
        List<dynamic> jsonList = response.data['results'];
        List<MovieModel> popular = jsonList.map((json) => MovieModel.fromJson(json)).toList();
        _logger!.d("GETPOPULAR URL===> $url ====> $popular");
        return popular;
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      _logger!.e('MovieRemoteDataSourceImpl - getPopular: $e');
      return [];
    }
  }

  @override
  Future<List<MovieModel>?>? getSimilarMovies(movieId) async {
    final url = "${ApiConstants.BASE_URL}/movie/$movieId/similar?api_key=${ApiConstants.API_KEY}";

    try {
      Response? response = await _apiClient!.getReq(
        url: url,
      );
      if (response!.statusCode == 200) {
        List<dynamic> jsonList = response.data['results'];
        List<MovieModel> similar = jsonList.map((json) => MovieModel.fromJson(json)).toList();
        _logger!.d("GETSIMILARMOVIE URL===> $url ====> $similar");
        return similar;
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      _logger!.e('MovieRemoteDataSourceImpl - getSimilarMovies: $e');
      return [];
    }
  }

  @override
  Future<List<MovieModel>?>? getUpcomingMovies(page) async {
    final url = "${ApiConstants.BASE_URL}/movie/upcoming?api_key=${ApiConstants.API_KEY}&page=$page";

    try {
      Response? response = await _apiClient!.getReq(
        url: url,
      );
      if (response!.statusCode == 200) {
        List<dynamic> jsonList = response.data['results'];
        List<MovieModel> upcoming = jsonList.map((json) => MovieModel.fromJson(json)).toList();
        _logger!.d("GETUPCOMING URL===> $url ====> $upcoming");
        return upcoming;
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      _logger!.e('MovieRemoteDataSourceImpl - getUpcomingMovies: $e');
      return [];
    }
  }

  @override
  Future<List<VideoModel>?>? getVideos(movieId) async {
    final url = "${ApiConstants.BASE_URL}/movie/$movieId/videos?api_key=${ApiConstants.API_KEY}";

    try {
      Response? response = await _apiClient!.getReq(
        url: url,
      );
      if (response!.statusCode == 200) {
        List<dynamic> jsonList = response.data['results'];
        List<VideoModel> videos = jsonList.map((json) => VideoModel.fromJson(json)).toList();
        _logger!.d("GETVIDEOS URL===> $url ====> $videos");
        return videos;
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      _logger!.e('MovieRemoteDataSourceImpl - getVideos: $e');
      return [];
    }
  }

  @override
  Future<List<MovieModel>?>? multiSearch(query) async {
    final url = "${ApiConstants.BASE_URL}/search/multi?query=$query&include_adult=true&page=1&api_key=${ApiConstants.API_KEY}";
    try {
      Response? response = await _apiClient!.getReq(
        url: url,
      );
      if (response!.statusCode == 200) {
        List<dynamic> jsonList = response.data['results'];
        List<MovieModel> multiSearch = jsonList.map((json) => MovieModel.fromJson(json)).toList();
        _logger!.d("MULTISEARCH URL===> $url ====> $multiSearch");
        return multiSearch;
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      _logger!.e('SearchDataSource - multiSearch: $e');
      return [];
    }
  }
}
