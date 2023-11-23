import 'package:app_core/app_core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

import '../core/theme/wallet_theme.dart';
import 'wallet_constant.dart';

class WalletTransactionHistoryScreen extends StatefulWidget {
  static const routeName = '/wallet-transaction-history';

  const WalletTransactionHistoryScreen({super.key});

  @override
  State<WalletTransactionHistoryScreen> createState() =>
      _WalletTransactionHistoryScreenState();
}

class _WalletTransactionHistoryScreenState
    extends State<WalletTransactionHistoryScreen> {
  final _selectedCategory = TransactionCategory.marshop;
  final _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WalletTheme.bgColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'Lịch sử giao dịch',
            style: context.text.titleMedium?.copyWith(
              color: const Color(0xFF212121),
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          actions: [
            // ImageWidget(
            //   IconAppConstants.icFilter,
            //   width: 20,
            // ),
          ],
        ),
      ),
      body: Column(
        children: [
          _filterWidget(),
        ],
      ),
    );
  }

  Widget _filterWidget() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: const BoxDecoration(
              color: AppColors.white,
              border: Border(
                right: BorderSide(
                  color: WalletTheme.dividerColor,
                  width: 2,
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Loại giao dịch',
                  style: context.text.titleMedium?.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    height: 1.8,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        _selectedCategory.text,
                        style: context.text.titleMedium?.copyWith(
                          color: const Color(0xFF101B28),
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          height: 1.4,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 15,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: const BoxDecoration(
              color: AppColors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Thời gian',
                  style: context.text.titleMedium?.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    height: 1.8,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        _selectedDate.text(),
                        style: context.text.titleMedium?.copyWith(
                          color: const Color(0xFF101B28),
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          height: 1.4,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 15,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
