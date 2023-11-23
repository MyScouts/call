// Copyright 2022 Fighttech.vn, Ltd. All rights reserved.
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/domain.dart';

part 'agency_response.g.dart';

@JsonSerializable()
class AgencyResponse {
  @JsonKey(name: 'agencies', includeIfNull: false)
  final List<Agency> agencies;

  AgencyResponse({required this.agencies});

  factory AgencyResponse.fromJson(Map<String, dynamic> json) =>
      _$AgencyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AgencyResponseToJson(this);
}
