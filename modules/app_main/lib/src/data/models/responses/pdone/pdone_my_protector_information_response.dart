import 'package:json_annotation/json_annotation.dart';

part 'pdone_my_protector_information_response.g.dart';

@JsonSerializable()
class PDoneMyProtectorInformationResponse {
  final List<SummaryProtectorRequestedResponse> requests;

  PDoneMyProtectorInformationResponse({
    required this.requests,
  });

  factory PDoneMyProtectorInformationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$PDoneMyProtectorInformationResponseFromJson(json);
}

@JsonSerializable()
class SummaryProtectorRequestedResponse {
  final SummaryProtectorResponse protector;
  final int relation;

  SummaryProtectorRequestedResponse({
    required this.protector,
    required this.relation
  });

  factory SummaryProtectorRequestedResponse.fromJson(
          Map<String, dynamic> json) =>
      _$SummaryProtectorRequestedResponseFromJson(json);
}

@JsonSerializable()
class SummaryProtectorResponse {
  final int? id;
  final String? displayName;
  final String? identityNumber;
  final String? pDoneId;
  final String? phoneNumber;

  SummaryProtectorResponse({
    required this.id,
    required this.displayName,
    required this.pDoneId,
    required this.phoneNumber,
    required this.identityNumber,
  });

  factory SummaryProtectorResponse.fromJson(Map<String, dynamic> json) =>
      _$SummaryProtectorResponseFromJson(json);
}
