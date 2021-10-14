part of 'matches_bloc.dart';

abstract class MatchesState extends Equatable {
  const MatchesState();

  @override
  List<Object> get props => [];
}

class MatchesStateFetchInProgress extends MatchesState {}

class MatchesStateFetchFailure extends MatchesState {
  const MatchesStateFetchFailure(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}

class MatchesStateFetchSuccess extends MatchesState {
  const MatchesStateFetchSuccess(this.matches);

  final List<MatchEntity> matches;

  @override
  List<Object> get props => [matches];
}

class MatchesStateFavoritesUpdate extends MatchesState {
  const MatchesStateFavoritesUpdate({this.ids = const []});

  final List<String> ids;

  @override
  List<Object> get props => [ids];
}
