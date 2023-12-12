// ignore_for_file: invalid_annotation_target

import 'package:app_core/app_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'custom_call_data.freezed.dart';
part 'custom_call_data.g.dart';

@Freezed()
class CallUser with _$CallUser {
  @JsonSerializable(explicitToJson: true)
  const factory CallUser({
    @JsonKey(name: 'userId', fromJson: asOrNull) int? userId,
    @JsonKey(name: 'name', fromJson: asOrNull) String? name,
    @JsonKey(name: 'avatarUrl', fromJson: asOrNull) String? avatarUrl,
  }) = _CallUser;

  factory CallUser.fromJson(Map<String, dynamic> json) =>
      _$CallUserFromJson(json);
}

@Freezed()
class CustomCallData with _$CustomCallData {
  @JsonSerializable(explicitToJson: true)
  const factory CustomCallData({
    required CallUser caller,
    required CallUser callee,
  }) = _CustomCallData;

  factory CustomCallData.fromJson(Map<String, dynamic> json) =>
      _$CustomCallDataFromJson(json);
}

@Freezed()
class CallDataResult with _$CallDataResult {
  @JsonSerializable(explicitToJson: true)
  const factory CallDataResult({
    @JsonKey(name: 'callerId', fromJson: asOrNull) String? callerId,
    @JsonKey(name: 'calleeId', fromJson: asOrNull) String? calleeId,
    @JsonKey(name: 'startTime', fromJson: asOrNull) DateTime? startTime,
    @JsonKey(name: 'endTime', fromJson: asOrNull) DateTime? endTime,
    @JsonKey(name: 'isVideoCall', fromJson: asOrNull) bool? isVideoCall,
    @JsonKey(name: 'callSignal', fromJson: asOrNull) String? callSignal,
    required String type,
  }) = _CallDataResult;

  factory CallDataResult.fromJson(Map<String, dynamic> json) =>
      _$CallDataResultFromJson(json);
}

extension UserExt on User {
  CallUser get toCallUser => CallUser(
        userId: id,
        name: displayName,
        avatarUrl: avatar,
      );
}
