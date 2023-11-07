import 'package:app_main/src/presentation/dashboard/dashboard/state/dashboard_base_bloc.dart';
import 'package:flutter/material.dart';

import 'dashboard_base_tab.dart';
class DashBoardPersonalTab extends StatefulWidget {
  const DashBoardPersonalTab({super.key});

  @override
  State<DashBoardPersonalTab> createState() => _DashBoardPersonalTabState();
}

class _DashBoardPersonalTabState extends DashBoardBaseState<DashboardPersonalBloc, DashBoardPersonalTab> {}
