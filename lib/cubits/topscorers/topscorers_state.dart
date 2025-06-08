part of 'topscorers_cubit.dart';

@immutable
sealed class TopscorersState {}

final class TopscorersInitial extends TopscorersState {}

final class TopscorersLoading extends TopscorersState {}

class TopscorersLoaded extends TopscorersState {
  final List<TopscorerModel> topscorers;
  TopscorersLoaded(this.topscorers);
}

class TopscorersError extends TopscorersState {
  final String message;
  TopscorersError(this.message);
}
