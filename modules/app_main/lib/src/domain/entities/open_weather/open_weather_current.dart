import 'package:design_system/design_system.dart';
import 'package:equatable/equatable.dart';

enum WeatherCondition {
  thunderstorm,
  drizzle,
  rain,
  snow,
  atmosphere,
  mist,
  fog,
  lightCloud,
  heavyCloud,
  clear,
  unknown;

  String get image {
    if (this == WeatherCondition.thunderstorm ||
        this == WeatherCondition.drizzle ||
        this == WeatherCondition.rain ||
        this == WeatherCondition.snow) {
      return IconAppConstants.icRain;
    }

    if (this == WeatherCondition.atmosphere ||
        this == WeatherCondition.mist ||
        this == WeatherCondition.fog ||
        this == WeatherCondition.heavyCloud) {
      return IconAppConstants.icCloud;
    }

    return IconAppConstants.icSun;
  }
}

class OpenWeatherCurrent extends Equatable {
  final int temp;
  final int tempMin;
  final int tempMax;
  final int humidity;
  final int pressure;
  final WeatherCondition condition;
  final String iconUrl;
  final double speed;
  final String name;

  const OpenWeatherCurrent({
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.humidity,
    required this.pressure,
    required this.condition,
    required this.iconUrl,
    required this.speed,
    required this.name,
  });

  factory OpenWeatherCurrent.fromJson(Map<String, dynamic> json) {
    return OpenWeatherCurrent(
      temp: ((json['main']?['temp'] ?? 0.0) - 273.15).round(),
      tempMin: ((json['main']?['temp_min'] ?? 0.0) - 273.15).round(),
      tempMax: ((json['main']?['temp_max'] ?? 0.0) - 273.15).round(),
      pressure: json['main']?['pressure'] ?? 0,
      humidity: json['main']?['humidity'] ?? 0,
      iconUrl:
          'http://openweathermap.org/img/w/${json['weather']?[0]?['icon']}.png',
      speed: json['wind']?['speed'] ?? 0.0,
      name: json['name'] ?? '',
      condition: mapStringToWeatherCondition(
        json['weather']?[0]['main'] ?? '',
        json['clouds']?['all'] ?? '',
      ),
    );
  }

  static WeatherCondition mapStringToWeatherCondition(
    String input,
    int cloudiness,
  ) {
    WeatherCondition condition;
    switch (input) {
      case 'Thunderstorm':
        condition = WeatherCondition.thunderstorm;
        break;
      case 'Drizzle':
        condition = WeatherCondition.drizzle;
        break;
      case 'Rain':
        condition = WeatherCondition.rain;
        break;
      case 'Snow':
        condition = WeatherCondition.snow;
        break;
      case 'Clear':
        condition = WeatherCondition.clear;
        break;
      case 'Clouds':
        condition = (cloudiness >= 85)
            ? WeatherCondition.heavyCloud
            : WeatherCondition.lightCloud;
        break;
      case 'Mist':
        condition = WeatherCondition.mist;
        break;
      case 'fog':
        condition = WeatherCondition.fog;
        break;
      case 'Smoke':
      case 'Haze':
      case 'Dust':
      case 'Sand':
      case 'Ash':
      case 'Squall':
      case 'Tornado':
        condition = WeatherCondition.atmosphere;
        break;
      default:
        condition = WeatherCondition.unknown;
    }

    return condition;
  }

  @override
  List<Object?> get props => [];
}

class OpenWeatherFeature extends OpenWeatherCurrent {
  final DateTime time;

  const OpenWeatherFeature({
    required super.temp,
    required super.tempMin,
    required super.tempMax,
    required super.humidity,
    required super.pressure,
    required super.condition,
    required super.iconUrl,
    required super.speed,
    required super.name,
    required this.time,
  });

  factory OpenWeatherFeature.fromJson(Map<String, dynamic> json) {
    return OpenWeatherFeature(
      temp: ((json['main']?['temp'] ?? 0.0) - 273.15).round(),
      tempMin: ((json['main']?['temp_min'] ?? 0.0) - 273.15).round(),
      tempMax: ((json['main']?['temp_max'] ?? 0.0) - 273.15).round(),
      pressure: json['main']?['pressure'] ?? 0,
      humidity: json['main']?['humidity'] ?? 0,
      iconUrl:
          'http://openweathermap.org/img/w/${json['weather']?[0]?['icon']}.png',
      speed: (json['wind']?['speed'] ?? 0.0).toDouble(),
      name: json['name'] ?? '',
      condition: OpenWeatherCurrent.mapStringToWeatherCondition(
        json['weather']?[0]['main'] ?? '',
        json['clouds']?['all'] ?? '',
      ),
      time: DateTime.tryParse(json['dt_txt']) ?? DateTime.now(),
    );
  }
}
