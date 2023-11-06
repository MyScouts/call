import 'package:app_main/src/data/data_sources/remote/open_weather_api.dart';
import 'package:app_main/src/domain/entities/open_weather/open_weather_current.dart';
import 'package:app_main/src/domain/repository/open_weather_repository.dart';
import 'package:injectable/injectable.dart';

const apiKey = 'ebb9b40198f148af9e093043230611';

@LazySingleton(as: OpenWeatherRepository)
class OpenWeatherRepositoryImpl extends OpenWeatherRepository {
  final OpenWeatherApi weatherApi;

  OpenWeatherRepositoryImpl(this.weatherApi);

  @override
  Future<OpenWeatherCurrent> get({
    required double lat,
    required double lon,
  }) async {
    final res = await weatherApi.get(apiKey, '$lat,$lon');
    return res.current;
  }
}
