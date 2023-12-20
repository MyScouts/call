//import 'dart:developer' as developer;
import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/presentation/call/phone_book/tabs/call_history/cubit/call_history_cubit.dart';
import 'package:app_main/src/presentation/call/phone_book/tabs/call_history/cubit/call_history_state.dart';
import 'package:app_main/src/presentation/call/widgets/call_history_widget.dart';
import 'package:app_main/src/presentation/call/widgets/friend_widget.dart';
import 'package:app_main/src/presentation/call/widgets/no_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobilehub_ui_core/mobilehub_ui_core.dart';
import 'package:ui/ui.dart';

class CallHistoryTab extends StatefulWidget {
  const CallHistoryTab({super.key});

  @override
  CallHistoryTabState createState() => CallHistoryTabState();
}

class CallHistoryTabState extends State<CallHistoryTab> {
  final CallHistoryCubit _cubit = getIt.get();

  @override
  void initState() {
    _cubit.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CallHistoryCubit, CallHistoryState>(
      bloc: _cubit,
      builder: (_, state) {
        return state.when((data, canLoadMore, page) {
          if (data.isEmpty) {
            return const NoDataWidget();
          }
          return ListView.separated(
              itemBuilder: (_, index) {
                if (index == data.length && canLoadMore) {
                  _cubit.loadMore();
                  return const LoadingWidget();
                }
                return CallHistoryWidget(
                  data: data[index],
                  cubit: _cubit,
                );
              },
              separatorBuilder: (_, __) => kSpacingHeight12,
              itemCount: canLoadMore ? data.length + 1 : data.length);
        }, loading: () => const LoadingWidget(), error: (error) => const SizedBox());
      },
    );
  }
}
