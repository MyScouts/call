import 'package:app_main/src/presentation/dashboard/dashboard/state/dashboard_base_bloc.dart';
import 'package:app_main/src/presentation/dashboard/dashboard/widget/dashboard_base_tab.dart';
import 'package:flutter/material.dart';

class DashBoardCommunityTab extends StatefulWidget {
  const DashBoardCommunityTab({super.key});

  @override
  State<DashBoardCommunityTab> createState() => _DashBoardCommunityTabState();
}

class _DashBoardCommunityTabState
    extends DashBoardBaseState<DashboardCommunityBloc, DashBoardCommunityTab> {}
