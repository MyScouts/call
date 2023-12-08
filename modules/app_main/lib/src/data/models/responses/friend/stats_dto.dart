import 'package:app_main/src/domain/entities/friend/stats_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'stats_dto.g.dart';

@JsonSerializable()
class StatsDto extends StatsModel {
  factory StatsDto.fromJson(Map<String, dynamic> json) => _$StatsDtoFromJson(json);

  StatsDto({required this.followeeCount, required this.followerCount, required this.friendCount});

  Map<String, dynamic> toJson() => _$StatsDtoToJson(this);

  @override
  final int followeeCount;

  @override
  final int followerCount;

  @override
  final int friendCount;
}
