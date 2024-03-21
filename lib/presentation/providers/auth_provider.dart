import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/data_sources/auth_local_data_source.dart';
import '../../data/repositories/auth_repository.dart';

final authLocalDataSourceProvider = Provider<AuthLocalDataSource>((ref) {
  return AuthLocalDataSourceImpl();
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final authLocalDataSource = ref.read(authLocalDataSourceProvider);
  return AuthRepository(authLocalDataSource);
});
