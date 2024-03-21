import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/data_sources/movie_remote_data_source.dart';
import '../../data/repositories/movie_repository.dart';

final moviesDataSourceProvider = Provider<MovieRemoteDataSource>((ref) {
  return MovieRemoteDataSourceImpl();
});

final movieRepositoryProvider = Provider<MovieRepository>((ref) {
  final movieRemoteDataSource = ref.read(moviesDataSourceProvider);
  return MovieRepository(movieRemoteDataSource);
});
