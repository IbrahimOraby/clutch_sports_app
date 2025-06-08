import 'package:clutch_sports_app/data/models/topscorers_model.dart';
import 'package:dio/dio.dart';

class TopscorersRepo {
  final Dio dio = Dio();

  Future<TopscorersResponseModel?> getTopScorers(int leagueId) async {
    try {
      final response = await dio.get(
        'https://apiv2.allsportsapi.com/football/',
        queryParameters: {
          'met': 'Topscorers',
          'leagueId': leagueId,
          'APIkey':
              '5ac38244313c159b722b85acc0be74f48334e62eb259e2155a655ae9491f4f3d',
        },
      );

      if (response.statusCode! > 299) {
        return null;
      } else {
        TopscorersResponseModel topScorersResponseModel =
            TopscorersResponseModel.fromJson(response.data);
        return topScorersResponseModel;
      }
    } catch (e) {
      print('Error fetching teams: $e');
      return null;
    }
  }
}
