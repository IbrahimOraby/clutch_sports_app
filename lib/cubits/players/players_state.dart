part of 'players_cubit.dart';

@immutable
sealed class PlayersState {}

final class PlayersInitial extends PlayersState {}

final class PlayersLoading extends PlayersState {}

class PlayersLoaded extends PlayersState {
  final List<PlayerModel> players;
  PlayersLoaded(this.players);
}

class PlayersError extends PlayersState {
  final String message;
  PlayersError(this.message);
}
