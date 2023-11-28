import 'package:app_core/app_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'live_category_detail.dart';
import 'live_media.dart';
import 'live_type.dart';

part 'live_data.g.dart';

@JsonSerializable()
class LiveData {
  @JsonKey(name: 'userId')
  final int? userID;
  final User? user;
  final int id;
  final LiveType type;
  final String title;
  final DateTime createdAt;
  final String? agoraChannel;
  final String? agoraToken;
  final bool isBanned;
  final List<LiveMedia> medias;
  List<LiveCategoryDetail> categories;

  LiveData({
    required this.id,
    this.userID,
    this.user,
    required this.title,
    required this.type,
    required this.createdAt,
    this.agoraChannel,
    this.agoraToken,
    this.medias = const [],
    this.isBanned = false,
    this.categories = const [],
  });

  factory LiveData.fromJson(Map<String, dynamic> json) =>
      _$LiveDataFromJson(json);
}
