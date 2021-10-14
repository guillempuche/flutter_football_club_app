part of 'matches_bloc.dart';

abstract class MatchesEvent extends Equatable {
  const MatchesEvent();

  @override
  List<Object> get props => [];
}

class MatchesEventFetched extends MatchesEvent {
  // const MatchesEventFetched(this.matches);

  // final List<MatchEntity> matches;

  // @override
  // List<Object> get props => [matches];
}

class MatchesEventFavoriteAdded extends MatchesEvent {
  const MatchesEventFavoriteAdded(this.id);

  final String id;

  @override
  List<Object> get props => [id];
}

class MatchesEventFavoriteRemoved extends MatchesEvent {
  const MatchesEventFavoriteRemoved(this.id);

  final String id;

  @override
  List<Object> get props => [id];
}
