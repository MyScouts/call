import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/models/responses/open_weather_feature_response.dart';
import 'package:app_main/src/domain/entities/open_weather/open_weather_current.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

part 'open_weather_api.g.dart';

@lazySingleton
@RestApi(baseUrl: 'https://api.openweathermap.org/data/2.5/')
abstract class OpenWeatherApi {
  @factoryMethod
  factory OpenWeatherApi(Dio dio) = _OpenWeatherApi;

  @GET('weather')
  Future<OpenWeatherCurrent> get(
    @Query('appid') String apiKey,
    @Query('lat') double lat,
    @Query('lon') double lon,
  );

  @GET('forecast')
  Future<OpenWeatherFeatureResponse> getFeature(
    @Query('appid') String apiKey,
    @Query('lat') double lat,
    @Query('lon') double lon,
  );
}
