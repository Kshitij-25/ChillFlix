import 'package:chillflix2/data/constants/api_client.dart';
import 'package:chillflix2/data/models/request_token.dart';
import 'package:dio/dio.dart';

import '../../main.dart';
import '../constants/api_constants.dart';

class AuthDataSource {
  final DioRequest _dioRequest = DioRequest();

  Future<RequestToken?> _getRequestToken(username, password) async {
    final url = "${ApiConstants.BASE_URL}/authentication/token/new?api_key=${ApiConstants.API_KEY}";
    try {
      Response? response = await _dioRequest.getReq(
        url: url,
      );
      if (response!.statusCode == 200) {
        var requestToken = RequestToken.fromJson(response.data);
        logger.d("GETREQUESTTOKEN URL===> $url ===> ${requestToken.request_token}");
        return requestToken;
      }
    } catch (e) {
      logger.e('AuthDataSource - getRequestToken: $e');
    }
    return null;
  }

  Future<RequestToken?> _validateWithLogin(username, password, requesttoken) async {
    final url = "${ApiConstants.BASE_URL}/authentication/token/validate_with_login?api_key=${ApiConstants.API_KEY}";
    try {
      Response? response = await _dioRequest.postReq(
        url: url,
        body: {
          "username": username,
          "password": password,
          "request_token": requesttoken,
        },
      );
      if (response!.statusCode == 200) {
        var token = RequestToken.fromJson(response.data);
        logger.d("VALIDATEWITHLOGIN URL===> $url ===> ${token.request_token}");
        return token;
      }
    } catch (e) {
      logger.e('AuthDataSource - validateWithLogin: $e');
    }
    return null;
  }

  Future<String?> _createSession(requesttoken) async {
    final url = "${ApiConstants.BASE_URL}/authentication/session/new?api_key=${ApiConstants.API_KEY}";
    try {
      Response? response = await _dioRequest.postReq(
        url: url,
        body: {
          "request_token": requesttoken,
        },
      );
      if (response!.statusCode == 200) {
        var responsedata = response.data;
        logger.d("CREATESESSION URL===> $url ===> $responsedata");
        return responsedata['success'] ? responsedata['session_id'] : null;
      }
    } catch (e) {
      logger.e('AuthDataSource - createSession: $e');
    }
    return null;
  }

  Future<bool?> loginUser(username, password) async {
    try {
      var requestToken = await _getRequestToken(username, password);
      if (requestToken != null) {
        var validateToken = await _validateWithLogin(username, password, requestToken.request_token);
        if (validateToken != null) {
          var sessionId = await _createSession(validateToken.request_token);
          if (sessionId != null) {
            prefs!.setString("sessionId", sessionId);
          }
          return true;
        }
      }
      return false;
    } catch (e) {
      logger.e('AuthDataSource - loginUser: $e');
      return false;
    }
  }

  Future<bool?> logoutUser(sessionId) async {
    final url = "${ApiConstants.BASE_URL}/authentication/session?api_key=${ApiConstants.API_KEY}";

    try {
      Response? response = await _dioRequest.deleteReq(
        url: url,
        body: {
          "session_id": sessionId,
        },
      );
      if (response!.statusCode == 200) {
        var responsedata = response.data;
        logger.d("LOGOUT URL===> $url ===> $responsedata");
        bool? isSuccess = responsedata['success'] ?? false;
        if (isSuccess == true) {
          prefs!.clear();
        }
        return isSuccess;
      }
    } catch (e) {
      logger.e('AuthDataSource - logoutUser : $e');
    }
    return null;
  }
}
