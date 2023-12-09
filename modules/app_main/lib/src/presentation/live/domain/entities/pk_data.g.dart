// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pk_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PkData _$PkDataFromJson(Map<String, dynamic> json) => PkData(
      host: User.fromJson(json['host'] as Map<String, dynamic>),
      users: (json['members'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PkDataToJson(PkData instance) => <String, dynamic>{
      'host': instance.host,
      'members': instance.users,
    };
