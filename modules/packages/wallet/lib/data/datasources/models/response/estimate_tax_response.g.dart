// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estimate_tax_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EstimateTaxResponse _$EstimateTaxResponseFromJson(Map<String, dynamic> json) =>
    EstimateTaxResponse(
      withdrawingVnd: (json['withdrawingVnd'] as num?)?.toDouble(),
      taxFeeVnd: (json['taxFeeVnd'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$EstimateTaxResponseToJson(
        EstimateTaxResponse instance) =>
    <String, dynamic>{
      'taxFeeVnd': instance.taxFeeVnd,
      'withdrawingVnd': instance.withdrawingVnd,
    };
