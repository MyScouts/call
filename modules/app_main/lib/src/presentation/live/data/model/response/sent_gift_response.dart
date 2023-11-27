import 'package:app_core/app_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/gift_card_list.dart';

part 'sent_gift_response.freezed.dart';

part 'sent_gift_response.g.dart';

@freezed
class SentGiftResponse with _$SentGiftResponse {
  const factory SentGiftResponse({
    GiftCard? giftCard,
    User? giver,
    int? total,
  }) = _SentGiftResponse;

  factory SentGiftResponse.fromJson(Map<String, Object?> json) => _$SentGiftResponseFromJson(json);
}
