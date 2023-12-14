import 'package:app_core/app_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'live_pk_stats.g.dart';

@JsonSerializable()
class LivePkStatsRes {
  final List<LivePkStats> pkStats;

  LivePkStatsRes({required this.pkStats});

  factory LivePkStatsRes.fromJson(Map<String, dynamic> json) =>
      _$LivePkStatsResFromJson(json);
}

@JsonSerializable()
class LivePkStats {
  final int diamondCount;
  final User user;

  LivePkStats({required this.diamondCount, required this.user});

  factory LivePkStats.fromJson(Map<String, dynamic> json) =>
      _$LivePkStatsFromJson(json);
}
