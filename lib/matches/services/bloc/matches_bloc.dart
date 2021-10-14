import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../api/i_matches_api.dart';
import '../../entities/match_entity.dart';

part 'matches_event.dart';
part 'matches_state.dart';

class MatchesBloc extends Bloc<MatchesEvent, MatchesState> {
  MatchesBloc({required this.matchesApi})
      : super(MatchesStateFetchInProgress()) {
    on<MatchesEventFetched>(_onMatchesEventFetched);
    on<MatchesEventFavoriteAdded>(_onMatchesEventFavoriteAdded);
    on<MatchesEventFavoriteRemoved>(_onMatchesEventFavoriteRemoved);
  }

  final IMatchesApi matchesApi;

  void _onMatchesEventFetched(_, Emitter<MatchesState> emit) async {
    emit(MatchesStateFetchInProgress());

    try {
      final List<MatchEntity> matches = await matchesApi.getMatches();

      emit(MatchesStateFetchSuccess(matches));
    } catch (err) {
      emit(MatchesStateFetchFailure(err.toString()));
    }
  }

  void _onMatchesEventFavoriteAdded(
    MatchesEventFavoriteAdded event,
    Emitter<MatchesState> emit,
  ) {
    final state = this.state;

    if (state is MatchesStateFavoritesUpdate) {
      emit(MatchesStateFavoritesUpdate(ids: [
        ...state.ids,
        event.id,
      ]));
    }
  }

  void _onMatchesEventFavoriteRemoved(
      MatchesEventFavoriteRemoved event, Emitter<MatchesState> emit) {
    final state = this.state;

    if (state is MatchesStateFavoritesUpdate) {
      emit(MatchesStateFavoritesUpdate(ids: [...state.ids]..remove(event.id)));
    }
  }
}
