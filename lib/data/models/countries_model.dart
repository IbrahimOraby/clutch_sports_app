class CountriesResponseModel {
  final int success;
  final List result;

  CountriesResponseModel({required this.success, required this.result});

  factory CountriesResponseModel.fromJson(Map<String, dynamic> json) {
    return CountriesResponseModel(
      success: json['success'] ?? 0,
      result: (json['result'] as List)
          .map((countryJson) => CountriesModel.fromJson(countryJson))
          .toList(),
    );
  }
}

class CountriesModel {
  final int? country_key;
  final String? country_name;
  final String? country_iso2;
  final String? country_logo;

  CountriesModel({
    this.country_key,
    this.country_name,
    this.country_iso2,
    this.country_logo,
  });

  factory CountriesModel.fromJson(Map<String, dynamic> json) {
    return CountriesModel(
      country_key: json['country_key'],
      country_name: json['country_name'],
      country_iso2: json['country_iso2'],
      country_logo: json['country_logo'],
    );
  }
}
