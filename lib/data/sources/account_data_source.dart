import 'package:chillflix2/data/constants/api_constants.dart';
import 'package:chillflix2/data/models/account_details.dart';
import 'package:dio/dio.dart';

import '../../main.dart';
import '../constants/api_client.dart';

class AccountDataSource {
  final DioRequest dioRequest = DioRequest();

  Future<AccountDetails?> getAccountDetails() async {
    var sessionId = prefs!.getString("sessionId");

    final url = "${ApiConstants.BASE_URL}/account?session_id=$sessionId&api_key=${ApiConstants.API_KEY}";

    try {
      Response? response = await dioRequest.getReq(
        url: url,
      );
      if (response!.statusCode == 200) {
        logger.d("GETACCOUNTDETAILS URL ===> $url ===> ${response.data}");
        return AccountDetails.fromJson(response.data);
      }
    } catch (e) {
      logger.e('AccountDataSource - getAccountDetails: $e');
    }
    return null;
  }

  Future<String?> addToFavorite(mediaType, mediaId, isFav) async {
    var sessionId = prefs!.getString("sessionId");
    var accountId = prefs!.getString("ACCOUNT_ID");

    final url = "${ApiConstants.BASE_URL}/account/$accountId/favorite?session_id=$sessionId&api_key=${ApiConstants.API_KEY}";

    try {
      Response? response = await dioRequest.postReq(
        url: url,
        body: {
          "media_type": mediaType,
          "media_id": mediaId,
          "favorite": isFav,
        },
      );
      if (response!.statusCode == 200) {
        logger.d("ADDTOFAVORITE URL ===> $url ===> ${response.data}");
        return response.data['status_message'];
      }
    } catch (e) {
      logger.e('AccountDataSource - addToFavorite: $e');
    }
    return null;
  }
}
