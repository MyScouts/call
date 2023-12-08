
import 'package:freezed_annotation/freezed_annotation.dart';
part 'new_post_payload.g.dart';

@JsonSerializable()
class NewPostPayload {
  final String type;
  final String subject;
  final String content;
  final String typeScope;
  final List<String>? medias;

  const NewPostPayload({
    required this.type,
    required this.subject,
    required this.content,
    required this.typeScope,
    this.medias,
  });

  factory NewPostPayload.fromJson(Map<String, dynamic> json) =>
      _$NewPostPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$NewPostPayloadToJson(this);
}