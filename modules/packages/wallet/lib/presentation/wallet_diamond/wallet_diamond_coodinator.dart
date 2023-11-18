import 'package:flutter/material.dart';

import 'transaction_history/transaction_history.dart';
import 'transaction_history_detail/transaction_history_detail.dart';

extension WalletVndCoordinator on BuildContext {
  Future<T?> diamondTransactionHistory<T>() => Navigator.of(this).pushNamed(
        DiamondTransactionHistoryScreen.routeName,
      );

  Future<T?> diamondTransactionHistoryDetail<T>(int id) =>
      Navigator.of(this).pushNamed(
        DiamondTransactionHistoryDetailScreen.routeName,
        arguments: id,
      );
}
