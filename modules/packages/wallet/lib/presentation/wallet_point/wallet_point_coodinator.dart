import 'package:flutter/material.dart';

import '../../data/datasources/models/wallet_coin_payment_information_response.dart';
import '../../domain/entities/agency/agency.dart';
import 'point_agency/screen/agency_info_screen.dart';
import 'point_agency/screen/payment_information_screen.dart';
import 'point_agency/screen/point_agency_screen.dart';

extension WalletVndCoordinator on BuildContext {
  Future<T?> pointAllAgency<T>() =>
      Navigator.of(this).pushNamed(PointAgencyScreen.routeName);

  Future<T?> agencyInfo<T>(int agencyId) => Navigator.of(this)
      .pushNamed(AgencyInfoScreen.routeName, arguments: agencyId);

  Future<T?> coinPaymentInformation<T>(WalletCoinPaymentInformation paymentInfo,
          AgencyResponse agency, String pDoneId) =>
      Navigator.of(this).pushReplacementNamed(
        PaymentInformationScreen.routeName,
        arguments: {
          'paymentInfo': paymentInfo,
          'agency': agency,
          'pDoneId': pDoneId
        },
      );
}
