// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BankAccountImpl _$$BankAccountImplFromJson(Map<String, dynamic> json) =>
    _$BankAccountImpl(
      id: json['id'] as int? ?? 0,
      userId: json['userId'] as int? ?? 0,
      bankNumber: json['bankNumber'] as String? ?? '',
      bankHolder: json['bankHolder'] as String? ?? '',
      isDefault: json['isDefault'] as bool? ?? true,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      bank: json['bank'] == null
          ? null
          : Bank.fromJson(json['bank'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$BankAccountImplToJson(_$BankAccountImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'bankNumber': instance.bankNumber,
      'bankHolder': instance.bankHolder,
      'isDefault': instance.isDefault,
      'createdAt': instance.createdAt?.toIso8601String(),
      'bank': instance.bank,
    };
