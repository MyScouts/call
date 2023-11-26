// Copyright 2022 Fighttech.vn, Ltd. All rights reserved.
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/domain.dart';

part 'bank_response.g.dart';

@JsonSerializable()
class BankResponse {
  @JsonKey(name: 'banks', includeIfNull: false)
  final List<Bank> banks;

  BankResponse({required this.banks});

  factory BankResponse.fromJson(Map<String, dynamic> json) =>
      _$BankResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BankResponseToJson(this);
}
