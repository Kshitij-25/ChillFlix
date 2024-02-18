import 'package:chillflix2/data/sources/auth_data_source.dart';

class AuthRepository {
  AuthRepository(this._authDataSource);

  final AuthDataSource _authDataSource;

  Future<bool?> loginUser(username, password) async {
    return _authDataSource.loginUser(username, password);
  }

  Future<bool?> logoutUser(sessionId) async {
    return _authDataSource.logoutUser(sessionId);
  }
}
