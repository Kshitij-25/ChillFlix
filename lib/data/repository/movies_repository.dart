import 'package:chillflix2/data/models/movies_details.dart';
import 'package:chillflix2/data/models/videos_model.dart';

import '../models/movies.dart';
import '../sources/movies_remote_data_source.dart';

class MoviesRepository {
  MoviesRepository(this._moviesRemoteDataSource);
  final MoviesRemoteDataSource _moviesRemoteDataSource;

  Future<List<Movies>?>? getAllTrending() {
    return _moviesRemoteDataSource.getAllTrending();
  }

  Future<List<Movies>?> getNowPlaying(page) async {
    return _moviesRemoteDataSource.getNowPlaying(page);
  }

  Future<List<Movies>?> getPopular(page) async {
    return _moviesRemoteDataSource.getPopular(page);
  }

  Future<List<Movies>?> getUpcomingMovies(page) async {
    return _moviesRemoteDataSource.getUpcomingMovies(page);
  }

  Future<MoviesDetails?> getMoviesDetails(movieId) async {
    return _moviesRemoteDataSource.getMoviesDetails(movieId);
  }

  Future<List<Movies>?> getSimilarMovies(movieId) async {
    return _moviesRemoteDataSource.getSimilarMovies(movieId);
  }

  Future<List<VideosModel>?> getVideos(movieId) async {
    return _moviesRemoteDataSource.getVideos(movieId);
  }
}
