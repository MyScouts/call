// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OnboardingResponse _$OnboardingResponseFromJson(Map<String, dynamic> json) =>
    OnboardingResponse(
      isJA: json['isJA'] as bool?,
      hasDefaultBankAccount: json['hasDefaultBankAccount'] as bool?,
      isPdone: json['isPdone'] as bool?,
    );

Map<String, dynamic> _$OnboardingResponseToJson(OnboardingResponse instance) =>
    <String, dynamic>{
      'hasDefaultBankAccount': instance.hasDefaultBankAccount,
      'isJA': instance.isJA,
      'isPdone': instance.isPdone,
    };
