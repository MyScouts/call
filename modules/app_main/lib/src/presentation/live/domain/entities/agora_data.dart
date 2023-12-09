import 'package:freezed_annotation/freezed_annotation.dart';

part 'agora_data.g.dart';

@JsonSerializable()
class AgoraData {
  final String channel;
  final String token;
  final int? uid;
  final int type;

  AgoraData({
    required this.channel,
    required this.token,
    this.uid,
    required this.type,
  });

  factory AgoraData.fromJson(Map<String, dynamic> json) =>
      _$AgoraDataFromJson(json);
}
