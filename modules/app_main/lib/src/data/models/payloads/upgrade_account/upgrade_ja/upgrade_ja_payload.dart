import 'package:freezed_annotation/freezed_annotation.dart';

part 'upgrade_ja_payload.freezed.dart';
part 'upgrade_ja_payload.g.dart';

@freezed
class UpgradeJAPayload with _$UpgradeJAPayload {
  const factory UpgradeJAPayload({
    String? teamId,
    String? bankHolder,
    String? bankNumber,
    int? bankId,
  }) = _UpgradeJAPayload;

  factory UpgradeJAPayload.fromJson(Map<String, dynamic> json) =>
      _$UpgradeJAPayloadFromJson(json);
}
