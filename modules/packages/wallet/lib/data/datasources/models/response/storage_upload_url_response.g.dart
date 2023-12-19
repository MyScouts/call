// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage_upload_url_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StorageUploadUrlResponse _$StorageUploadUrlResponseFromJson(
        Map<String, dynamic> json) =>
    StorageUploadUrlResponse(
      uploadUrl: json['uploadUrl'] as String,
      publicUrl: json['publicUrl'] as String,
    );

Map<String, dynamic> _$StorageUploadUrlResponseToJson(
        StorageUploadUrlResponse instance) =>
    <String, dynamic>{
      'uploadUrl': instance.uploadUrl,
      'publicUrl': instance.publicUrl,
    };
