import 'package:freezed_annotation/freezed_annotation.dart';

// ignore: lines_longer_than_80_chars
// charge_user, charge_agency, send_gift, send_vote, live_room_fee, send_register_coach, subsidize_contest
enum PointTransactionHistoryType {
  // Nạp xu
  @JsonValue('charge_user')
  rechargePoint,
  // Tặng quà
  @JsonValue('send_gift')
  gift,
  // Tặng vote
  @JsonValue('send_vote')
  vote,
  // Phí vào phòng
  @JsonValue('live_room_fee')
  entryFee,
  // Trả phí HLV
  @JsonValue('send_register_coach')
  sendRegisterCoach,
  // Quà tặng
  @JsonValue('subsidize_contest')
  subsidizeContest,
}
