import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/sources/movies_remote_data_source.dart';

final moviesRemoteDataSourceProvider = Provider<MoviesRemoteDataSource>((ref) {
  return MoviesRemoteDataSource();
});
