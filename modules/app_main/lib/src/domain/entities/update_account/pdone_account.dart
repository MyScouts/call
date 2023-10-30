// Copyright 2022 Fighttech.vn, Ltd. All rights reserved.
// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

import 'kyc.dart';
import 'pdone_profile.dart';

part 'pdone_account.freezed.dart';
part 'pdone_account.g.dart';

@freezed
class PDoneAccount with _$PDoneAccount {
  @JsonSerializable(explicitToJson: true)
  const factory PDoneAccount({
    int? id,
    String? avatar,
    List<String>? backgroundImages,
    String? pDoneId,
    String? name,
    String? email,
    String? phone,
    int? status,
    String? nickname,
    String? displayName,
    @JsonKey(name: 'profile') PDoneProfile? profile,
    Kyc? kyc,
    bool? isPDone,
  }) = _PDoneAccount;

  factory PDoneAccount.fromJson(Map<String, dynamic> json) =>
      _$PDoneAccountFromJson(json);
}
