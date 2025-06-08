import 'package:bloc/bloc.dart';
import 'package:clutch_sports_app/data/models/leagues_model.dart';
import 'package:clutch_sports_app/data/repos/leagues_repo.dart';
import 'package:flutter/cupertino.dart';

part 'leagues_state.dart';

class LeaguesCubit extends Cubit<LeaguesState> {
  final LeaguesRepo leaguesRepo;
  LeaguesCubit(this.leaguesRepo) : super(LeaguesInitial());

  Future<void> fetchLeagues(int countryId) async {
    emit(LeaguesLoading());

    try {
      final LeaguesResponseModel? response = await leaguesRepo.getLeagues(
        countryId,
      );
      if (response == null) {
        emit(LeaguesError('No Data Found'));
      } else {
        emit(LeaguesLoaded(response.result));
      }
    } catch (e) {
      emit(LeaguesError(e.toString()));
    }
  }
}
