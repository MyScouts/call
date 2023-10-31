import 'package:app_main/src/presentation/dashboard/dashboard/widget/app_widget.dart';
import 'package:app_main/src/presentation/dashboard/dashboard_constants.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class DockWidget extends StatefulWidget {
  const DockWidget({super.key});

  @override
  State<DockWidget> createState() => _DockWidgetState();
}

class _DockWidgetState extends State<DockWidget> {
  final double runSpacing = 20;
  final double spacing = 20;
  final int listSize = 3;
  final columns = 5;

  final List<AppItem> _dockApps = [
    AppItem(avatar: IconAppConstants.icECommerce, title: "", id: 1),
    AppItem(avatar: IconAppConstants.icVDone, title: "", id: 2),
    AppItem(avatar: IconAppConstants.icNews, title: "", id: 3),
  ];

  @override
  Widget build(BuildContext context) {
    final w = (MediaQuery.of(context).size.width - runSpacing * (columns - 1)) /
        columns;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white.withOpacity(.3),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Wrap(
        runSpacing: runSpacing,
        spacing: spacing,
        alignment: WrapAlignment.center,
        children: _dockApps.map((item) {
          return SizedBox(
            width: w,
            height: w,
            child: AppWidget(app: item),
          );
        }).toList(),
      ),
    );
  }
}
