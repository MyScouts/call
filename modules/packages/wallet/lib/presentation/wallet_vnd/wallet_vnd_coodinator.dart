import 'package:flutter/material.dart';

import '../../domain/domain.dart';
import 'transaction_history/transaction_history.dart';
import 'transaction_history_detail/transaction_history_detail.dart';

extension WalletVndCoordinator on BuildContext {
  Future<T?> transactionHistory<T>(TransactionHistoryVendor vendor) =>
      Navigator.of(this).pushNamed(
        TransactionHistoryScreen.routeName,
        arguments: vendor,
      );

  Future<T?> transactionHistoryDetail<T>(int id) =>
      Navigator.of(this).pushNamed(
        TransactionHistoryDetailScreen.routeName,
        arguments: id,
      );
}
