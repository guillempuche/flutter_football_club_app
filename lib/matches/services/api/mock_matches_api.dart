import 'i_matches_api.dart';
import '../../entities/match_entity.dart';

class MockMatchesApi extends IMatchesApi {
  @override
  Future<List<MatchEntity>> getMatches() =>
      Future.delayed(_delay, () => _matches);
}

const _delay = Duration(milliseconds: 100);
List<MatchEntity> _matches = [
  MatchEntity(
    id: '7ce6c285-8c60-491d-966b-0af46f499d00',
    localTeam: 'CF Preses',
    visitingTeam: 'Bescano EF',
    dateTime: DateTime.utc(2021, 3, 1),
    address: 'Carrer Major, 1, Les Preses, 17178, Espanya',
  ),
  MatchEntity(
    id: '0ce6c285-8c60-491d-966b-0af46f499d00',
    localTeam: 'Cellera FC',
    visitingTeam: 'CF Preses',
    dateTime: DateTime.utc(2021, 2, 27),
    address: 'Carrer Major, 1, 17000, Girona, Espanya',
  ),
  MatchEntity(
    id: '1ce6c285-8c60-491d-966b-0af46f499d00',
    localTeam: 'CF Preses',
    visitingTeam: 'Olot FC',
    dateTime: DateTime.utc(2021, 2, 15),
    address: 'Carrer Major, 1, 17800, Olot, Espanya',
  ),
];
