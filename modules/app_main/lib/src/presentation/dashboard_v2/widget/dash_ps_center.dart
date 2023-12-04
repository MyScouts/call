import 'package:design_system/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

class DashboardPsCenter extends StatelessWidget {
  const DashboardPsCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(14.0),
          child: ImageWidget(
            Assets.icons_dashboard_weather.path,
            fit: BoxFit.cover,
          ),
        )
      ],
    );
  }
}