import 'package:freezed_annotation/freezed_annotation.dart';

part 'live_pk_data.g.dart';

@JsonSerializable()
class LivePkData {
  final int id;

  LivePkData(this.id);

  factory LivePkData.fromJson(Map<String, dynamic> json) =>
      _$LivePkDataFromJson(json);
}
