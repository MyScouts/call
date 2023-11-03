import 'package:freezed_annotation/freezed_annotation.dart';

part 'confirm_register_ja_response.g.dart';

@JsonSerializable()
class ConfirmRegisterJAResponse {
  final bool? result;

  ConfirmRegisterJAResponse({required this.result});

  factory ConfirmRegisterJAResponse.fromJson(Map<String, dynamic> json) =>
      _$ConfirmRegisterJAResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ConfirmRegisterJAResponseToJson(this);
}
