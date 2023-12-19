import 'package:json_annotation/json_annotation.dart';

part 'storage_upload_url_response.g.dart';


@JsonSerializable()
class StorageUploadUrlResponse {
  final String uploadUrl;
  final String publicUrl;

  StorageUploadUrlResponse({required this.uploadUrl, required this.publicUrl});

  factory StorageUploadUrlResponse.fromJson(Map<String, dynamic> json) =>
      _$StorageUploadUrlResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StorageUploadUrlResponseToJson(this);
}
