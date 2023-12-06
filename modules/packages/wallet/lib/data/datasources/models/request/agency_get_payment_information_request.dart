import 'package:freezed_annotation/freezed_annotation.dart';

part 'agency_get_payment_information_request.g.dart';

@JsonSerializable()
class AgencyPaymentInformation {
  final num vnd;
  final String pDoneId;
  final num bankAccountId;

  AgencyPaymentInformation(
      {required this.vnd, required this.pDoneId, required this.bankAccountId});

  factory AgencyPaymentInformation.fromJson(Map<String, dynamic> json) =>
      _$AgencyPaymentInformationFromJson(json);

  Map<String, dynamic> toJson() => _$AgencyPaymentInformationToJson(this);
}
