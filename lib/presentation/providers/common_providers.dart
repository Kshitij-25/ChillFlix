import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/movies_repo.dart';
import '../../data/sources/movies_remote_data_source.dart';

final moviesRemoteDataSourceProvider = Provider<MoviesRemoteDataSource>((ref) {
  return MoviesRemoteDataSource();
});

final moviesDeatilsRepositoryProvider = Provider<MoviesRepository>((ref) {
  final moviesDeatilsApiService = ref.read(moviesRemoteDataSourceProvider);
  return MoviesRepository(moviesDeatilsApiService);
});
