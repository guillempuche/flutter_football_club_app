import 'package:flutter_test/flutter_test.dart';
import 'package:local_football_club/matches/entities/match_entity.dart';

import '../../mocks.dart';

void main() {
  group('MatchEntity', () {
    test('creates a unique Match entity', () {
      MatchEntity match = mockMatches[0];
      expect(match.runtimeType, MatchEntity);
      expect(match.id.runtimeType, String);
      expect(match.localTeam.runtimeType, String);
      expect(match.visitingTeam.runtimeType, String);
      expect(match.dateTime.runtimeType, DateTime);
      expect(match.address.runtimeType, String);
    });

    test('creates different entities due to different ids', () {
      MatchEntity matchWithId = mockMatchesWithManualId[0];

      MatchEntity matchA = MatchEntity(
        localTeam: matchWithId.localTeam,
        visitingTeam: matchWithId.visitingTeam,
        dateTime: matchWithId.dateTime,
        address: matchWithId.address,
      );
      MatchEntity matchB = MatchEntity(
        id: matchWithId.id,
        localTeam: matchWithId.localTeam,
        visitingTeam: matchWithId.visitingTeam,
        dateTime: matchWithId.dateTime,
        address: matchWithId.address,
      );

      expect(matchA.id, isNot(matchB));
    });
  });
}
