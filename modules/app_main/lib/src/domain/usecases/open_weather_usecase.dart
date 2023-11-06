import 'package:app_main/src/domain/entities/open_weather/open_weather_current.dart';
import 'package:app_main/src/domain/repository/open_weather_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class OpenWeatherUseCase {
  final OpenWeatherRepository openWeatherRepository;

  OpenWeatherUseCase(this.openWeatherRepository);

  Future<OpenWeatherCurrent> get({required double lat, required double lon}) {
    return openWeatherRepository.get(lat: lat, lon: lon);
  }
}
