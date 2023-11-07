import 'package:app_main/src/domain/entities/open_weather/weather_condition.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'open_weather_current.g.dart';

@JsonSerializable()
class OpenWeatherCurrent extends Equatable {
  @JsonKey(name: 'temp_c')
  final double tempC;
  @JsonKey(name: 'temp_f')
  final double tempF;
  final WeatherCondition condition;

  const OpenWeatherCurrent({
    required this.tempC,
    required this.tempF,
    required this.condition,
  });

  factory OpenWeatherCurrent.fromJson(Map<String, dynamic> json) =>
      _$OpenWeatherCurrentFromJson(json);

  @override
  List<Object?> get props => [tempC, tempF, condition];
}
