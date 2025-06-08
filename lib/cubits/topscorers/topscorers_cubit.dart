import 'package:bloc/bloc.dart';
import 'package:clutch_sports_app/data/models/topscorers_model.dart';
import 'package:clutch_sports_app/data/repos/topscorers_repo.dart';
import 'package:meta/meta.dart';

part 'topscorers_state.dart';

class TopscorersCubit extends Cubit<TopscorersState> {
  final TopscorersRepo topScorersRepo;

  TopscorersCubit(this.topScorersRepo) : super(TopscorersInitial());

  Future<void> fetchTopscorers(int leagueId) async {
    emit(TopscorersLoading());

    try {
      final TopscorersResponseModel? response = await topScorersRepo
          .getTopScorers(leagueId);
      if (response == null) {
        emit(TopscorersError('No Data Found'));
      } else {
        emit(TopscorersLoaded(response.result));
      }
    } catch (e) {
      emit(TopscorersError(e.toString()));
    }
  }
}
