import 'package:chillflix2/data/models/movies.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../core/common/api.dart';

class NowPlayingApiService {
  String? apiKey = dotenv.env['API_KEY_AUTH'];
  String? baseUrl = dotenv.env['API_URL'];
  final DioRequest dioRequest = DioRequest();

  Future<List<Movies>?>? getNowPlaying(page) async {
    final url = "$baseUrl/movie/now_playing?api_key=$apiKey&page=$page";

    try {
      Response response = await dioRequest.getReq(
        url: url,
      );
      if (response.statusCode == 200) {
        List<dynamic> jsonList = response.data['results'];
        List<Movies> nowPlaying = jsonList.map((json) => Movies.fromJson(json)).toList();
        print("GETNOWPLAYING URL===> $url ====> $nowPlaying");
        return nowPlaying;
      }
    } catch (e) {
      print(e);
      return [];
    }
    return [];
  }
}
