import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mobilehub_core/mobilehub_core.dart';

import 'point_agency/bloc/agency_bloc.dart';
import 'point_agency/screen/agency_info_screen.dart';
import 'point_agency/screen/point_agency_screen.dart';
import 'transaction_history/transaction_history.dart';
import 'transaction_history_detail/transaction_history_detail.dart';

@injectable
class WalletPointRoutes extends RouteModule {
  @override
  Map<String, WidgetBuilder> getAll(RouteSettings settings) {
    return {
      PointTransactionHistoryScreen.routeName: (context) {
        return BlocProvider(
          create: (context) => PointTransactionHistoryBloc(injector())
            ..add(GetTransactionHistoryEvent()),
          child: const PointTransactionHistoryScreen(),
        );
      },
      TransactionHistoryDetailScreen.routeName: (context) {
        final id = settings.arguments as int;
        return TransactionHistoryDetailScreen(id: id);
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
