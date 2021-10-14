import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:local_football_club/matches/services/bloc/matches_bloc.dart';

import '../../../mocks.dart';

void main() {
  group('MatchesEvent', () {
    test('MatchesEventFetched supports value comparison', () {
      expect(MatchesEventFetched(), MatchesEventFetched());
    });

    test('MatchesEventFavoriteAdded supports value comparison', () {
      String id = mockMatches[0].id;
      expect(MatchesEventFavoriteAdded(id), MatchesEventFavoriteAdded(id));
    });

    test('MatchesEventFavoriteRemoved supports value comparison', () {
      String id = mockMatches[0].id;
      expect(MatchesEventFavoriteRemoved(id), MatchesEventFavoriteRemoved(id));
    });
  });
}
