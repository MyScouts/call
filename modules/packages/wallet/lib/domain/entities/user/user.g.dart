// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as int?,
      avatar: json['avatar'] as String?,
      isPDone: json['isPDone'] as bool?,
      firstName: json['firstName'] as String?,
      middleName: json['middleName'] as String?,
      lastName: json['lastName'] as String?,
      pDoneId: json['pDoneId'] as String?,
      coinAmount: json['coinAmount'] as String?,
      coinVndAmount: json['coinVndAmount'] as String?,
      diamondAmount: json['diamondAmount'] as String?,
      displayName: json['displayName'] as String?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'avatar': instance.avatar,
      'isPDone': instance.isPDone,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'pDoneId': instance.pDoneId,
      'coinAmount': instance.coinAmount,
      'coinVndAmount': instance.coinVndAmount,
      'diamondAmount': instance.diamondAmount,
      'displayName': instance.displayName,
    };
