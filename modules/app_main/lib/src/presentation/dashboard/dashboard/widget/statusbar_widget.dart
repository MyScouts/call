import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/dashboard/dashboard_coordinator.dart';
import 'package:app_main/src/presentation/settings/setting_coordinator.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:localization/localization.dart';

class StatusBarWidget extends StatefulWidget {
  final Function() openAppStore;
  const StatusBarWidget({
    super.key,
    required this.openAppStore,
  });

  @override
  State<StatusBarWidget> createState() => _StatusBarWidgetState();
}

class _StatusBarWidgetState extends State<StatusBarWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.startSearch(),
      child: Container(
        constraints: const BoxConstraints(maxHeight: 35),
        padding: const EdgeInsets.symmetric(horizontal: paddingHorizontal),
        child: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () => context.startSetting(),
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: CircleAvatar(),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  height: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      ImageWidget(
                        IconAppConstants.icSearch,
                        color: Colors.white,
                      ),
                      Text(
                        "${S.current.search.capitalize()}...",
                        style: context.text.bodyMedium!.copyWith(
                          color: Colors.white.withOpacity(.8),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: IconButton(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.zero,
                  icon: ImageWidget(
                    IconAppConstants.icHamburger,
                  ),
                  onPressed: widget.openAppStore,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
