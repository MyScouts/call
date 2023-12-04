import 'package:freezed_annotation/freezed_annotation.dart';

part 'virtual_info.freezed.dart';

part 'virtual_info.g.dart';

@freezed
class VirtualInfo with _$VirtualInfo {
  const factory VirtualInfo(
      {String? url,
      double? durationSecond,
      double? startFromSecond}) = _VirtualInfo;

  factory VirtualInfo.fromJson(Map<String, dynamic> json) =>
      _$VirtualInfoFromJson(json);
}
