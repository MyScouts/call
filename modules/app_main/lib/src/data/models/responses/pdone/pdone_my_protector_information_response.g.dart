// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pdone_my_protector_information_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PDoneMyProtectorInformationResponse
    _$PDoneMyProtectorInformationResponseFromJson(Map<String, dynamic> json) =>
        PDoneMyProtectorInformationResponse(
          requests: (json['requests'] as List<dynamic>)
              .map((e) => SummaryProtectorRequestedResponse.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$PDoneMyProtectorInformationResponseToJson(
        PDoneMyProtectorInformationResponse instance) =>
    <String, dynamic>{
      'requests': instance.requests,
    };

SummaryProtectorRequestedResponse _$SummaryProtectorRequestedResponseFromJson(
        Map<String, dynamic> json) =>
    SummaryProtectorRequestedResponse(
      protector: SummaryProtectorResponse.fromJson(
          json['protector'] as Map<String, dynamic>),
      relation: json['relation'] as int,
    );

Map<String, dynamic> _$SummaryProtectorRequestedResponseToJson(
        SummaryProtectorRequestedResponse instance) =>
    <String, dynamic>{
      'protector': instance.protector,
      'relation': instance.relation,
    };

SummaryProtectorResponse _$SummaryProtectorResponseFromJson(
        Map<String, dynamic> json) =>
    SummaryProtectorResponse(
      id: json['id'] as int?,
      displayName: json['displayName'] as String?,
      pDoneId: json['pDoneId'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      identityNumber: json['identityNumber'] as String?,
    );

Map<String, dynamic> _$SummaryProtectorResponseToJson(
        SummaryProtectorResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'displayName': instance.displayName,
      'identityNumber': instance.identityNumber,
      'pDoneId': instance.pDoneId,
      'phoneNumber': instance.phoneNumber,
    };
