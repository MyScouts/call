// Copyright 2022 Fighttech.vn, Ltd. All rights reserved.
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'ward.freezed.dart';
part 'ward.g.dart';

@freezed
class Ward with _$Ward {
  const factory Ward({
    String? name,
    int? id,
  }) = _Ward;

  factory Ward.fromJson(Map<String, dynamic> json) => _$WardFromJson(json);
}
