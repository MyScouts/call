import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_bank_account_payload.g.dart';

@JsonSerializable()
class UpdateBankAccountPayload {
  final String token;
  final String otp;
  final int bankId;
  final String bankNumber;
  final String bankHolder;
  final String? qrImage;
  final bool isDefault;

  UpdateBankAccountPayload({
    required this.token,
    required this.bankHolder,
    required this.bankId,
    required this.bankNumber,
    required this.isDefault,
    required this.otp,
    this.qrImage,
  });

  factory UpdateBankAccountPayload.fromJson(Map<String, dynamic> json) =>
      _$UpdateBankAccountPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateBankAccountPayloadToJson(this);
}
