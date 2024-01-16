import 'package:dio/dio.dart';

class DioRequestException implements Exception {
  final String message;

  DioRequestException(this.message);

  @override
  String toString() => 'DioRequestException: $message';
}

class DioRequest {
  Dio dio = Dio();

  Future<Response<dynamic>> getReq({url, body}) async {
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
      // Handle Dio errors
      if (e is DioException) {
        throw DioRequestException("Dio error: ${e.message}");
      }

      // Handle other unexpected errors
      print("Unexpected error in getReq: $e");
      rethrow;
    }
  }

  Future<Response<dynamic>> postReq({url, body}) async {
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
      // Handle Dio errors
      if (e is DioException) {
        throw DioRequestException("Dio error: ${e.message}");
      }

      // Handle other unexpected errors
      print("Unexpected error in postReq: $e");
      rethrow;
    }
  }
}
