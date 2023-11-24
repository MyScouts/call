import 'package:freezed_annotation/freezed_annotation.dart';

import 'live_type.dart';

part 'live_data.g.dart';

@JsonSerializable()
class LiveData {
  @JsonKey(name: 'userId')
  final int userID;
  final int id;
  final LiveType type;
  final String title;
  final DateTime createdAt;
  final String? agoraChannel;
  final String? agoraToken;

  LiveData({
    required this.id,
    required this.userID,
    required this.title,
    required this.type,
    required this.createdAt,
    this.agoraChannel,
    this.agoraToken,
  });

  factory LiveData.fromJson(Map<String, dynamic> json) =>
      _$LiveDataFromJson(json);
}
