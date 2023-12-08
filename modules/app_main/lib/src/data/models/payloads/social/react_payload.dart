
import 'package:freezed_annotation/freezed_annotation.dart';
part 'react_payload.g.dart';

@JsonSerializable()
class ReactPayload {
  final String type;
  final bool isHearted;


  const ReactPayload({
    required this.type,
    required this.isHearted,
  });

  factory ReactPayload.fromJson(Map<String, dynamic> json) =>
      _$ReactPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$ReactPayloadToJson(this);
}