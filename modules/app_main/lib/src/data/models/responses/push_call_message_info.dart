// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'push_call_message_info.freezed.dart';
part 'push_call_message_info.g.dart';

@freezed
class PushCallMessageInfo with _$PushCallMessageInfo {
  const factory PushCallMessageInfo({
    String? callId,
    int? serial,
    String? callStatus,
    CallUserInfo? from,
    CallUserInfo? to,
    int? projectId,
  }) = _PushCallMessageInfo;

  factory PushCallMessageInfo.fromJson(Map<String, dynamic> json) =>
      _$PushCallMessageInfoFromJson(json);
}

extension PushCallMessageInfoExt on PushCallMessageInfo {
  bool get isCreated => callStatus == 'created';
  bool get isStarted => callStatus == 'started';
  bool get isEnded => callStatus == 'ended';
}

@freezed
class CallUserInfo with _$CallUserInfo {
  const factory CallUserInfo({
    String? number,
    String? alias,
    @JsonKey(name: 'is_online') bool? isOnline,
    String? type,
  }) = _CallUserInfo;

  factory CallUserInfo.fromJson(Map<String, dynamic> json) =>
      _$CallUserInfoFromJson(json);
}
