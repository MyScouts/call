// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_pk_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LivePkData _$LivePkDataFromJson(Map<String, dynamic> json) => LivePkData(
      pk: Pk.fromJson(json['pk'] as Map<String, dynamic>),
      lives: (json['lives'] as List<dynamic>)
          .map((e) => LiveData.fromJson(e as Map<String, dynamic>))
          .toList(),
      game: json['game'] == null
          ? null
          : Game.fromJson(json['game'] as Map<String, dynamic>),
      latestRound: json['latestRound'] == null
          ? null
          : Round.fromJson(json['latestRound'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LivePkDataToJson(LivePkData instance) =>
    <String, dynamic>{
      'pk': instance.pk,
      'lives': instance.lives,
      'game': instance.game,
      'latestRound': instance.latestRound,
    };

Pk _$PkFromJson(Map<String, dynamic> json) => Pk(
      id: json['id'] as int,
      hostID: json['hostId'] as int,
    );

Map<String, dynamic> _$PkToJson(Pk instance) => <String, dynamic>{
      'hostId': instance.hostID,
      'id': instance.id,
    };

Game _$GameFromJson(Map<String, dynamic> json) => Game(
      id: json['id'] as int,
      roundCount: json['roundCount'] as int,
      roundDurationSecond: json['roundDurationSecond'] as int,
      roundTimeBreak: json['roundTimeBreak'] as int,
    );

Map<String, dynamic> _$GameToJson(Game instance) => <String, dynamic>{
      'id': instance.id,
      'roundCount': instance.roundCount,
      'roundDurationSecond': instance.roundDurationSecond,
      'roundTimeBreak': instance.roundTimeBreak,
    };

Round _$RoundFromJson(Map<String, dynamic> json) => Round(
      roundId: json['roundId'] as int,
      gameId: json['gameId'] as int,
      endAt: DateTime.parse(json['endAt'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$RoundToJson(Round instance) => <String, dynamic>{
      'roundId': instance.roundId,
      'gameId': instance.gameId,
      'endAt': instance.endAt.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
    };
