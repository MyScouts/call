import 'package:app_main/src/presentation/dashboard/dashboard_constants.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'app_widget.dart';

class DockWidget extends StatefulWidget {
  const DockWidget({super.key});

  @override
  State<DockWidget> createState() => _DockWidgetState();
}

class _DockWidgetState extends State<DockWidget> {
  final List<DashBoardIconItem> _dockApps = [
    DashBoardIconItem(
      backgroundImage: IconAppConstants.icMess,
      title: "",
      id: "message",
    ),
    DashBoardIconItem(
      backgroundImage: IconAppConstants.icVDone,
      title: "",
      id: "vDone",
    ),
    DashBoardIconItem(
      backgroundImage: IconAppConstants.icCall,
      title: "",
      id: "call",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 18,
          ),
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.white.withOpacity(.3),
            borderRadius: BorderRadius.circular(40),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _dockApps.map((item) {
              if (_dockApps.first == item || _dockApps.last == item) {
                return SizedBox(
                  width: 60,
                  height: 60,
                  child: AppWidget(app: item),
                );
              }
              return const Opacity(
                opacity: 0.0,
                child: SizedBox.square(dimension: 80),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
