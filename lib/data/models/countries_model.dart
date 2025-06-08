class CountriesResponseModel {
  final int success;
  final List<CountriesModel> result;

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
  final int? countryKey;
  final String? countryName;
  final String? countryIso2;
  final String? countryLogo;

  CountriesModel({
    this.countryKey,
    this.countryName,
    this.countryIso2,
    this.countryLogo,
  });

  factory CountriesModel.fromJson(Map<String, dynamic> json) {
    return CountriesModel(
      countryKey: json['country_key'],
      countryName: json['country_name'],
      countryIso2: json['country_iso2'],
      countryLogo: json['country_logo'],
    );
  }
}
