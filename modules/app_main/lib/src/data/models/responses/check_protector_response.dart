import 'package:freezed_annotation/freezed_annotation.dart';

part  'check_protector_response.g.dart';

@JsonSerializable()
class CheckProtectorResponse {
  final int userId;
  CheckProtectorResponse({
    required this.userId,
  });

  factory CheckProtectorResponse.fromJson(Map<String, dynamic> json) =>
      _$CheckProtectorResponseFromJson(json);
}
