import 'package:app_core/app_core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:ui/ui.dart';
import 'package:wallet/data/datasources/models/exchange_coin_response.dart';
import 'package:wallet/domain/domain.dart';
import 'package:wallet/presentation/wallet_coordinator_external.dart';

import '../../../../data/datasources/models/wallet_coin_payment_information_response.dart';
import '../../../shared/widgets/gradiant_button.dart';

class PaymentInformationScreen extends StatefulWidget {
  static const routeName = '/wallet-coin-payment-info';
  final WalletCoinPaymentInformation paymentInfo;
  final AgencyResponse agency;
  final ExchangeCoinResponse exchangeCoinResponse;
  final String rPDoneUserId;

  const PaymentInformationScreen(
      {super.key,
      required this.paymentInfo,
      required this.exchangeCoinResponse,
      required this.agency,
      required this.rPDoneUserId});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PaymentInformationState();
  }
}

class _PaymentInformationState extends State<PaymentInformationScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Chi tiết giao dịch',
          style: context.textTheme.titleLarge!,
        ),
        leading: IconButton(
          onPressed: Navigator.of(context).pop,
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: Container(
        color: const Color(0xFFF2F3F4),
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildAgencyInfo(context),
              const SizedBox(
                height: 16,
              ),
              buildPaymentInfo(context),
              const SizedBox(
                height: 16,
              ),
              buildQrPayment(context),
              const SizedBox(
                height: 16,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: GradiantButton(
                  onPressed: () {
                    context
                        .startChat(widget.paymentInfo.bankAccount.userId ?? 0);
                  },
                  child: const Text('Liên hệ'),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAgencyInfo(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Thông tin giao dịch',
            style: context.textTheme.titleLarge!.copyWith(fontSize: 16),
          ),
          const SizedBox(
            height: 12,
          ),
          _paymentInformationRow(
              context, 'Tên đại lý', widget.agency.name ?? ''),
          _paymentInformationRow(context, 'Số xu nhận',
              widget.paymentInfo.coin.toAppCurrencyString(isWithSymbol: false)),
          _paymentInformationRow(context, 'ID người nhận', widget.rPDoneUserId),
          _paymentInformationRow(context, 'Khuyến mãi', '${widget.exchangeCoinResponse.coinDiscount.discountRate}%'),
        ],
      ),
    );
  }

  Widget buildPaymentInfo(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Thông tin ngân hàng đại lý',
            style: context.textTheme.titleLarge!.copyWith(fontSize: 16),
          ),
          const SizedBox(
            height: 12,
          ),
          _paymentInformationRow(context, 'STK đại lý',
              widget.paymentInfo.bankAccount.bankNumber ?? ''),
          _paymentInformationRow(context, 'Tên ngân hàng',
              widget.paymentInfo.bankAccount.bank?.name ?? ''),
          _paymentInformationRow(context, 'Chủ sở hữu',
              widget.paymentInfo.bankAccount.bankHolder ?? ''),
          _paymentInformationRow(
              context,
              'Số tiền',
              widget.paymentInfo.vnd.toAppCurrencyString(isWithSymbol: false) ??
                  ''),
          _paymentInformationRow(
              context, 'Nội dung', widget.paymentInfo.content),
        ],
      ),
    );
  }

  String genImageQr() {
    return 'https://img.vietqr.io/image/${widget.paymentInfo.bankAccount.bank?.shortName}-${widget.paymentInfo.bankAccount.bankNumber}-qr-only.jpg?amount=${widget.paymentInfo.vnd}&addInfo=${widget.paymentInfo.content}';
  }

  Widget buildQrPayment(BuildContext context) {
    print(widget.paymentInfo.bankAccount);
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            'QR code thanh toán',
            style: context.textTheme.titleLarge!.copyWith(fontSize: 16),
          ),
          const SizedBox(
            height: 12,
          ),
          Align(
            alignment: Alignment.center,
            child: AppAvatarWidget(
              width: 230,
              border: Border.all(color: Colors.transparent, width: 0),
              height: 230,
              radius: 0,
              avatar: genImageQr(),
            ),
            // child: SizedBox(
            //   width: 168,
            //   child: ,
            //   // child: PrettyQrView(
            //   //   qrImage: QrImage(
            //   //     QrCode.fromData(
            //   //       data: 'https://pub.dev/packages/pretty_qr_code',
            //   //       errorCorrectLevel: QrErrorCorrectLevel.H,
            //   //     ),
            //   //   ),
            //   // ),
            // ),
          )
        ],
      ),
    );
  }

  Widget _paymentInformationRow(
      BuildContext context, String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: context.textTheme.titleMedium!
                .copyWith(fontWeight: FontWeight.normal, fontSize: 16),
          ),
          Expanded(
            child: Text(
              content,
              style: context.textTheme.titleMedium!
                  .copyWith(color: AppColors.black, fontSize: 16),
              textAlign: TextAlign.right,
            ),
          )
        ],
      ),
    );
  }
}
