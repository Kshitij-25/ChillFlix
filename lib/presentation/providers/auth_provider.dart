import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';

import '../../data/data_sources/auth_local_data_source.dart';
import '../../data/di/get_it.dart';
import '../../data/repositories/auth_repository.dart';

final authLocalDataSourceProvider = Provider<AuthLocalDataSource>((ref) {
  // Retrieve the required dependencies from GetIt
  final logger = getItInstance<Logger>();

  return AuthLocalDataSourceImpl(logger);
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final authLocalDataSource = ref.read(authLocalDataSourceProvider);
  return AuthRepository(authLocalDataSource);
});
