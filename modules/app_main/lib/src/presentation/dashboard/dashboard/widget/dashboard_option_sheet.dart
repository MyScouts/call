import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/services/notification_center.dart';
import 'package:app_main/src/presentation/dashboard/dashboard/state/dashboard_base_bloc.dart';
import 'package:app_main/src/presentation/dashboard/dashboard_constants.dart';
import 'package:app_main/src/presentation/dashboard/widget/clock_widget.dart';
import 'package:app_main/src/presentation/dashboard/widget/weather_widget.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:localization/generated/l10n.dart';
import 'package:reorderable/reorderable.dart';

import 'app_widget.dart';

class DashBoardOptionSheet extends StatefulWidget {
  const DashBoardOptionSheet({super.key});

  @override
  State<DashBoardOptionSheet> createState() => _DashBoardOptionSheetState();
}

class _DashBoardOptionSheetState extends State<DashBoardOptionSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox.square(
                dimension: 30,
                child: ElevatedButton(
                  onPressed: Navigator.of(context).pop,
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    backgroundColor: Colors.black.withOpacity(.05),
                  ),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Color(0xff8E8E93),
                    size: 16,
                  ),
                ),
              ),
              SizedBox.square(
                dimension: 30,
                child: ElevatedButton(
                  onPressed: Navigator.of(context).pop,
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    backgroundColor: Colors.black.withOpacity(.05),
                  ),
                  child: const Icon(
                    Icons.close,
                    color: Color(0xff8E8E93),
                    size: 16,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          DecoratedBox(
            decoration: BoxDecoration(
              color: const Color(0xffE9E9EA),
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox.square(
                    dimension: 18,
                    child: ImageWidget(
                      IconAppConstants.icSearch,
                      color: const Color(0xff4F4F4F),
                    ),
                  ),
                  const SizedBox(width: 9),
                  Text(
                    S.current.search.capitalize(),
                    style: context.text.bodyMedium!.copyWith(
                      color: const Color(0xff8A8888),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: StaggeredGrid.count(
              crossAxisCount: 4,
              mainAxisSpacing: 20,
              crossAxisSpacing: 18,
              children: mapItems.values
                  .map(
                    (e) => StaggeredGridTile.count(
                      crossAxisCellCount: e.height,
                      mainAxisCellCount: e.width,
                      child: GestureDetector(
                        onTap: () {
                          NotificationCenter.post(
                            channel: addDashBoardItemEvent,
                            options: e,
                          );
                          Navigator.of(context).pop();
                        },
                        behavior: HitTestBehavior.opaque,
                        child: Builder(
                          builder: (ctx) {
                            if (e.id == "wg_clock") {
                              return const ClockWidget(
                                textColor: Colors.black,
                              );
                            }

                            if (e.id == "wg_weather") {
                              return const WeatherWidget(
                                textColor: Colors.black,
                              );
                            }

                            return AppWidget(
                              app: e,
                              textColor: Colors.black,
                              disablePress: true,
                            );
                          },
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
