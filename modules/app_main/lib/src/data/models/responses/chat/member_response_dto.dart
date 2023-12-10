
import 'package:app_main/src/domain/entities/chat/member_response_model.dart';
import 'package:json_annotation/json_annotation.dart';

import 'member_dto.dart';
part 'member_response_dto.g.dart';

@JsonSerializable()
class MemberResponseDto extends MemberResponseModel {

  factory MemberResponseDto.fromJson(Map<String, dynamic> json) => _$MemberResponseDtoFromJson(json);

  MemberResponseDto(this.member, this.type);

  Map<String, dynamic> toJson() => _$MemberResponseDtoToJson(this);

  @override
  final MemberDto member;

  @override
  final int? type;
}