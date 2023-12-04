import 'package:design_system/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

class DashboardCmPromotion extends StatelessWidget {
  const DashboardCmPromotion({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14.0),
      child: ImageWidget(
        Assets.icons_dashboard_banner.path,
        fit: BoxFit.fill,
      ),
    );
  }
}
