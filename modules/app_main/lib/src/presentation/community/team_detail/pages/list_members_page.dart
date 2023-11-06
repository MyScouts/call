import 'package:app_core/app_core.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

import '../../widgets/user_information_horizontal_widget.dart';
import '../bloc/team_detail_bloc.dart';

class ListMembersPage extends StatefulWidget {
  const ListMembersPage({super.key});

  @override
  State<ListMembersPage> createState() => _ListMembersPageState();
}

class _ListMembersPageState extends State<ListMembersPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeamDetailBloc, TeamDetailState>(
      builder: (context, state) {
        List<Member> lists = [];

        if (state is FetchTeamsMemberSuccess) {
          lists = state.members;
          if (lists.isEmpty) {
            return const EmptyDataListWidget(title: 'Chưa có thành viên.');
          }
        }

        return ListView.builder(
          itemBuilder: (_, int index) {
            final user = lists[index].user!;
            return UserHorizontalWidget(user: user);
          },
          itemCount: lists.length,
        );
      },
    );
  }
}
