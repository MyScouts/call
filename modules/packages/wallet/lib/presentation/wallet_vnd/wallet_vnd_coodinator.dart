import 'package:flutter/material.dart';

import 'transaction_history/transaction_history.dart';
import 'transaction_history_detail/transaction_history_detail.dart';

extension WalletVndCoordinator on BuildContext {
  Future<T?> vndTransactionHistory<T>() =>
      Navigator.of(this).pushNamed(TransactionHistoryScreen.routeName);

  Future<T?> vndTransactionHistoryDetail<T>(int id) =>
      Navigator.of(this).pushNamed(
        TransactionHistoryDetailScreen.routeName,
        arguments: id,
      );
}
