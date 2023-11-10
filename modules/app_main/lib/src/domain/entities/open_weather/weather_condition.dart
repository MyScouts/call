import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_condition.g.dart';

@JsonSerializable()
class WeatherCondition extends Equatable {
  final String text;
  final String icon;

  const WeatherCondition(this.text, this.icon);

  factory WeatherCondition.fromJson(Map<String, dynamic> json) =>
      _$WeatherConditionFromJson(json);

  @override
  List<Object?> get props => [text, icon];
}
