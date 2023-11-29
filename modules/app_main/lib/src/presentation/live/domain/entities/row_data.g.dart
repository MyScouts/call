// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'row_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RowsData _$RowsDataFromJson(Map<String, dynamic> json) => RowsData(
      json['userId'] as int?,
      json['followerId'] as int?,
      json['status'] as int?,
      json['isFriend'] as bool?,
      json['id'] as int?,
      json['userFollow'] == null
          ? null
          : User.fromJson(json['userFollow'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RowsDataToJson(RowsData instance) => <String, dynamic>{
      'userId': instance.userId,
      'followerId': instance.followerId,
      'status': instance.status,
      'isFriend': instance.isFriend,
      'id': instance.id,
      'userFollow': instance.userFollow?.toJson(),
    };
