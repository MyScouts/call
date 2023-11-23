import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

import '../../../../core/core.dart';
import '../../../../domain/domain.dart';
import '../../../shared/shared.dart';
import 'attribute_generator.dart';

class PointTransactionHistoryDetailWidget extends StatefulWidget {
  final PointTransactionHistoryDetail data;

  const PointTransactionHistoryDetailWidget({
    super.key,
    required this.data,
  });

  @override
  State<PointTransactionHistoryDetailWidget> createState() =>
      _PointTransactionHistoryDetailWidgetState();
}

class _PointTransactionHistoryDetailWidgetState
    extends State<PointTransactionHistoryDetailWidget> {
  Map<String, Widget> generateFormData(PointTransactionHistoryDetail data) {
    final colorStatus = data.transactionType.toColorStatus();

    final valueWidget = Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          colorStatus.parse(data.value),
          style: context.text.titleMedium?.copyWith(
            color: colorStatus.color,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 5),
        ImageWidget(IconAppConstants.communityCharity, width: 20),
      ],
    );

    return {
      'Ngày thực hiện': Text(data.createdAt?.toAppDateTimeFormat() ?? ''),
      'Loại giao dịch': Text(data.transactionType.title),
      if (data.transactionType == PointTransactionHistoryType.rechargePoint ||
          data.transactionType ==
              PointTransactionHistoryType.subsidizeContest) ...{
        'Số lượng Xu nạp': valueWidget,
        'Tên người nạp': Text(data.chargerName),
      },
      if (data.transactionType ==
          PointTransactionHistoryType.rechargePoint) ...{
        'ID người nạp': Text(data.chargerPDoneId),
      },
      if (data.transactionType == PointTransactionHistoryType.gift ||
          data.transactionType == PointTransactionHistoryType.vote) ...{
        'Giá trị quà tặng': valueWidget,
      },
      if (data.transactionType ==
          PointTransactionHistoryType.sendRegisterCoach) ...{
        'Giá trị': valueWidget,
        // pending
        'Thời gian huấn luyện': Text('${data.metaData?.hourCount}'),
      },
      if (data.transactionType == PointTransactionHistoryType.gift ||
          data.transactionType == PointTransactionHistoryType.vote ||
          data.transactionType ==
              PointTransactionHistoryType.sendRegisterCoach) ...{
        'Tên người nhận': Text(data.receiverName),
        'ID người nhận': Text(data.receiverPDoneId),
      },
      if (data.transactionType == PointTransactionHistoryType.entryFee) ...{
        'Phí vào phòng': valueWidget,
        'Tên chủ phong': Text(data.receiverName),
        'ID chủ phong': Text(data.receiverPDoneId),
        'ID phòng': Text(data.roomId),
      },
      'Trạng thái': Text(
        data.status.title,
        style: context.text.titleMedium?.copyWith(
          color: WalletTheme.primaryColor6,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    final formData = generateFormData(widget.data);

    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xFF025DB4), Color(0xFF0E88FE)],
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          width: double.infinity,
          child: Text(
            'Mã giao dịch ${widget.data.code}',
            style: context.text.titleMedium?.copyWith(
              color: WalletTheme.white,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 16,
                ),
                AttributeGenerator(
                  data: formData,
                ),
              ],
            ),
          ),
        ),
        const Spacer(),
        const ContactWidget(),
        const SizedBox(height: 16),
      ],
    );
  }
}
