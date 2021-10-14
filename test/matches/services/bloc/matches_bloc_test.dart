import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:local_football_club/matches/services/api/i_matches_api.dart';
import 'package:local_football_club/matches/services/api/mock_matches_api.dart';
import 'package:local_football_club/matches/services/bloc/matches_bloc.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';

class MockingMockMatchesApi extends Mock implements MockMatchesApi {}

void main() {
  group('MatchesBloc', () {
    late IMatchesApi mockMatchesApi;
    List<String> ids = [];

    setUp(() {
      mockMatchesApi = MockingMockMatchesApi();

      for (var match in mockMatches) {
        ids.add(match.id);
      }
    });

    test('initial state is MatchesFetchInProgress', () {
      expect(MatchesBloc(matchesApi: mockMatchesApi).state,
          MatchesStateFetchInProgress());
    });

    blocTest<MatchesBloc, MatchesState>(
      'emits [MatchesStateFetchInProgress, MatchesStateFetchSuccess] when'
      'fetching has been successful',
      setUp: () {
        when(mockMatchesApi.getMatches).thenAnswer((_) async => mockMatches);
      },
      build: () => MatchesBloc(matchesApi: mockMatchesApi),
      act: (bloc) => bloc.add(MatchesEventFetched()),
      expect: () => <MatchesState>[
        MatchesStateFetchInProgress(),
        MatchesStateFetchSuccess(mockMatches),
      ],
      verify: (_) => verify(mockMatchesApi.getMatches).called(1),
    );

    blocTest<MatchesBloc, MatchesState>(
      'emits [MatchesStateFetchInProgress, MatchesStateFetchFailure] when '
      'fetching throws an error',
      setUp: () {
        when(mockMatchesApi.getMatches).thenThrow('error');
      },
      build: () => MatchesBloc(matchesApi: mockMatchesApi),
      act: (bloc) => bloc.add(MatchesEventFetched()),
      expect: () => <MatchesState>[
        MatchesStateFetchInProgress(),
        const MatchesStateFetchFailure('error')
      ],
      verify: (_) => verify(mockMatchesApi.getMatches).called(1),
    );

    blocTest<MatchesBloc, MatchesState>(
      'emits [MatchesStateFavoritesUpdate] when id is added',
      build: () => MatchesBloc(matchesApi: mockMatchesApi),
      seed: () => MatchesStateFavoritesUpdate(ids: ids),
      act: (bloc) => bloc.add(const MatchesEventFavoriteAdded('1234')),
      expect: () => <MatchesState>[
        MatchesStateFavoritesUpdate(ids: [...ids, '1234']),
      ],
    );

    blocTest<MatchesBloc, MatchesState>(
      'emits [MatchesStateFavoritesRemove] when id is removed',
      build: () => MatchesBloc(matchesApi: mockMatchesApi),
      seed: () => MatchesStateFavoritesUpdate(ids: ids),
      act: (bloc) => bloc.add(MatchesEventFavoriteRemoved(ids.last)),
      expect: () => <MatchesState>[
        MatchesStateFavoritesUpdate(ids: ids.sublist(0, ids.length - 1)),
      ],
    );
  });
}
