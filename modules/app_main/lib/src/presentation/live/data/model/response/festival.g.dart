// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'festival.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FestivalImpl _$$FestivalImplFromJson(Map<String, dynamic> json) =>
    _$FestivalImpl(
      id: json['id'] as int?,
      userId: json['userId'] as int?,
      numberId: json['numberId'] as int?,
      degree: json['degree'] as String?,
      music: json['music'] as String?,
      medias:
          (json['medias'] as List<dynamic>?)?.map((e) => e as String).toList(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      fullName: json['fullName'] as String?,
      jaCode: json['jaCode'] as int?,
    );

Map<String, dynamic> _$$FestivalImplToJson(_$FestivalImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'numberId': instance.numberId,
      'degree': instance.degree,
      'music': instance.music,
      'medias': instance.medias,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'fullName': instance.fullName,
      'jaCode': instance.jaCode,
    };
