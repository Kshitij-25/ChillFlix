import 'package:chillflix2/data/models/movies.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../core/common/api.dart';

class PopularApiService {
  String? apiKey = dotenv.env['API_KEY_AUTH'];
  String? baseUrl = dotenv.env['API_URL'];
  final DioRequest dioRequest = DioRequest();

  Future<List<Movies>?>? getPopular(page) async {
    final url = "$baseUrl/movie/popular?api_key=$apiKey&page=$page";

    try {
      Response response = await dioRequest.getReq(
        url: url,
      );
      if (response.statusCode == 200) {
        List<dynamic> jsonList = response.data['results'];
        List<Movies> popular = jsonList.map((json) => Movies.fromJson(json)).toList();
        print("GETPOPULAR URL===> $url ====> $popular");
        return popular;
      }
    } catch (e) {
      print(e);
      return [];
    }
    return [];
  }
}
