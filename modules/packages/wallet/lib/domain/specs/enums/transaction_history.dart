import 'package:json_annotation/json_annotation.dart';

enum TransactionHistoryVendor {
  @JsonValue('v_shop')
  vShop('V-Shop', 'v_shop'),
  @JsonValue('v_live')
  vLive('V-Live', 'v_live');

  final String title;
  final String code;

  const TransactionHistoryVendor(this.title, this.code);
}

// Hình thức
enum TransactionHistoryType {
  @JsonValue('discount_from_order')
  discountFromOrder,
  @JsonValue('discount_from_buy_account')
  discountFromBuyAccount,
  @JsonValue('commission_from_order')
  commissionFromOrder,
  @JsonValue('commission_from_buy_account')
  commissionFromBuyAccount,
  @JsonValue('discount_from_livestream')
  discountFromLivestream,
  @JsonValue('commission_from_livestream')
  commissionFromLivestream,
  @JsonValue('withdraw')
  withdraw,
}

enum TransactionHistoryStatus {
  // Thành công
  @JsonValue(1)
  success,
  // Thất bại
  @JsonValue(2)
  failed,
  // CHờ xác nhận
  @JsonValue(3)
  pending,
  // Đang chờ xử lý
  @JsonValue(4)
  waitingWithdraw;
}
