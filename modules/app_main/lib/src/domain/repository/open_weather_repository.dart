import 'package:app_main/src/domain/entities/open_weather/open_weather_current.dart';

abstract class OpenWeatherRepository {
  Future<OpenWeatherCurrent> get({required double lat, required double lon});

  Future<List<OpenWeatherFeature>> getFeature({
    required double lat,
    required double lon,
  });
}
