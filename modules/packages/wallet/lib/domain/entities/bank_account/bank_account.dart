// {
//         "id": 0,
//         "userId": 0,
//         "bankNumber": "string",
//         "bankHolder": "string",
//         "isDefault": true,
//         "createdAt": "2023-04-11T08:36:43.526Z",
//         "bank": {
//             "id": 0,
//             "name": "string",
//             "logo": "string"
//         }
//     }

import 'package:freezed_annotation/freezed_annotation.dart';

import '../bank/bank.dart';

part 'bank_account.freezed.dart';

part 'bank_account.g.dart';

@freezed
class BankAccountTransactionHistory with _$BankAccountTransactionHistory {
  const factory BankAccountTransactionHistory({
    @Default(0) int id,
    @Default(0) int userId,
    @Default('') String bankNumber,
    @Default('') String bankHolder,
    @Default(true) bool isDefault,
    DateTime? createdAt,
    Bank? bank,
  }) = _BankAccount;

  factory BankAccountTransactionHistory.fromJson(Map<String, dynamic> json) =>
      _$BankAccountTransactionHistoryFromJson(json);
}
