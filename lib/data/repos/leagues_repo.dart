import 'dart:developer';
import 'package:clutch_sports_app/data/models/leagues_model.dart';
import 'package:dio/dio.dart';

class LeaguesRepo {
  Dio dio = Dio();

  Future<LeaguesResponseModel?> getLeagues(int countryId) async {
    try {
      var response = await dio.get(
        'https://apiv2.allsportsapi.com/football/',
        queryParameters: {
          'met': 'Leagues',
          'countryId': countryId,
          'APIkey':
              '5ac38244313c159b722b85acc0be74f48334e62eb259e2155a655ae9491f4f3d',
        },
      );
      if (response.statusCode! > 299) {
        return null;
      } else {
        LeaguesResponseModel leaguesResponseModel =
            LeaguesResponseModel.fromJson(response.data);
        return leaguesResponseModel;
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
