import 'package:app_main/src/data/models/responses/call/member_dto.dart';
import 'package:app_main/src/domain/entities/call/call_group_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'call_group_dto.g.dart';

@JsonSerializable()
class CallGroupDto extends CallGroupModel {
  factory CallGroupDto.fromJson(Map<String, dynamic> json) => _$CallGroupDtoFromJson(json);

  CallGroupDto({required this.id, required this.members, required this.name, required this.type});

  Map<String, dynamic> toJson() => _$CallGroupDtoToJson(this);

  @override
  final int id;

  @override
  final List<MemberDto> members;

  @override
  final String? name;

  @override
  final int type;
}
