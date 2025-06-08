import 'package:bloc/bloc.dart';
import 'package:clutch_sports_app/data/models/countries_model.dart';
import 'package:clutch_sports_app/data/repos/countries_repo.dart';
import 'package:meta/meta.dart';

part 'countries_state.dart';

class CountriesCubit extends Cubit<CountriesState> {
  final CountriesRepo countriesRepo;

  CountriesCubit(this.countriesRepo) : super(CountriesCubitInitial());

  Future<void> getCountries() async {
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
