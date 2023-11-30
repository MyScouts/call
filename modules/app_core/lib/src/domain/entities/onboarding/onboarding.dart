import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding.freezed.dart';
part 'onboarding.g.dart';

@freezed
class OnBoarding with _$OnBoarding {
  const factory OnBoarding({
    required bool isJA,
    required bool isPdone,
    required bool isMarshopOwner,
    required bool isMarshopCustomer,
    required bool hasDefaultBankAccount,
  }) = _OnBoarding;

  factory OnBoarding.fromJson(Map<String, dynamic> json) =>
      _$OnBoardingFromJson(json);
}
