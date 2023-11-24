import 'package:app_main/src/presentation/dashboard/dashboard/state/dashboard_base_bloc.dart';
import 'package:flutter/material.dart';

import 'dashboard_base_tab.dart';

class DashBoardEcommerceTab extends StatefulWidget {
  const DashBoardEcommerceTab({super.key});

  @override
  State<DashBoardEcommerceTab> createState() => _DashBoardEcommerceTabState();
}

class _DashBoardEcommerceTabState
    extends DashBoardBaseState<DashboardEcommerceBloc, DashBoardEcommerceTab> {}
