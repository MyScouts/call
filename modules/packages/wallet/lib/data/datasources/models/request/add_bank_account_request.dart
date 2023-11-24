import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_bank_account_request.g.dart';

@JsonSerializable()
class AddBankAccountRequest {
  final String token;
  final String otp;
  final int bankId;
  final String bankNumber;
  final String bankHolder;
  final String? qrImage;
  final bool isDefault;

  AddBankAccountRequest({
    required this.token,
    required this.bankHolder,
    required this.bankId,
    required this.bankNumber,
    required this.isDefault,
    required this.otp,
    required this.qrImage,
  });

  factory AddBankAccountRequest.fromJson(Map<String, dynamic> json) =>
      _$AddBankAccountRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddBankAccountRequestToJson(this);
}
