import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class MatchEntity extends Equatable {
  MatchEntity({
    id,
    required localTeam,
    required visitingTeam,
    required dateTime, // In UTC
    required address,
  })  : _id = id ?? const Uuid().v4(),
        _localTeam = localTeam,
        _visitingTeam = visitingTeam,
        _dateTime = dateTime,
        _address = address;

  final String _id;
  final String _localTeam;
  final String _visitingTeam;
  final DateTime _dateTime;
  final String _address;

  String get id => _id;
  String get localTeam => _localTeam;
  String get visitingTeam => _visitingTeam;
  DateTime get dateTime => _dateTime;
  String get address => _address;

  @override
  List<Object> get props => [
        _id,
        _localTeam,
        _visitingTeam,
        _dateTime,
        _address,
      ];
}
