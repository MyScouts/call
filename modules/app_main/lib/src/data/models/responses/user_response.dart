import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_response.freezed.dart';
part 'user_response.g.dart';

@freezed
class OnboardingResponse with _$OnboardingResponse {
  const factory OnboardingResponse({
    required bool isJA,
    required bool isPdone,
    required bool isMarshopOwner,
    required bool isMarshopCustomer,
    required bool hasDefaultBankAccount,
    int? marshopCustomerId,
  }) = _OnboardingResponse;

  factory OnboardingResponse.fromJson(Map<String, dynamic> json) =>
      _$OnboardingResponseFromJson(json);
}
