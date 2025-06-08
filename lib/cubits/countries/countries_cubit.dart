import 'package:bloc/bloc.dart';
import 'package:clutch_sports_app/data/models/countries_model.dart';
import 'package:clutch_sports_app/data/repos/countries_repo.dart';
import 'package:flutter/cupertino.dart';

part 'countries_state.dart';

class CountriesCubit extends Cubit<CountriesState> {
  final CountriesRepo countriesRepo;

  CountriesCubit(this.countriesRepo) : super(CountriesInitial());

  Future<void> fetchCountries() async {
    emit(CountriesLoading());

    try {
      final CountriesResponseModel? response = await countriesRepo
          .getCountries();
      if (response == null) {
        emit(CountriesError('No Data Found'));
      } else {
        emit(CountriesLoaded(response.result));
      }
    } catch (e) {
      emit(CountriesError(e.toString()));
    }
  }
}
