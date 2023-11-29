import 'package:json_annotation/json_annotation.dart';

part 'invite_friend_req.g.dart';

@JsonSerializable(explicitToJson: true)
class InviteFriendReq {
  final List<int>? userIds;

  InviteFriendReq({this.userIds});

  factory InviteFriendReq.fromJson(Map<String, dynamic> json) => _$InviteFriendReqFromJson(json);

  Map<String, dynamic> toJson() => _$InviteFriendReqToJson(this);
}
