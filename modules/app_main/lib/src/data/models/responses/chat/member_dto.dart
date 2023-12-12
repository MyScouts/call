import 'package:app_main/src/domain/entities/chat/member_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'member_dto.g.dart';

@JsonSerializable()
class MemberDto extends MemberModel {
  factory MemberDto.fromJson(Map<String, dynamic> json) => _$MemberDtoFromJson(json);

  MemberDto(
      {required this.avatar,
      required this.type,
      required this.birthday,
      required this.displayName,
      required this.fullName,
      required this.id,
      required this.pDoneId,
      required this.sexCode});

  Map<String, dynamic> toJson() => _$MemberDtoToJson(this);

  @override
  final String? avatar;

  @override
  final String? birthday;

  @override
  final String? displayName;

  @override
  final String? fullName;

  @override
  final int id;

  @override
  final String? pDoneId;

  @override
  final int? sexCode;

  @override
  final int type;
}
