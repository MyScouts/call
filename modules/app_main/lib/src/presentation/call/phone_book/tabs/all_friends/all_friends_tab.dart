//import 'dart:developer' as developer;
import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/presentation/call/phone_book/tabs/all_friends/cubit/all_friends_cubit.dart';
import 'package:app_main/src/presentation/call/phone_book/tabs/all_friends/cubit/all_friends_state.dart';
import 'package:app_main/src/presentation/call/widgets/friend_widget.dart';
import 'package:app_main/src/presentation/call/widgets/no_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobilehub_ui_core/mobilehub_ui_core.dart';
import 'package:ui/ui.dart';

class AllFriendsTab extends StatefulWidget {
  const AllFriendsTab({super.key});

  @override
  AllFriendsTabState createState() => AllFriendsTabState();
}

class AllFriendsTabState extends State<AllFriendsTab> {
  final AllFriendsCubit _cubit = getIt.get();

  @override
  void initState() {
    _cubit.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllFriendsCubit, AllFriendsState>(
      bloc: _cubit,
      builder: (_, state) {
        return state.when((data, canLoadMore, page) {
          if (data.isEmpty) {
            return const NoDataWidget();
          }
          return ListView.separated(
              itemBuilder: (_, index) {
                if(index == data.length && canLoadMore) {
                  _cubit.loadMore();
                  return const LoadingWidget();
                }
                return FriendWidget(data: data[index]);
              },
              separatorBuilder: (_, __) => kSpacingHeight12,
          itemCount: canLoadMore ? data.length + 1 : data.length);
        }, loading: () => const LoadingWidget(), error: (error) => const SizedBox());
      },
    );
  }
}
