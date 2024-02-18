import 'package:chillflix2/data/repositories/auth_repo.dart';

import '../../main.dart';
import '../error/failure.dart';

abstract class AuthUseCase {
  Future<bool?> loginUser(username, password);
  Future<bool?> logoutUser(sessionId);
}

class AuthUseCaseImpl implements AuthUseCase {
  AuthUseCaseImpl(this._authRepository);

  final AuthRepository _authRepository;

  @override
  Future<bool?> loginUser(username, password) async {
    try {
      return _authRepository.loginUser(username, password);
    } catch (e) {
      if (e is ServerFailure) {
        throw ServerFailure(serverFailureMessage: e.message);
      } else if (e is NetworkFailure) {
        throw NetworkFailure(networkFailureMessage: e.message);
      } else {
        logger.e('SearchUseCase - multiSearch : $e');
      }
    }
    return null;
  }

  @override
  Future<bool?> logoutUser(sessionId) async {
    try {
      return _authRepository.logoutUser(sessionId);
    } catch (e) {
      if (e is ServerFailure) {
        throw ServerFailure(serverFailureMessage: e.message);
      } else if (e is NetworkFailure) {
        throw NetworkFailure(networkFailureMessage: e.message);
      } else {
        logger.e('SearchUseCase - multiSearch : $e');
      }
    }
    return null;
  }
}
