import 'package:local_football_club/matches/entities/match_entity.dart';

abstract class IMatchesApi {
  Future<List<MatchEntity>> getMatches();
}

abstract class IMatchesApiException implements Exception {
  const IMatchesApiException(this.error);

  final String error;

  @override
  String toString() {
    String result = 'IMatchesApiException';

    if (error is String) return '$result: $error';

    return result;
  }
}
