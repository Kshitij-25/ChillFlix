import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioRequestException implements Exception {
  final String message;

  DioRequestException(this.message);

  @override
  String toString() => 'DioRequestException: $message';
}

class ApiClient {
  final Dio _dio;

  ApiClient(this._dio);

  Future<Response<dynamic>?> getReq({url, body}) async {
    try {
      final response = await _dio.get(
        url,
        data: body,
      );

      if (response.statusCode == 200) {
        return response;
      } else {
        throw DioRequestException("HTTP error: ${response.statusCode}");
      }
    } catch (e) {
      handleDioError(e);
    }
    return null;
  }

  Future<Response<dynamic>?> getUri({page, apiKey, path}) async {
    try {
      final uri = Uri(
        scheme: 'https',
        host: 'api.themoviedb.org',
        path: path,
        queryParameters: {
          'api_key': apiKey,
          'include_adult': 'true',
          'page': '$page',
        },
      );
      final response = await _dio.getUri(uri);

      if (response.statusCode == 200) {
        return response;
      } else {
        throw DioRequestException("HTTP error: ${response.statusCode}");
      }
    } catch (e) {
      handleDioError(e);
    }
    return null;
  }

  Future<Response<dynamic>?> postReq({url, body}) async {
    try {
      final response = await _dio.post(
        url,
        data: body,
      );

      if (response.statusCode == 200) {
        return response;
      } else {
        throw DioRequestException("HTTP error: ${response.statusCode}");
      }
    } catch (e) {
      handleDioError(e);
    }
    return null;
  }

  Future<Response<dynamic>?> putReq({url, body}) async {
    try {
      final response = await _dio.put(
        url,
        data: body,
      );

      if (response.statusCode == 200) {
        return response;
      } else {
        throw DioRequestException("HTTP error: ${response.statusCode}");
      }
    } catch (e) {
      handleDioError(e);
    }
    return null;
  }

  Future<Response<dynamic>?> deleteReq({url, body}) async {
    try {
      final response = await _dio.delete(
        url,
        data: body,
      );

      if (response.statusCode == 200) {
        return response;
      } else {
        throw DioRequestException("HTTP error: ${response.statusCode}");
      }
    } catch (e) {
      handleDioError(e);
    }
    return null;
  }

  void handleDioError(dynamic e) {
    // Handle Dio errors
    if (e is DioException) {
      throw DioRequestException("Dio error: ${e.message}");
    }

    // Handle other unexpected errors
    debugPrint("Unexpected error in DioRequest: $e");
  }
}
