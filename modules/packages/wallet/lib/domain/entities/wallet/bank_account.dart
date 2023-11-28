import 'package:freezed_annotation/freezed_annotation.dart';
import '../bank/bank.dart';

part 'bank_account.freezed.dart';

part 'bank_account.g.dart';

@freezed
class BankAccount with _$BankAccount {
  const factory BankAccount({
    int? id,
    int? userId,
    String? bankNumber,
    String? bankHolder,
    bool? isDefault,
    DateTime? createdAt,
    Bank? bank,
    String? qrImage,
  }) = _BankAccount;

  factory BankAccount.fromJson(Map<String, dynamic> json) =>
      _$BankAccountFromJson(json);
}
