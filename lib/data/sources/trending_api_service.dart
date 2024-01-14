import 'package:chillflix2/data/models/movies.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../core/common/api.dart';

class TrendingApiService {
  String? apiKey = dotenv.env['API_KEY_AUTH'];
  String? baseUrl = dotenv.env['API_URL'];
  final DioRequest dioRequest = DioRequest();

  Future<List<Movies>?>? getAllTrending() async {
    final url = "$baseUrl/trending/all/day?api_key=$apiKey";
    try {
      Response response = await dioRequest.getReq(
        url: url,
      );
      if (response.statusCode == 200) {
        List<dynamic> jsonList = response.data['results'];
        List<Movies> allTrending = jsonList.map((json) => Movies.fromJson(json)).toList();
        print("GETALLTRENDING URL===> $url ====> $allTrending");
        return allTrending;
      }
    } catch (e) {
      print(e);
      return [];
    }
    return [];
  }
}
