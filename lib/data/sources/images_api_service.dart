import 'package:chillflix2/data/models/images.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../constants/api_client.dart';
import '../constants/api_constants.dart';

class ImagesApiService {
  final DioRequest dioRequest = DioRequest();

  Future<List<Images>?>? getImages(movieId) async {
    final url = "${ApiConstants.BASE_URL}/movie/$movieId/images?api_key=${ApiConstants.API_KEY}";

    try {
      Response response = await dioRequest.getReq(
        url: url,
      );
      if (response.statusCode == 200) {
        List<dynamic> jsonList = response.data;
        List<Images> popular = jsonList.map((json) => Images.fromJson(json)).toList();
        print("GETPOPULAR URL===> $url ====> $popular");
        return popular;
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      print(e);
      return [];
    }
    return [];
  }
}
