// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'gift_card_list.freezed.dart';
part 'gift_card_list.g.dart';

@freezed
class GiftCardList with _$GiftCardList {
  const factory GiftCardList({
    @JsonKey(name: 'giftCards') List<GiftCard>? giftList,
    int? count,
  }) = _GiftCardList;

  factory GiftCardList.fromJson(Map<String, Object?> json) =>
      _$GiftCardListFromJson(json);
}

@freezed
class GiftCard with _$GiftCard {
  const factory GiftCard({
    int? id,
    String? name,
    String? imageGift,
    String? gifUrl,
    int? coinValue,
    int? status,
    int? type,
    String? createdAt,
    String? updatedAt,
    MetaData? metadata,
    dynamic deletedAt,
  }) = _GiftCard;

  factory GiftCard.fromJson(Map<String, Object?> json) =>
      _$GiftCardFromJson(json);
}

@freezed
class MetaData with _$MetaData {
  const factory MetaData({
    bool? isStaticGif,
    @Default(4) dynamic displayTime,
  }) = _MetaData;

  factory MetaData.fromJson(Map<String, Object?> json) =>
      _$MetaDataFromJson(json);
}
