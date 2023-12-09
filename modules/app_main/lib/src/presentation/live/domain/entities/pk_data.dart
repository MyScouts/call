import 'package:app_core/app_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pk_data.g.dart';

@JsonSerializable()
class PkData {
  final User host;
  @JsonKey(name: 'members')
  final List<User> users;

  PkData({required this.host, required this.users});

  factory PkData.fromJson(Map<String, dynamic> json) => _$PkDataFromJson(json);
}
