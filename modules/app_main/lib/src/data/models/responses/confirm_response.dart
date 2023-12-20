import 'package:freezed_annotation/freezed_annotation.dart';

part 'confirm_response.g.dart';

@JsonSerializable()
class ConfirmResponse {
  final bool? approveRequired;
  final bool? result;

  ConfirmResponse({
    required this.result,
    this.approveRequired,
  });

  factory ConfirmResponse.fromJson(Map<String, dynamic> json) =>
      _$ConfirmResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ConfirmResponseToJson(this);
}
