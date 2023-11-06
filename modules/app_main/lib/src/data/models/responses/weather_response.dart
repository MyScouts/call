import 'package:app_main/src/domain/entities/open_weather/open_weather_current.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_response.g.dart';

@JsonSerializable()
class WeatherResponse {
  final OpenWeatherCurrent current;

  WeatherResponse(this.current);

  factory WeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseFromJson(json);
}
