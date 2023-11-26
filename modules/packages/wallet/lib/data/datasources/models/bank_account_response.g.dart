// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_account_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankAccountResponse _$BankAccountResponseFromJson(Map<String, dynamic> json) =>
    BankAccountResponse(
      banks: (json['banks'] as List<dynamic>)
          .map((e) => BankAccount.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BankAccountResponseToJson(
        BankAccountResponse instance) =>
    <String, dynamic>{
      'banks': instance.banks,
    };
