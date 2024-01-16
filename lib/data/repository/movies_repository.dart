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
}
