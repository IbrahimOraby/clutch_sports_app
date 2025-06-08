class LeaguesResponseModel {
  final int success;
  final List<LeagueModel> result;

  LeaguesResponseModel({required this.success, required this.result});

  factory LeaguesResponseModel.fromJson(Map<String, dynamic> json) {
    return LeaguesResponseModel(
      success: json['success'] ?? 0,
      result: (json['result'] as List)
          .map((leagueJson) => LeagueModel.fromJson(leagueJson))
          .toList(),
    );
  }
}

class LeagueModel {
  final int? league_key;
  final String? league_name;
  final int? country_key;
  final String? country_name;
  final String? league_logo;
  final String? country_logo;

  LeagueModel({
    this.league_key,
    this.league_name,
    this.country_key,
    this.country_name,
    this.league_logo,
    this.country_logo,
  });

  factory LeagueModel.fromJson(Map<String, dynamic> json) {
    return LeagueModel(
      league_key: json['league_key'],
      league_name: json['league_name'],
      country_key: json['country_key'],
      country_name: json['country_name'],
      league_logo: json['league_logo'],
      country_logo: json['country_logo'],
    );
  }
}
