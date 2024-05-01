import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:tmdb_chillflix/data/core/api_constants.dart';

import '../core/api_client.dart';
import '../models/credits_model.dart';

abstract class CreditsRemoteDataSource {
  Future<CreditsModel>? getCreditsForMovie(movieId);
}

class CreditsRemoteDataSourceImpl implements CreditsRemoteDataSource {
  final ApiClient? _apiClient;
  final Logger? _logger;

  CreditsRemoteDataSourceImpl(this._apiClient, this._logger);

  @override
  Future<CreditsModel>? getCreditsForMovie(movieId) async {
    final url = "${ApiConstants.BASE_URL}/movie/$movieId/credits?api_key=${ApiConstants.API_KEY}";

    try {
      Response? response = await _apiClient!.getReq(
        url: url,
      );
      if (response!.statusCode == 200) {
        var jsonList = response.data;
        _logger!.d("GETCREDITSFORMOVIE URL===> $url ====> $jsonList");
        return CreditsModel.fromJson(jsonList);
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      _logger!.e('CreditsRemoteDataSourceImpl - getCreditsForMovie: $e');
      return CreditsModel();
    }
  }
}
