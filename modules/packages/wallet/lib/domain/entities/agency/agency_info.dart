// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../wallet.dart';
import 'agency.dart';

part 'agency_info.g.dart';

@JsonSerializable()
class AgencyListResponse {
  List<AgencyResponse> coinAgencies;

  AgencyListResponse(
      {required this.coinAgencies});

  factory AgencyListResponse.fromJson(Map<String, dynamic> json) =>
      _$AgencyListResponseFromJson(json);
}
