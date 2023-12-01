import 'package:freezed_annotation/freezed_annotation.dart';

part 'marshop_response.freezed.dart';
part 'marshop_response.g.dart';

@freezed
class ListMarshopResponse with _$ListMarshopResponse {
  const factory ListMarshopResponse({
    required int total,
    required List<MarshopInfo> marshops,
  }) = _ListMarshopResponse;

  factory ListMarshopResponse.fromJson(Map<String, dynamic> json) =>
      _$ListMarshopResponseFromJson(json);
}

@freezed
class MarshopInfo with _$MarshopInfo {
  const factory MarshopInfo({
    required int id,
    required String name,
    required String code,
    required MarshopUserInfo user,
  }) = _MarshopInfo;

  factory MarshopInfo.fromJson(Map<String, dynamic> json) =>
      _$MarshopInfoFromJson(json);
}

@freezed
class MarshopUserInfo with _$MarshopUserInfo {
  const factory MarshopUserInfo({
    required int id,
    required String displayName,
    required String pDoneId,
    String? fullName,
    String? birthday,
  }) = _MarshopUserInfo;

  factory MarshopUserInfo.fromJson(Map<String, dynamic> json) =>
      _$MarshopUserInfoFromJson(json);
}
