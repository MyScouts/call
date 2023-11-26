import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mobilehub_core/mobilehub_core.dart';

import 'transaction_history/transaction_history.dart';
import 'transaction_history_detail/transaction_history_detail.dart';

@injectable
class WalletDiamondRoutes extends RouteModule {
  @override
  Map<String, WidgetBuilder> getAll(RouteSettings settings) {
    return {
      DiamondTransactionHistoryScreen.routeName: (context) {
        return BlocProvider(
          create: (context) => DiamondTransactionHistoryBloc(injector())
            ..add(GetTransactionHistoryEvent()),
          child: const DiamondTransactionHistoryScreen(),
        );
      },
      // DiamondTransactionHistoryDetailScreen.routeName: (context) {
      //   final id = settings.arguments as int;
      //   return DiamondTransactionHistoryDetailScreen(id: id);
      // },
    };
  }
}
