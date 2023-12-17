import 'package:freezed_annotation/freezed_annotation.dart';

import 'live_data.dart';

part 'live_pk_data.g.dart';

@JsonSerializable()
class LivePkData {
  final Pk pk;
  final List<LiveData> lives;
  final Game? game;
  final Round? latestRound;

  LivePkData({
    required this.pk,
    required this.lives,
    this.game,
    this.latestRound,
  });

  factory LivePkData.fromJson(Map<String, dynamic> json) =>
      _$LivePkDataFromJson(json);
}

@JsonSerializable()
class Pk {
  @JsonKey(name: 'hostId')
  final int hostID;
  final int id;

  Pk({required this.id, required this.hostID});

  factory Pk.fromJson(Map<String, dynamic> json) => _$PkFromJson(json);
}

@JsonSerializable()
class Game {
  final int id;
  final int roundCount;
  final int roundDurationSecond;
  final int roundTimeBreak;

  Game({
    required this.id,
    required this.roundCount,
    required this.roundDurationSecond,
    required this.roundTimeBreak,
  });

  factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);
}

@JsonSerializable()
class Round {
  final int roundId;
  final int gameId;
  final DateTime endAt;
  final DateTime createdAt;

  Round({
    required this.roundId,
    required this.gameId,
    required this.endAt,
    required this.createdAt,
  });

  factory Round.fromJson(Map<String, dynamic> json) => _$RoundFromJson(json);
}
