import 'package:app_main/src/presentation/dashboard/dashboard_constants.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

import 'app_widget.dart';

class AppGroupWidget extends AppWidget {
  const AppGroupWidget({super.key, required super.app});

  @override
  Widget build(BuildContext context) {
    final group = app as DashBoardGroupItem;
    return Column(
      children: [
        Expanded(
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(17, 17, 17, 0.40),
                borderRadius: BorderRadius.circular(15),
              ),
              child: GridView.count(
                padding: const EdgeInsets.all(16.0),
                crossAxisCount: 3,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                children: group.items
                    .map((e) => ImageWidget(e.backgroundImage))
                    .toList(),
              ),
            ),
          ),
        ),
        if (group.title.isNotEmpty) const SizedBox(height: 5),
        if (group.title.isNotEmpty)
          Text(
            group.title,
            maxLines: 1,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: context.text.titleSmall!.copyWith(
              color: AppColors.white,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
      ],
    );
  }
}
