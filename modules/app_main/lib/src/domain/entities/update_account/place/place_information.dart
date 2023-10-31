// Copyright 2022 Fighttech.vn, Ltd. All rights reserved.
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'country.dart';
import 'district.dart';
import 'province.dart';
import 'ward.dart';

part 'place_information.freezed.dart';
part 'place_information.g.dart';

@freezed
class PlaceInformation with _$PlaceInformation {
  const factory PlaceInformation({
    Country? country,
    Province? province,
    District? district,
    Ward? ward,
    String? address,
  }) = _PlaceInformation;

  factory PlaceInformation.fromJson(Map<String, dynamic> json) =>
      _$PlaceInformationFromJson(json);
}

extension PlaceInformationExt on PlaceInformation {
  String? get addressFormated {
    final List<String> arr = [];
    if (ward != null && ward?.name != null) {
      arr.add(ward?.name ?? '');
    }
    if (district != null && district?.name != null) {
      arr.add(district?.name ?? '');
    }
    if (province != null && province?.name != null) {
      arr.add(province?.name ?? '');
    }
    if (country != null && country?.name != null) {
      arr.add(country?.name ?? '');
    }
    var str = '';
    for (var i = 0; i < arr.length; i++) {
      if (i == 0) {
        str += arr[i];
      } else {
        str += ', ${arr[i]}';
      }
    }
    return str;
  }
}
