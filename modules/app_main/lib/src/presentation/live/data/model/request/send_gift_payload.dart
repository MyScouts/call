import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_gift_payload.freezed.dart';

part 'send_gift_payload.g.dart';

@freezed
class SendGiftPayload with _$SendGiftPayload {
  const factory SendGiftPayload({
    int? userId,
    int? liveId,
    int? giftId,
    int? total,
  }) = _SendGiftPayload;

  factory SendGiftPayload.fromJson(Map<String, Object?> json) =>
      _$SendGiftPayloadFromJson(json);
}
