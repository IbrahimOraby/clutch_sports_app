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
  final int? leagueKey;
  final String? leagueName;
  final int? countryKey;
  final String? countryName;
  final String? leagueLogo;
  final String? countryLogo;

  LeagueModel({
    this.leagueKey,
    this.leagueName,
    this.countryKey,
    this.countryName,
    this.leagueLogo,
    this.countryLogo,
  });

  factory LeagueModel.fromJson(Map<String, dynamic> json) {
    return LeagueModel(
      leagueKey: json['league_key'],
      leagueName: json['league_name'],
      countryKey: json['country_key'],
      countryName: json['country_name'],
      leagueLogo: json['league_logo'],
      countryLogo: json['country_logo'],
    );
  }
}
