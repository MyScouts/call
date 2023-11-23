import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mobilehub_core/mobilehub_core.dart';

import '../../domain/domain.dart';
import 'transaction_history/transaction_history.dart';
import 'transaction_history_detail/transaction_history_detail.dart';

@injectable
class WalletVndRoutes extends RouteModule {
  @override
  Map<String, WidgetBuilder> getAll(RouteSettings settings) => {
        TransactionHistoryScreen.routeName: (context) {
          var vendor = settings.arguments as TransactionHistoryVendor?;
          vendor ??= TransactionHistoryVendor.vShop;
          return BlocProvider(
            create: (context) => TransactionHistoryBloc(vendor!, injector())
              ..add(GetTransactionHistoryEvent()),
            child: TransactionHistoryScreen(vendor: vendor),
          );
        },
        TransactionHistoryDetailScreen.routeName: (context) {
          final id = settings.arguments as int;
          return TransactionHistoryDetailScreen(id: id);
        },
      };
}
