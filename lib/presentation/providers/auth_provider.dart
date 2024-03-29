import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/data_sources/auth_local_data_source.dart';
import '../../data/di/get_it.dart';
import '../../data/repositories/auth_repository.dart';

part 'auth_provider.g.dart';

@riverpod
AuthLocalDataSource authLocalDataSource(AuthLocalDataSourceRef ref) {
  // Retrieve the required dependencies from GetIt
  final logger = getItInstance<Logger>();

  return AuthLocalDataSourceImpl(logger);
}

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  final authLocalDataSource = ref.read(authLocalDataSourceProvider);
  return AuthRepository(authLocalDataSource);
}
