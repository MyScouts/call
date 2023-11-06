import 'package:app_core/app_core.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

import '../../widgets/user_information_horizontal_widget.dart';
import '../bloc/fan_group_detail_bloc.dart';

class MemberOfGroupFanPage extends StatelessWidget {
  const MemberOfGroupFanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FanGroupDetailBloc, FanGroupDetailState>(
      builder: (context, state) {
        List<User> lists = [];

        if (state is FetchTeamsMemberSuccess) {
          lists = state.members;
          if (lists.isEmpty) {
            return const EmptyDataListWidget(title: 'Chưa có thành viên.');
          }
        }

        return ListView.builder(
          itemBuilder: (_, int index) {
            final user = lists[index];
            if (user != null) {
              return UserHorizontalWidget(user: user);
            }
            return const SizedBox();
          },
          itemCount: lists.length,
        );
      },
    );
  }
}
