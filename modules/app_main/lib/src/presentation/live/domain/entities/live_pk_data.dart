import 'package:freezed_annotation/freezed_annotation.dart';

import 'live_data.dart';

part 'live_pk_data.g.dart';

@JsonSerializable()
class LivePkData {
  final Pk pk;
  final List<LiveData> lives;

  LivePkData({required this.pk, required this.lives});

  factory LivePkData.fromJson(Map<String, dynamic> json) =>
      _$LivePkDataFromJson(json);
}

@JsonSerializable()
class Pk {
  @JsonKey(name: 'hostId')
  final int hostID;
  final int id;

  Pk({required this.id, required this.hostID});

  factory Pk.fromJson(Map<String, dynamic> json) => _$PkFromJson(json);
}
