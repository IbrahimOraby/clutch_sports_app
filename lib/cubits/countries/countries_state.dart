part of 'countries_cubit.dart';

@immutable
sealed class CountriesState {}

final class CountriesInitial extends CountriesState {}

final class CountriesLoading extends CountriesState {}

class CountriesLoaded extends CountriesState {
  final List<CountriesModel> countries;
  CountriesLoaded(this.countries);
}

class CountriesError extends CountriesState {
  final String message;
  CountriesError(this.message);
}
