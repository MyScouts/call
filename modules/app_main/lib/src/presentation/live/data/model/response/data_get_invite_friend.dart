import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/row_data.dart';

part 'data_get_invite_friend.g.dart';

@JsonSerializable(explicitToJson: true)
class DataGetInviteFriend {
  List<RowsData>? rows;
  int? count;

  DataGetInviteFriend({this.rows, this.count});

  factory DataGetInviteFriend.fromJson(Map<String, dynamic> json) => _$DataGetInviteFriendFromJson(json);

  Map<String, dynamic> toJson() => _$DataGetInviteFriendToJson(this);
}
