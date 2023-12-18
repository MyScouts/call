// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MetaDataDto _$MetaDataDtoFromJson(Map<String, dynamic> json) => MetaDataDto(
      file: json['file'] == null
          ? null
          : FileDto.fromJson(json['file'] as Map<String, dynamic>),
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      member: json['member'] == null
          ? null
          : MemberMetaDataDto.fromJson(json['member'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MetaDataDtoToJson(MetaDataDto instance) =>
    <String, dynamic>{
      'file': instance.file,
      'images': instance.images,
      'member': instance.member,
    };
