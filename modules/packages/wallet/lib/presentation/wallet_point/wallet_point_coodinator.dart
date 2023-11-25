import 'package:flutter/material.dart';

import '../../data/datasources/models/wallet_coin_payment_information_response.dart';
import '../../domain/entities/agency/agency.dart';
import 'point_agency/screen/agency_info_screen.dart';
import 'point_agency/screen/payment_information_screen.dart';
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

  Future<T?> coinPaymentInformation<T>(WalletCoinPaymentInformation paymentInfo,
          AgencyResponse agency, String pDoneId) =>
      Navigator.of(this).pushNamed(
        PaymentInformationScreen.routeName,
        arguments: {
          'paymentInfo': paymentInfo,
          'agency': agency,
          'pDoneId': pDoneId
        },
      );
}
