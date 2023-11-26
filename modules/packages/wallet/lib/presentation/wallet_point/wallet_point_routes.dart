import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mobilehub_core/mobilehub_core.dart';
import 'package:wallet/presentation/wallet_point/point_agency/screen/payment_information_screen.dart';

import 'point_agency/bloc/agency_bloc.dart';
import 'point_agency/screen/agency_info_screen.dart';
import 'point_agency/screen/point_agency_screen.dart';

@injectable
class WalletPointRoutes extends RouteModule {
  @override
  Map<String, WidgetBuilder> getAll(RouteSettings settings) {
    return {
      PaymentInformationScreen.routeName: (context) {
        final data = settings.arguments as Map<String, dynamic>;
        return PaymentInformationScreen(
          paymentInfo: data['paymentInfo'],
          agency: data['agency'], rPDoneUserId: data['pDoneId'],
        );
      },
      PointAgencyScreen.routeName: (context) {
        // return const PointAgencyScreen();
        return BlocProvider(
          create: (context) => AgencyBloc(injector())
            ..add(
              const AgencyEvent.getAllAgency(),
            ),
          child: const PointAgencyScreen(),
        );
      },
      AgencyInfoScreen.routeName: (context) {
        final id = settings.arguments as int;
        return BlocProvider(
          create: (context) => AgencyBloc(injector()),
          child: AgencyInfoScreen(agencyId: id),
        );
      },
    };
  }
}
