import 'package:json_annotation/json_annotation.dart';
part 'new_conversations_payload.g.dart';

@JsonSerializable()
class NewConversationsPayload {
  factory NewConversationsPayload.fromJson(Map<String, dynamic> json) =>
      _$NewConversationsPayloadFromJson(json);

  NewConversationsPayload({required this.name, required this.type, required this.memberIds});

  Map<String, dynamic> toJson() => _$NewConversationsPayloadToJson(this);

  final String name;
  final int type;
  final List<int> memberIds;
}
