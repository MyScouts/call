// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'agency.freezed.dart';
part 'agency.g.dart';

@freezed
class Agency with _$Agency {
  const factory Agency({
    int? id,
    String? phone,
    String? email,
    String? pDoneId,
    String? displayName,
    String? agencyName,
    int? totalPoint,
  }) = _Agency;

  factory Agency.fromJson(Map<String, dynamic> json) => _$AgencyFromJson(json);
}
