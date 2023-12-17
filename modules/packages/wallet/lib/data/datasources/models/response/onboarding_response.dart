import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_response.g.dart';

@JsonSerializable()
class OnboardingResponse {
  final bool? hasDefaultBankAccount;
  final bool? isJA;
  final bool? isPdone;

  OnboardingResponse({
    this.isJA,
    this.hasDefaultBankAccount,
    this.isPdone,
  });

  factory OnboardingResponse.fromJson(Map<String, dynamic> json) =>
      _$OnboardingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OnboardingResponseToJson(this);
}
