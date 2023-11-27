import 'package:json_annotation/json_annotation.dart';
part 'new_call_payload.g.dart';

@JsonSerializable()
class NewCallPayload {
  factory NewCallPayload.fromJson(Map<String, dynamic> json) => _$NewCallPayloadFromJson(json);

  NewCallPayload({required this.type, required this.receiverId, this.callGroupId});

  Map<String, dynamic> toJson() => _$NewCallPayloadToJson(this);

  final int type;
  final int receiverId;
  final int? callGroupId;
}
