part of 'teams_cubit.dart';

@immutable
sealed class TeamsState {}

final class TeamsInitial extends TeamsState {}

final class TeamsLoading extends TeamsState {}

class TeamsLoaded extends TeamsState {
  final List<TeamModel> teams;
  TeamsLoaded(this.teams);
}

class TeamsError extends TeamsState {
  final String message;
  TeamsError(this.message);
}
