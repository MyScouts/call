import 'package:design_system/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

class DashboardPsPromotion extends StatelessWidget {
  const DashboardPsPromotion({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14.0),
      child: ImageWidget(
        Assets.icons_dashboard_banner_2.path,
        fit: BoxFit.fill,
      ),
    );
  }
}
