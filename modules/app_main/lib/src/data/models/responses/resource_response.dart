import 'package:freezed_annotation/freezed_annotation.dart';

part 'resource_response.freezed.dart';
part 'resource_response.g.dart';

@freezed
class LatestVersionResponse with _$LatestVersionResponse {
  const factory LatestVersionResponse({
    VersionResponse? appVersion,
  }) = _LatestVersionResponse;

  factory LatestVersionResponse.fromJson(Map<String, dynamic> json) =>
      _$LatestVersionResponseFromJson(json);
}

@freezed
class VersionResponse with _$VersionResponse {
  const factory VersionResponse({
    required String version,
    required bool force,
    String? note,
  }) = _VersionResponse;

  factory VersionResponse.fromJson(Map<String, dynamic> json) =>
      _$VersionResponseFromJson(json);
}