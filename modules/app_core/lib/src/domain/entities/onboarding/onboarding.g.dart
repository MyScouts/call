// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OnBoardingImpl _$$OnBoardingImplFromJson(Map<String, dynamic> json) =>
    _$OnBoardingImpl(
      isJA: json['isJA'] as bool,
      isPdone: json['isPdone'] as bool,
      isMarshopOwner: json['isMarshopOwner'] as bool,
      isMarshopCustomer: json['isMarshopCustomer'] as bool,
      hasDefaultBankAccount: json['hasDefaultBankAccount'] as bool,
    );

Map<String, dynamic> _$$OnBoardingImplToJson(_$OnBoardingImpl instance) =>
    <String, dynamic>{
      'isJA': instance.isJA,
      'isPdone': instance.isPdone,
      'isMarshopOwner': instance.isMarshopOwner,
      'isMarshopCustomer': instance.isMarshopCustomer,
      'hasDefaultBankAccount': instance.hasDefaultBankAccount,
    };
