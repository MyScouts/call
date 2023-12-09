import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/models/responses/marshop_response.dart';
import 'package:app_main/src/domain/entities/update_account/update_place_information_payload.dart';
import 'package:app_main/src/presentation/chat/chat_coordinator.dart';
import 'package:app_main/src/presentation/dashboard/dashboard_coordinator.dart';
import 'package:app_main/src/presentation/marshop/marshop_coordinator.dart';
import 'package:app_main/src/presentation/marshop/register_marshop/confirm_infomation_screen.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class TransactionDetailScreen extends StatelessWidget {
  static const String routeName = 'transaction-detail';
  final MarshopRegisterPackResponse pack;
  final User authInfo;
  final MarshopResponse marshop;
  final UpdatePlaceInformationPayload address;
  final int totalPrice;
  final List<RegisterPackProductInfo> productResult;

  const TransactionDetailScreen({
    super.key,
    required this.pack,
    required this.address,
    required this.marshop,
    required this.authInfo,
    required this.productResult,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFF2F3F4),
      appBar: BaseAppBar(
        onPressed: () => context.startDashboardUtil(),
        backgroundColor: Colors.transparent,
        isClose: false,
        title: "Chi tiết giao dịch",
      ),
      body: Container(
        padding: const EdgeInsets.only(
          left: paddingHorizontal,
          right: paddingHorizontal,
          top: 10,
          bottom: 30,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildInfo(context),
              _buildPriceInfo(context),
              _buildAddress(context),
              _buildBankInfo(context),
              const SizedBox(height: 5),
              _buildQrPayment(context),
              const SizedBox(height: 10),
              const Text(
                "Lưu ý: Bạn cần chụp lại màn hình giao dịch thành công và gửi kế toán xác nhận",
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              PrimaryButton(
                  title: "Xác nhận đã thanh toán",
                  onTap: () => context
                      .startChatRoom(memberId: 3)
                      .then((value) => context.startWaitingDialog()),
                  disabled: false,
                  width: null),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRow(BuildContext context,
      {required String name, required String value}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Expanded(
            child: Text(
              name,
              style: context.textTheme.bodySmall,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: context.textTheme.titleSmall,
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSessionInfo(
    BuildContext context, {
    required String title,
    required List<Widget> children,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            title,
            style: context.textTheme.titleLarge!.copyWith(fontSize: 16),
          ),
          const SizedBox(height: 12),
          Column(
              children: children
                  .map((e) => Column(
                        children: [
                          e,
                          if (children.indexOf(e) < children.length - 1)
                            const Divider(),
                        ],
                      ))
                  .toList())
        ],
      ),
    );
  }

  String genImageQr() {
    return 'https://img.vietqr.io/image/techcombank-192753047-qr-only.jpg?amount=$_totalPrice&addInfo=DK ${authInfo.pDoneId}';
  }

  Widget _buildQrPayment(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            'QR code thanh toán',
            style: context.textTheme.titleLarge!.copyWith(fontSize: 16),
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.center,
            child: AppAvatarWidget(
              width: 230,
              border: Border.all(color: Colors.transparent, width: 0),
              height: 230,
              radius: 0,
              avatar: genImageQr(),
            ),
          )
        ],
      ),
    );
  }

  _buildInfo(BuildContext context) {
    return _buildSessionInfo(
      context,
      title: "Thông tin giao dịch",
      children: [
        _buildRow(context, name: "ID người mua", value: authInfo.pDoneId!),
        _buildRow(context, name: "ID Marshop giới thiệu", value: marshop.code),
      ],
    );
  }

  int get _totalPrice => (totalPrice + (totalPrice * 0.1)).toInt();

  _buildPriceInfo(BuildContext context) {
    return _buildSessionInfo(
      context,
      title: "Tổng tiền thanh toán",
      children: [
        _buildRow(
          context,
          name: "Giá gốc",
          value: totalPrice.toAppCurrencyString(),
        ),
        _buildRow(context,
            name: "VAT(10%)", value: (totalPrice * 0.1).toAppCurrencyString()),
        _buildRow(context, name: "Phí vận chuyển", value: "0 đ"),
        _buildRow(
          context,
          name: "Tổng tiền",
          value: _totalPrice.toAppCurrencyString(),
        ),
      ],
    );
  }

  _buildAddress(BuildContext context) {
    return _buildSessionInfo(
      context,
      title: "Địa chỉ",
      children: [
        _buildRow(context, name: "Quốc gia", value: address.countryName!),
        _buildRow(context, name: "Tỉnh thành", value: address.provinceName!),
        _buildRow(context, name: "Quận huyện", value: address.districtName!),
        _buildRow(context, name: "Phường xã", value: address.wardName!),
        _buildRow(
          context,
          name: "Địa chỉ cụ thể",
          value: address.address ?? '',
        ),
      ],
    );
  }

  _buildBankInfo(BuildContext context) {
    return _buildSessionInfo(
      context,
      title: "Thông tin ngân hàng",
      children: [
        _buildRow(context, name: "Số tài khoản", value: "192753047"),
        _buildRow(context, name: "Tên ngân hàng", value: "Techcombank"),
        _buildRow(context, name: "Chủ sở hữu", value: "Nguyễn Thanh Hải"),
        _buildRow(
          context,
          name: "Số tiền",
          value: _totalPrice.toAppCurrencyString(),
        ),
        _buildRow(context, name: "Nội dung", value: "DK ${authInfo.pDoneId}"),
      ],
    );
  }
}
