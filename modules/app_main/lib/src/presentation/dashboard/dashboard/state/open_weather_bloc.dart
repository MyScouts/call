import 'package:app_core/app_core.dart';
import 'package:app_main/src/domain/entities/open_weather/open_weather_current.dart';
import 'package:app_main/src/domain/usecases/open_weather_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

OpenWeatherState? _state;

@injectable
class OpenWeatherBloc extends Bloc<FetchWeather, OpenWeatherState> {
  final OpenWeatherUseCase openWeatherUseCase;

  OpenWeatherBloc(this.openWeatherUseCase)
      : super(_state ?? const OpenWeatherState()) {
    on<FetchWeather>(
      onFetchWeather,
      transformer: (event, mapper) => event.switchMap(mapper),
    );
  }

  void onFetchWeather(
    FetchWeather event,
    Emitter<OpenWeatherState> emit,
  ) async {
    // if(_state != null) {
    //   emit(OpenWeatherState(
    //     openWeatherCurrent: _state!.openWeatherCurrent,
    //     list: List.from(_state!.list),
    //   ));
    //   return;
    // }
    final res = await Future.wait([
      openWeatherUseCase.get(lat: event.lat, lon: event.lon),
      openWeatherUseCase.getFeature(lat: event.lat, lon: event.lon),
    ]);
    _state = OpenWeatherState(
      openWeatherCurrent: res.first as OpenWeatherCurrent,
      list: res.last as List<OpenWeatherFeature>,
    );
    emit(_state!);
  }
}

class OpenWeatherState {
  final OpenWeatherCurrent? openWeatherCurrent;
  final List<OpenWeatherFeature> list;

  const OpenWeatherState({
    this.openWeatherCurrent,
    this.list = const [],
  });

  List<OpenWeatherFeature> get weatherDays {
    final result = <OpenWeatherFeature>[];
    final now = DateTime.now();
    for (final i in list) {
      if (i.time.isAfter(now) && i.time.hour == 12) {
        result.add(i);
      }
    }
    return result;
  }
}

abstract class OpenWeatherEvent {}

class FetchWeather extends OpenWeatherEvent {
  final double lat;
  final double lon;

  FetchWeather({required this.lat, required this.lon});
}
