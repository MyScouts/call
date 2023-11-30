import 'package:app_core/app_core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';
import 'package:wallet/core/core.dart';
import 'package:wallet/presentation/wallet_constant.dart';

import 'shared/bloc/wallet_bloc.dart';

class TransactionHistoryDetailScreen extends StatefulWidget {
  final String id;
  static const String routeName = '/transaction-history-detail';

  const TransactionHistoryDetailScreen({super.key, required this.id});

  @override
  State<TransactionHistoryDetailScreen> createState() =>
      _TransactionHistoryDetailScreenState();
}

class _TransactionHistoryDetailScreenState
    extends State<TransactionHistoryDetailScreen> {

  late final _bloc = injector<WalletBloc>();

  @override
  void initState() {
    _bloc.add(WalletEvent.getWalletTransactionDetail(id: widget.id));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: BaseAppBar(
          title: 'Chi tiết giao dịch',
          isClose: false,
          backgroundColor: Colors.white,
        ),
      ),
      backgroundColor: WalletTheme.bgColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.horizontal),
        child: Column(
          children: [
            const SizedBox(height: 20),
            _buildStatusWidget(),
            const SizedBox(height: 20),
            _buildInfoWidget(),
          ],
        ),
      ),
    );
  }

  _buildStatusWidget() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: WalletConstant.borderRadius12,
      ),
      child: Column(
        children: [
          Text(
            '-6.120.000 đ',
            style: context.text.titleLarge?.copyWith(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              height: 32 / 24,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            'Chờ xác nhận',
            style: context.text.titleLarge?.copyWith(
              color: const Color(0xFFFFA41C),
              fontSize: 14,
              fontWeight: FontWeight.w400,
              height: 20 / 14,
            ),
          ),
        ],
      ),
    );
  }

  _buildInfoWidget() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: WalletConstant.borderRadius12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Thông tin giao dịch',
            style: context.text.titleLarge?.copyWith(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 15),
          _buildItemInfo(title: 'Tổng tiền rút', content: '6.800.000 vnđ'),
          _buildItemInfo(title: 'Tổng tiền rút', content: '6.800.000 vnđ'),
          _buildItemInfo(title: 'Tổng tiền rút', content: '6.800.000 vnđ'),
          _buildItemInfo(
            title: 'Tổng tiền rút',
            content: '6.800.000 vnđ',
            isLastItem: true,
          ),
        ],
      ),
    );
  }

  _buildItemInfo({
    required String title,
    required String content,
    bool isLastItem = false,
  }) {
    return Column(
      children: [
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: context.text.titleMedium?.copyWith(
                color: const Color(0xFF667385),
                fontSize: 14,
                height: 20 / 14,
              ),
            ),
            Text(
              content,
              style: context.text.titleLarge?.copyWith(
                color: const Color(0xFF101B28),
                fontSize: 14,
                height: 20 / 14,
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        if (!isLastItem)
          const Divider(
            color: Color(0xFFEAEDF0),
            thickness: 1.5,
          )
      ],
    );
  }
}
