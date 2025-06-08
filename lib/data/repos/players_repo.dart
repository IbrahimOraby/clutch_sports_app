import 'package:clutch_sports_app/data/models/players_model.dart';
import 'package:dio/dio.dart';

class PlayersRepo {
  final Dio dio = Dio();

  Future<PlayersResponseModel?> getSquadPlayers(int teamId) async {
    try {
      final response = await dio.get(
        'https://apiv2.allsportsapi.com/football/',
        queryParameters: {
          'met': 'Players',
          'teamId': teamId,
          'APIkey':
              '5ac38244313c159b722b85acc0be74f48334e62eb259e2155a655ae9491f4f3d',
        },
      );

      if (response.statusCode! > 299) {
        return null;
      } else {
        PlayersResponseModel playersResponseModel =
            PlayersResponseModel.fromJson(response.data);
        return playersResponseModel;
      }
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}
