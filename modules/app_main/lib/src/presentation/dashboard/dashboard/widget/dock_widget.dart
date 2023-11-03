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
  final List<DashBoardIconItem> _dockApps = [
    DashBoardIconItem(
      backgroundImage: IconAppConstants.icECommerce,
      title: "",
      id: "ecommerce",
    ),
    DashBoardIconItem(
      backgroundImage: IconAppConstants.icVDone,
      title: "",
      id: "vDone",
    ),
    DashBoardIconItem(
      backgroundImage: IconAppConstants.icNews,
      title: "",
      id: "news",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white.withOpacity(.3),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _dockApps.map((item) {
          if(_dockApps.first == item || _dockApps.last == item) {
            return SizedBox(
              width: 60,
              height: 60,
              child: AppWidget(app: item),
            );
          }
          return SizedBox(
            width: 80,
            height: 80,
            child: AppWidget(app: item),
          );
        }).toList(),
      ),
    );
  }
}
