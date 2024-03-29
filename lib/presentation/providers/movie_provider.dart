import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/core/api_client.dart';
import '../../data/data_sources/movie_remote_data_source.dart';
import '../../data/di/get_it.dart';
import '../../data/repositories/movie_repository.dart';

part 'movie_provider.g.dart';

@riverpod
MovieRemoteDataSource moviesDataSource(MoviesDataSourceRef ref) {
  // Retrieve the required dependencies from GetIt
  final apiClient = getItInstance<ApiClient>();
  final logger = getItInstance<Logger>();

  return MovieRemoteDataSourceImpl(apiClient, logger);
}

@riverpod
MovieRepository movieRepository(MovieRepositoryRef ref) {
  final movieRemoteDataSource = ref.read(moviesDataSourceProvider);
  return MovieRepository(movieRemoteDataSource);
}
