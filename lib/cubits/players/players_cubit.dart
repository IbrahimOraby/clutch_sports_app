import 'package:bloc/bloc.dart';
import 'package:clutch_sports_app/data/models/players_model.dart';
import 'package:clutch_sports_app/data/repos/players_repo.dart';
import 'package:meta/meta.dart';

part 'players_state.dart';

class PlayersCubit extends Cubit<PlayersState> {
  final PlayersRepo playersRepo;
  PlayersCubit(this.playersRepo) : super(PlayersInitial());

  Future<void> fetchPlayersByTeam(int teamId) async {
    emit(PlayersLoading());

    try {
      final PlayersResponseModel? response = await playersRepo.getPlayers(
        teamId,
      );
      if (response == null) {
        emit(PlayersError('No Data Found'));
      } else {
        emit(PlayersLoaded(response.result));
      }
    } catch (e) {
      emit(PlayersError(e.toString()));
    }
  }
}
