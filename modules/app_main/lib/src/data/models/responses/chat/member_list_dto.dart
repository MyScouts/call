import 'package:app_main/src/data/models/responses/chat/member_response_dto.dart';
import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/domain/entities/chat/member_list_model.dart';
import 'package:app_main/src/domain/usecases/user_share_preferences_usecase.dart';
import 'package:json_annotation/json_annotation.dart';
part 'member_list_dto.g.dart';

@JsonSerializable()
class MemberListDto extends MemberListModel {
  factory MemberListDto.fromJson(Map<String, dynamic> json) => _$MemberListDtoFromJson(json);

  MemberListDto({required this.count, required this.members});

  Map<String, dynamic> toJson() => _$MemberListDtoToJson(this);

  @override
  final int count;

  @override
  final List<MemberResponseDto> members;

  @override
  List<MemberResponseDto> get membersNotMe => [
        ...members.where((element) =>
            getIt.get<UserSharePreferencesUsecase>().getUserInfo()?.id != element.member.id)
      ];
}
