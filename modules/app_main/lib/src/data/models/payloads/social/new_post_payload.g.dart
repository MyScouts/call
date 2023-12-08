// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_post_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewPostPayload _$NewPostPayloadFromJson(Map<String, dynamic> json) =>
    NewPostPayload(
      type: json['type'] as String,
      subject: json['subject'] as String,
      content: json['content'] as String,
      typeScope: json['typeScope'] as String,
      medias:
          (json['medias'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$NewPostPayloadToJson(NewPostPayload instance) =>
    <String, dynamic>{
      'type': instance.type,
      'subject': instance.subject,
      'content': instance.content,
      'typeScope': instance.typeScope,
      'medias': instance.medias,
    };
