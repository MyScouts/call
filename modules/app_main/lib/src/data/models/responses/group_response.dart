import 'package:app_core/app_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'group_response.g.dart';

@JsonSerializable()
class GroupResponse {
  final List<Group> groups;

  GroupResponse({required this.groups});

  factory GroupResponse.fromJson(Map<String, dynamic> json) =>
      _$GroupResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GroupResponseToJson(this);
}

@JsonSerializable()
class GroupByIdResponse {
  final Group group;

  GroupByIdResponse({required this.group});

  factory GroupByIdResponse.fromJson(Map<String, dynamic> json) =>
      _$GroupByIdResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GroupByIdResponseToJson(this);
}