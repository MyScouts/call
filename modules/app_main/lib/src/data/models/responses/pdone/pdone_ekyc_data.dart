import 'package:freezed_annotation/freezed_annotation.dart';

part 'pdone_ekyc_data.g.dart';

@JsonSerializable()
class PDoneEKycData {
  final String value;

  PDoneEKycData({
    required this.value,
  });

  factory PDoneEKycData.fromJson(Map<String, dynamic> json) =>
      _$PDoneEKycDataFromJson(json);

  Map<String, dynamic> toJson() => _$PDoneEKycDataToJson(this);
}