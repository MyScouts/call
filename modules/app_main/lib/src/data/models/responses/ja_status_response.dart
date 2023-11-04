import 'package:freezed_annotation/freezed_annotation.dart';

part 'ja_status_response.g.dart';

@JsonSerializable()
class JAStatusResponse {
  final JAStatusModel? jaInfo;

  JAStatusResponse({required this.jaInfo});

  factory JAStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$JAStatusResponseFromJson(json);

  Map<String, dynamic> toJson() => _$JAStatusResponseToJson(this);
}

@JsonSerializable()
class JAStatusModel {
  final int? id;
  final int? jaCode;
  final String? teamId;
  final int? status;
  final DateTime? jaAt;

  JAStatusModel({this.id, this.jaCode, this.teamId, this.status, this.jaAt});

  factory JAStatusModel.fromJson(Map<String, dynamic> json) =>
      _$JAStatusModelFromJson(json);

  Map<String, dynamic> toJson() => _$JAStatusModelToJson(this);
}
