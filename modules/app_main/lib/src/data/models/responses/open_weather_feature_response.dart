import 'package:app_main/src/domain/entities/open_weather/open_weather_current.dart';

class OpenWeatherFeatureResponse {
  final List<OpenWeatherFeature> list;

  OpenWeatherFeatureResponse(this.list);

  factory OpenWeatherFeatureResponse.fromJson(Map<String, dynamic> json) {
    return OpenWeatherFeatureResponse(
      List.from(
        (json['list'] ?? []).map((e) => OpenWeatherFeature.fromJson(e)),
      ),
    );
  }
}
