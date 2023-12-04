import 'package:app_main/src/data/models/responses/chat/member_response_dto.dart';
import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/domain/entities/call/call_group_model.dart';
import 'package:app_main/src/domain/usecases/user_share_preferences_usecase.dart';
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
  final List<MemberResponseDto> members;

  @override
  final String? name;

  @override
  final int type;

  @override
  List<MemberResponseDto> get membersNotMe => members
    ..removeWhere((element) =>
        getIt.get<UserSharePreferencesUsecase>().getUserInfo()?.id == element.member.id);
}
