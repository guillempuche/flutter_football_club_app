import 'package:local_football_club/matches/entities/match_entity.dart';

List<MatchEntity> mockMatchesWithManualId = [
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

List<MatchEntity> mockMatches = [
  MatchEntity(
    localTeam: 'Preses',
    visitingTeam: 'Bescano',
    dateTime: DateTime.utc(2021, 2, 3),
    address: 'Carrer Major, 1, 17800, Olot, Espanya',
  ),
];
