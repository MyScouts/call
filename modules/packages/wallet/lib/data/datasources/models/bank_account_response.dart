// Copyright 2022 Fighttech.vn, Ltd. All rights reserved.
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/domain.dart';

part 'bank_account_response.g.dart';

@JsonSerializable()
class BankAccountResponse {
  @JsonKey(name: 'banks', includeIfNull: false)
  final List<BankAccount> banks;

  BankAccountResponse({required this.banks});

  factory BankAccountResponse.fromJson(Map<String, dynamic> json) =>
      _$BankAccountResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BankAccountResponseToJson(this);
}
