import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';

import '../../data/core/api_client.dart';
import '../../data/data_sources/movie_remote_data_source.dart';
import '../../data/di/get_it.dart';
import '../../data/repositories/movie_repository.dart';

final moviesDataSourceProvider = Provider<MovieRemoteDataSource>((ref) {
  // Retrieve the required dependencies from GetIt
  final apiClient = getItInstance<ApiClient>();
  final logger = getItInstance<Logger>();

  return MovieRemoteDataSourceImpl(apiClient, logger);
});

final movieRepositoryProvider = Provider<MovieRepository>((ref) {
  final movieRemoteDataSource = ref.read(moviesDataSourceProvider);
  return MovieRepository(movieRemoteDataSource);
});
