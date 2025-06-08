part of 'leagues_cubit.dart';

@immutable
sealed class LeaguesState {}

final class LeaguesInitial extends LeaguesState {}

final class LeaguesLoading extends LeaguesState {}

class LeaguesLoaded extends LeaguesState {
  final List<LeagueModel> leagues;
  LeaguesLoaded(this.leagues);
}

class LeaguesError extends LeaguesState {
  final String message;
  LeaguesError(this.message);
}
