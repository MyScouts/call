// Copyright 2022 Fighttech.vn, Ltd. All rights reserved.
import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_rows_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class DataRowsResponse<T> {
  final int? count;

  @JsonKey(name: 'rows', includeIfNull: false)
  final T rows;

  DataRowsResponse({
    required this.rows,
    this.count,
  });

  factory DataRowsResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromT) =>
      _$DataRowsResponseFromJson(json, fromT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$DataRowsResponseToJson(this, toJsonT);
}
