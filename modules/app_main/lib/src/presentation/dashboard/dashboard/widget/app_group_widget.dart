import 'package:app_main/src/core/services/notification_center.dart';
import 'package:app_main/src/presentation/dashboard/dashboard_constants.dart';
import 'package:app_main/src/presentation/dashboard/dashboard_coordinator.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

import 'app_icon_animation.dart';
import 'app_widget.dart';
import 'dashboard_group_screen.dart';

class AppGroupWidget extends AppWidget {
  const AppGroupWidget({super.key, required super.app});

  @override
  Widget build(BuildContext context) {
    final group = app as DashBoardGroupItem;

    final widget = context.findAncestorWidgetOfExactType<AppIconAnimation>();

    return Column(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                HeroDialogRoute(
                  builder: (BuildContext context) {
                    return DashBoardGroupScreen(
                      enableRemoveIcon: widget != null,
                      group: group,
                      onGroupCreated: (DashBoardGroupItem group) {
                        NotificationCenter.post(
                          channel: changeGroupEvent,
                          options: group,
                        );
                      },
                    );
                  },
                ),
              );
            },
            child: Hero(
              tag: group.id,
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
                        .take(9)
                        .map((e) => ImageWidget(e.backgroundImage))
                        .toList(),
                  ),
                ),
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

class AppEmptyWidget extends AppWidget {
  const AppEmptyWidget({super.key, required super.app});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              context.showAppStore();
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(14),
              ),
              child:
                  const Icon(Icons.filter_center_focus, color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 20)
      ],
    );
  }
}
