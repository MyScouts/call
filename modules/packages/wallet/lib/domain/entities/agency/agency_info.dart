// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../wallet.dart';
import 'agency.dart';

part 'agency_info.freezed.dart';

part 'agency_info.g.dart';

@freezed
class AgencyInfo with _$AgencyInfo {
  const factory AgencyInfo({
    Agency? agency,
    List<AgencyPrice>? listPrice,
  }) = _AgencyInfo;

  factory AgencyInfo.fromJson(Map<String, dynamic> json) =>
      _$AgencyInfoFromJson(json);
}

@freezed
class AgencyPrice with _$AgencyPrice {
  const factory AgencyPrice({
    int? id,
    int? vndFrom,
    String? pointPrice,
  }) = _AgencyPrice;

  factory AgencyPrice.fromJson(Map<String, dynamic> json) =>
      _$AgencyPriceFromJson(json);
}
