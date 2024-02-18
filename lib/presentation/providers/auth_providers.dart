import 'package:chillflix2/core/usecases/auth_usecase.dart';
import 'package:chillflix2/data/repositories/auth_repo.dart';
import 'package:chillflix2/data/sources/auth_data_source.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authDataSourceProvider = Provider<AuthDataSource>((ref) {
  return AuthDataSource();
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final authDataSource = ref.read(authDataSourceProvider);
  return AuthRepository(authDataSource);
});

final authUseCaseProvider = FutureProvider<AuthUseCase>((ref) {
  final authRepository = ref.read(authRepositoryProvider);
  return AuthUseCaseImpl(authRepository);
});

final loginProvider = FutureProvider.family<bool?, Map<String, dynamic>>((ref, credentails) async {
  final authUseCase = await ref.read(authUseCaseProvider.future);
  var username = credentails['username'];
  var password = credentails['password'];
  return authUseCase.loginUser(username, password);
});

final logoutProvider = FutureProvider.family<bool?, String>((ref, sessionId) async {
  final authUseCase = await ref.read(authUseCaseProvider.future);
  return authUseCase.logoutUser(sessionId);
});
