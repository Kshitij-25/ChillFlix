import 'package:http/http.dart' as http;
import 'package:netflix_redesign/models/featuredtvmodel.dart';
import 'package:netflix_redesign/models/tvmodel.dart';
import './models/featuredmoviemodel.dart';
import 'dart:convert';
import './models/genremodel.dart';
import './models/moviemodel.dart';

class Api {
  var httpClient = http.Client();
  static const url = "https://api.themoviedb.org/3";
  static const apiKey = "36e64decb04bdc9dec07a8a14ebd2ce1";

  Future<List<GenreModel>> getGenreList() async {
    final response = await http.get('$url/genre/movie/list?api_key=$apiKey');

    if (response.statusCode == 200) {
      final parsed =
          json.decode(response.body)['genres'].cast<Map<String, dynamic>>();

      return parsed
          .map<GenreModel>((json) => GenreModel.fromJson(json))
          .toList();
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<List<FeaturedMovieModel>> getFeaturedMovies() async {
    final response = await http.get('$url/trending/movie/day?api_key=$apiKey');
    print(response.body);
    if (response.statusCode == 200) {
      final parsed =
          json.decode(response.body)['results'].cast<Map<String, dynamic>>();
      print(parsed);
      return parsed
          .map<FeaturedMovieModel>((json) => FeaturedMovieModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load featured movies');
    }
  }

  Future<List<FeaturedTvModel>> getFeaturedTv() async {
    final response = await http.get('$url/trending/tv/day?api_key=$apiKey');
    print(response.body);
    if (response.statusCode == 200) {
      final parsed =
          json.decode(response.body)['results'].cast<Map<String, dynamic>>();
      print(parsed);
      return parsed
          .map<FeaturedTvModel>((json) => FeaturedTvModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load featured Tv');
    }
  }

  Future<MovieModel> getMovieInfo(int movieId) async {
    final response = await http.get("$url/movie/$movieId?api_key=$apiKey");

    if (response.statusCode == 200) {
      return MovieModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Movie Information');
    }
  }

  Future<TvModel> getTvInfo(int tvId) async {
    final response = await http.get("$url/tv/$tvId?api_key=$apiKey");

    if (response.statusCode == 200) {
      return TvModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Tv Information');
    }
  }
}
