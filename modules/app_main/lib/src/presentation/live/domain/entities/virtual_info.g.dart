// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'virtual_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VirtualInfoImpl _$$VirtualInfoImplFromJson(Map<String, dynamic> json) =>
    _$VirtualInfoImpl(
      url: json['url'] as String?,
      durationSecond: (json['durationSecond'] as num?)?.toDouble(),
      startFromSecond: (json['startFromSecond'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$VirtualInfoImplToJson(_$VirtualInfoImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'durationSecond': instance.durationSecond,
      'startFromSecond': instance.startFromSecond,
    };
