import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/models/responses/weather_response.dart';
import 'package:app_main/src/domain/entities/open_weather/open_weather_current.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

part 'open_weather_api.g.dart';

@lazySingleton
@RestApi(baseUrl: 'http://api.weatherapi.com/v1/')
abstract class OpenWeatherApi {
  @factoryMethod
  factory OpenWeatherApi(Dio dio) = _OpenWeatherApi;

  @GET('current.json')
  Future<WeatherResponse> get(
    @Query('key') String apiKey,
    @Query('q') String q,
  );
}
