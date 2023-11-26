import 'package:flutter/material.dart';

import 'point_agency/screen/agency_info_screen.dart';
import 'point_agency/screen/point_agency_screen.dart';
import 'transaction_history/transaction_history.dart';
import 'transaction_history_detail/transaction_history_detail.dart';

extension WalletVndCoordinator on BuildContext {
  Future<T?> pointTransactionHistory<T>() => Navigator.of(this).pushNamed(
        PointTransactionHistoryScreen.routeName,
      );

  Future<T?> pointTransactionHistoryDetail<T>(int id) =>
      Navigator.of(this).pushNamed(
        TransactionHistoryDetailScreen.routeName,
        arguments: id,
      );

  Future<T?> pointAllAgency<T>() =>
      Navigator.of(this).pushNamed(PointAgencyScreen.routeName);

  Future<T?> agencyInfo<T>(int agencyId) => Navigator.of(this)
      .pushNamed(AgencyInfoScreen.routeName, arguments: agencyId);
}
