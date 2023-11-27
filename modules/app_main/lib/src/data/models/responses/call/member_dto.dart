
import 'package:app_main/src/data/models/responses/friend/friend_dto.dart';
import 'package:app_main/src/domain/entities/call/member_model.dart';
import 'package:app_main/src/domain/entities/friend/friend_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'member_dto.g.dart';

@JsonSerializable()
class MemberDto extends MemberModel {

  factory MemberDto.fromJson(Map<String, dynamic> json) => _$MemberDtoFromJson(json);

  MemberDto({required this.member});

  Map<String, dynamic> toJson() => _$MemberDtoToJson(this);

  @override
  final FriendDto member;
}