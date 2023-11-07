import 'package:app_core/app_core.dart';
import 'package:app_main/src/domain/entities/open_weather/open_weather_current.dart';
import 'package:app_main/src/domain/usecases/open_weather_usecase.dart';
import 'package:equatable/equatable.dart';
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
    final res = await openWeatherUseCase.get(lat: event.lat, lon: event.lon);
    _state = OpenWeatherState(openWeatherCurrent: res);
    emit(_state!);
  }
}

class OpenWeatherState extends Equatable {
  final OpenWeatherCurrent? openWeatherCurrent;

  const OpenWeatherState({this.openWeatherCurrent});

  @override
  List<Object?> get props => [openWeatherCurrent];
}

abstract class OpenWeatherEvent {}

class FetchWeather extends OpenWeatherEvent {
  final double lat;
  final double lon;

  FetchWeather({required this.lat, required this.lon});
}
