import 'package:app_main/src/domain/entities/friend/relation_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'relation_dto.g.dart';

@JsonSerializable()
class RelationDto extends RelationModel {
  factory RelationDto.fromJson(Map<String, dynamic> json) => _$RelationDtoFromJson(json);

  RelationDto(
      {required this.hasPendingApproval,
      required this.isBlocked,
      required this.isBlocking,
      required this.isFollowee,
      required this.isFollower,
      required this.isFriend});

  Map<String, dynamic> toJson() => _$RelationDtoToJson(this);

  @override
  final bool hasPendingApproval;

  @override
  final bool isBlocked;

  @override
  final bool isBlocking;

  @override
  final bool isFollowee;

  @override
  final bool isFollower;

  @override
  final bool isFriend;
}
