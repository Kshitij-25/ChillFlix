import 'package:chillflix2/data/models/movies.dart';
import 'package:dio/dio.dart';

import '../../main.dart';
import '../constants/api_client.dart';
import '../constants/api_constants.dart';

class SearchDataSource {
  final DioRequest dioRequest = DioRequest();

  Future<List<Movies>?>? multiSearch(query) async {
    final url = "${ApiConstants.BASE_URL}/search/multi?query=$query&include_adult=true&page=1&api_key=${ApiConstants.API_KEY}";
    try {
      Response? response = await dioRequest.getReq(
        url: url,
      );
      if (response!.statusCode == 200) {
        List<dynamic> jsonList = response.data['results'];
        List<Movies> multiSearch = jsonList.map((json) => Movies.fromJson(json)).toList();
        logger.d("multiSearch URL===> $url ====> $multiSearch");
        return multiSearch;
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      logger.e('SearchDataSource - multiSearch: $e');
      return [];
    }
  }
}
