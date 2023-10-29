// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_rows_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataRowsResponse<T> _$DataRowsResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    DataRowsResponse<T>(
      rows: fromJsonT(json['rows']),
      count: json['count'] as int?,
    );

Map<String, dynamic> _$DataRowsResponseToJson<T>(
  DataRowsResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'count': instance.count,
      'rows': toJsonT(instance.rows),
    };
