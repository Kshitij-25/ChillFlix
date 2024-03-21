import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioRequestException implements Exception {
  final String message;

  DioRequestException(this.message);

  @override
  String toString() => 'DioRequestException: $message';
}

class ApiClient {
  Dio dio = Dio();

  Future<Response<dynamic>?> getReq({url, body}) async {
    try {
      final response = await dio.get(
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

  Future<Response<dynamic>?> postReq({url, body}) async {
    try {
      final response = await dio.post(
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
      final response = await dio.put(
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
      final response = await dio.delete(
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
