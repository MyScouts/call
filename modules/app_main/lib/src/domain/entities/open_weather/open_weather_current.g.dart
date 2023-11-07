// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'open_weather_current.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpenWeatherCurrent _$OpenWeatherCurrentFromJson(Map<String, dynamic> json) =>
    OpenWeatherCurrent(
      tempC: (json['temp_c'] as num).toDouble(),
      tempF: (json['temp_f'] as num).toDouble(),
      condition:
          WeatherCondition.fromJson(json['condition'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OpenWeatherCurrentToJson(OpenWeatherCurrent instance) =>
    <String, dynamic>{
      'temp_c': instance.tempC,
      'temp_f': instance.tempF,
      'condition': instance.condition,
    };
