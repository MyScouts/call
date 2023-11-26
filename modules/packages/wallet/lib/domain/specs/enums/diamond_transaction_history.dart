import 'package:json_annotation/json_annotation.dart';

// exchange_diamond_to_vnd, receive_gift, receive_vote, receive_voucher
enum DiamondTransactionHistoryType {
  @JsonValue('exchange_diamond_to_vnd')
  exchangeDiamondToVnd,
  @JsonValue('receive_gift')
  receiveGift,
  @JsonValue('receive_vote')
  receiveVote,
  @JsonValue('receive_voucher')
  receiveVoucher,
  @JsonValue('receive_register_coach')
  receiveRegisterCoach,
}

enum DiamondTransactionHistoryStatus {
  // Thành công
  @JsonValue(1)
  success,
  // Thất bại
  @JsonValue(2)
  failed,
  // CHờ xác nhận
  @JsonValue(3)
  pending,
}
