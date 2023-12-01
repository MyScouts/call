import 'package:freezed_annotation/freezed_annotation.dart';

part 'marshop_response.freezed.dart';
part 'marshop_response.g.dart';

@freezed
class ListMarshopResponse with _$ListMarshopResponse {
  const factory ListMarshopResponse({
    required int total,
    required List<MarshopResponse> marshops,
  }) = _ListMarshopResponse;

  factory ListMarshopResponse.fromJson(Map<String, dynamic> json) =>
      _$ListMarshopResponseFromJson(json);
}

@freezed
class MarshopResponse with _$MarshopResponse {
  const factory MarshopResponse({
    required int id,
    required String name,
    required String code,
    required MarshopUserInfo user,
  }) = _MarshopResponse;

  factory MarshopResponse.fromJson(Map<String, dynamic> json) =>
      _$MarshopResponseFromJson(json);
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
