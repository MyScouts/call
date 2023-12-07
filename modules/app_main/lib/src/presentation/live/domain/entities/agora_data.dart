import 'package:freezed_annotation/freezed_annotation.dart';

part 'agora_data.g.dart';

@JsonSerializable()
class AgoraData {
  final String channel;
  final String token;
  final int? uid;

  AgoraData({
    required this.channel,
    required this.token,
    this.uid,
  });

  factory AgoraData.fromJson(Map<String, dynamic> json) =>
      _$AgoraDataFromJson(json);
}


