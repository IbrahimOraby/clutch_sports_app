class TeamsResponseModel {
  final int success;
  final List<TeamModel> result;

  TeamsResponseModel({required this.success, required this.result});

  factory TeamsResponseModel.fromJson(Map<String, dynamic> json) {
    return TeamsResponseModel(
      success: json['success'] ?? 0,
      result: (json['result'] as List)
          .map((item) => TeamModel.fromJson(item))
          .toList(),
    );
  }
}

class TeamModel {
  final int? teamKey;
  final String? teamName;
  final String? teamLogo;

  TeamModel({required this.teamKey, required this.teamName, this.teamLogo});

  factory TeamModel.fromJson(Map<String, dynamic> json) {
    return TeamModel(
      teamKey: json['team_key'],
      teamName: json['team_name'],
      teamLogo: json['team_logo'],
    );
  }
}
