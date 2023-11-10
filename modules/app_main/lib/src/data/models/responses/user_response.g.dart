// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OnboardingResponseImpl _$$OnboardingResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$OnboardingResponseImpl(
      isJA: json['isJA'] as bool,
      isPdone: json['isPdone'] as bool,
      isMarshopOwner: json['isMarshopOwner'] as bool,
      isMarshopCustomer: json['isMarshopCustomer'] as bool,
      hasDefaultBankAccount: json['hasDefaultBankAccount'] as bool,
    );

Map<String, dynamic> _$$OnboardingResponseImplToJson(
        _$OnboardingResponseImpl instance) =>
    <String, dynamic>{
      'isJA': instance.isJA,
      'isPdone': instance.isPdone,
      'isMarshopOwner': instance.isMarshopOwner,
      'isMarshopCustomer': instance.isMarshopCustomer,
      'hasDefaultBankAccount': instance.hasDefaultBankAccount,
    };
