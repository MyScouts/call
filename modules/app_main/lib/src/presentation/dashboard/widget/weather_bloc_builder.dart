import 'package:app_core/app_core.dart';
import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/presentation/dashboard/dashboard/state/open_weather_bloc.dart';
import 'package:flutter/material.dart';

class WeatherBlocBuilder extends StatefulWidget {
  const WeatherBlocBuilder({
    super.key,
    required this.lat,
    required this.lon,
    required this.builder,
  });

  final Widget Function(OpenWeatherState state) builder;
  final double lat;
  final double lon;

  @override
  State<WeatherBlocBuilder> createState() => _WeatherBlocBuilderState();
}

class _WeatherBlocBuilderState extends State<WeatherBlocBuilder> {
  late final OpenWeatherBloc bloc;

  @override
  void initState() {
    bloc = getIt<OpenWeatherBloc>();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant WeatherBlocBuilder oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.lat != widget.lat || oldWidget.lon != widget.lon) {
      bloc.add(FetchWeather(lat: widget.lat, lon: widget.lon));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => bloc..add(FetchWeather(lat: widget.lat, lon: widget.lon)),
      child: BlocBuilder<OpenWeatherBloc, OpenWeatherState>(
        builder: (_, state) => widget.builder(state),
      ),
    );
  }
}
