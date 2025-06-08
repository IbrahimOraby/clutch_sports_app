import 'package:bloc/bloc.dart';
import 'package:clutch_sports_app/data/models/teams_model.dart';
import 'package:clutch_sports_app/data/repos/teams_repo.dart';
import 'package:meta/meta.dart';

part 'teams_state.dart';

class TeamsCubit extends Cubit<TeamsState> {
  final TeamsRepo teamsRepo;

  TeamsCubit(this.teamsRepo) : super(TeamsInitial());

  Future<void> fetchTeams(int leagueId) async {
    emit(TeamsLoading());

    try {
      final TeamsResponseModel? response = await teamsRepo.getTeams(leagueId);
      if (response == null) {
        emit(TeamsError('No Data Found'));
      } else {
        emit(TeamsLoaded(response.result));
      }
    } catch (e) {
      emit(TeamsError(e.toString()));
    }
  }
}
