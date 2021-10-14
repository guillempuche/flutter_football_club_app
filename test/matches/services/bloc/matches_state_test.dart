import 'package:flutter_test/flutter_test.dart';
import 'package:local_football_club/matches/services/bloc/matches_bloc.dart';

import '../../../mocks.dart';

void main() {
  group('MatchesState', () {
    List<String> ids = [];
    for (var match in mockMatches) {
      ids.add(match.id);
    }
    test('MatchesStateFetchInProgress supports value comparisons', () {
      expect(MatchesStateFetchInProgress(), MatchesStateFetchInProgress());
    });

    test('MatchesStateFetchFailure supports value comparisons', () {
      String message = 'error';
      expect(
          MatchesStateFetchFailure(message), MatchesStateFetchFailure(message));
    });

    test('MatchesStateFetchSuccess supports value comparisons', () {
      expect(MatchesStateFetchSuccess(mockMatches),
          MatchesStateFetchSuccess(mockMatches));
    });

    test('MatchesStateFavoritesUpdate supports value comparisons', () {
      expect(MatchesStateFavoritesUpdate(ids: ids),
          MatchesStateFavoritesUpdate(ids: ids));
      expect(const MatchesStateFavoritesUpdate(),
          const MatchesStateFavoritesUpdate());
    });
  });
}
