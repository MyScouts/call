
import 'package:app_main/src/data/models/responses/chat/meta_data_dto.dart';
import 'package:json_annotation/json_annotation.dart';
part 'new_message_payload.g.dart';

@JsonSerializable()
class NewMessagePayload {
  factory NewMessagePayload.fromJson(Map<String, dynamic> json) =>
      _$NewMessagePayloadFromJson(json);

  NewMessagePayload({this.message, this.metadata});


  Map<String, dynamic> toJson() => _$NewMessagePayloadToJson(this);

  final String? message;
  final MetaDataDto? metadata;
}
