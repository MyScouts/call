import 'package:app_main/src/data/models/responses/call/call_group_dto.dart';
import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/domain/entities/call/call_history_model.dart';
import 'package:app_main/src/domain/usecases/user_share_preferences_usecase.dart';
import 'package:json_annotation/json_annotation.dart';
part 'call_history_dto.g.dart';

@JsonSerializable()
class CallHistoryDto extends CallHistoryModel {
  factory CallHistoryDto.fromJson(Map<String, dynamic> json) => _$CallHistoryDtoFromJson(json);

  CallHistoryDto({
    required this.callGroup,
    required this.calledAt,
    required this.endedAt,
    required this.id,
    required this.status,
    required this.type,
    required this.callerId,
  });

  Map<String, dynamic> toJson() => _$CallHistoryDtoToJson(this);

  @override
  final CallGroupDto callGroup;

  @override
  final String? calledAt;

  @override
  final String? endedAt;

  @override
  final int id;

  @override
  final int status;

  @override
  final int type;

  @override
  final int callerId;

  @override
  bool get isCaller => callerId == getIt.get<UserSharePreferencesUsecase>().getUserInfo()?.id;

  @override
  String get des =>
      'Cuộc gọi ${type == 3 ? 'nhỡ' : type == 1 ? 'thường' : 'video'} ${type == 3 ? '' : isCaller ? 'đi' : 'đến'}';
}
