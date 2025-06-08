class TopscorersResponseModel {
  final int success;
  final List<TopscorerModel> result;

  TopscorersResponseModel({required this.success, required this.result});

  factory TopscorersResponseModel.fromJson(Map<String, dynamic> json) {
    return TopscorersResponseModel(
      success: json['success'] ?? 0,
      result: (json['result'] as List)
          .map((item) => TopscorerModel.fromJson(item))
          .toList(),
    );
  }
}

class TopscorerModel {
  final int? playerPlace;
  final String? playerName;
  final int? playerKey;
  final String? teamName;
  final int? teamKey;
  final int? goals;
  final int? assists;
  final int? penaltyGoals;

  TopscorerModel({
    this.playerPlace,
    this.playerName,
    this.playerKey,
    this.teamName,
    this.teamKey,
    this.goals,
    this.assists,
    this.penaltyGoals,
  });

  factory TopscorerModel.fromJson(Map<String, dynamic> json) {
    return TopscorerModel(
      playerPlace: json['player_place'],
      playerName: json['player_name'],
      playerKey: json['player_key'],
      teamName: json['team_name'],
      teamKey: json['team_key'],
      goals: json['goals'],
      assists: json['assists'],
      penaltyGoals: json['penalty_goals'],
    );
  }
}
