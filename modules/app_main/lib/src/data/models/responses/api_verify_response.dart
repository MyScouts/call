import 'package:freezed_annotation/freezed_annotation.dart';

part  'api_verify_response.g.dart';

@JsonSerializable()
class APIVerifyResponse {
  final bool result;
  APIVerifyResponse({
    required this.result,
  });

  factory APIVerifyResponse.fromJson(Map<String, dynamic> json) =>
      _$APIVerifyResponseFromJson(json);
}