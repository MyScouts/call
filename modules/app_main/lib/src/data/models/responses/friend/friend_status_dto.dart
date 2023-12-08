

import 'package:app_main/src/data/models/responses/friend/relation_dto.dart';
import 'package:app_main/src/data/models/responses/friend/stats_dto.dart';
import 'package:app_main/src/domain/entities/friend/friend_status_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'friend_status_dto.g.dart';

@JsonSerializable()
class FriendStatusDto extends FriendStatusModel {
  
  factory FriendStatusDto.fromJson(Map<String, dynamic> json) => _$FriendStatusDtoFromJson(json);

  FriendStatusDto({required this.relation, required this.stats});

  Map<String, dynamic> toJson() => _$FriendStatusDtoToJson(this);

  @override
  final RelationDto relation;

  @override
  final StatsDto stats;
}