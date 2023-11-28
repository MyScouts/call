import 'package:design_system/design_system.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:localization/localization.dart';

class TabBarGroups extends StatefulWidget {
  final TabController controller;

  const TabBarGroups({super.key, required this.controller});

  @override
  State<TabBarGroups> createState() => _TabBarGroupsState();
}

class _TabBarGroupsState extends State<TabBarGroups> {
  @override
  void initState() {
    widget.controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                CupertinoButton(
                  onPressed: () {
                    widget.controller.animateTo(0);
                    setState(() {});
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ImageWidget(
                        IconAppConstants.icRadar,
                        color: (widget.controller.index == 0) ? const Color(0xff4b84f7) : const Color(0xffacacac),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        S.of(context).live,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: (widget.controller.index == 0) ? const Color(0xff4b84f7) : const Color(0xffacacac),
                            ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 3,
                  decoration: BoxDecoration(
                    color: (widget.controller.index == 0) ? const Color(0xff4b84f7) : Colors.transparent,
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                CupertinoButton(
                  onPressed: () {
                    widget.controller.animateTo(1);
                    setState(() {});
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ImageWidget(
                        IconAppConstants.icMonitor,
                        color: (widget.controller.index == 1) ? const Color(0xff4b84f7) : const Color(0xffacacac),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        S.of(context).tv_live,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: (widget.controller.index == 1) ? const Color(0xff4b84f7) : const Color(0xffacacac),
                            ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 3,
                  decoration: BoxDecoration(
                    color: (widget.controller.index == 1) ? const Color(0xff4b84f7) : Colors.transparent,
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                CupertinoButton(
                  onPressed: () {
                    widget.controller.animateTo(2);
                    setState(() {});
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ImageWidget(
                        IconAppConstants.icBag2,
                        color: (widget.controller.index == 2) ? const Color(0xff4b84f7) : const Color(0xffacacac),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        S.of(context).marShop,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: (widget.controller.index == 2) ? const Color(0xff4b84f7) : const Color(0xffacacac),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 3,
                  decoration: BoxDecoration(
                    color: (widget.controller.index == 2) ? const Color(0xff4b84f7) : Colors.transparent,
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                  ),
                )
              ],
            ),
          )

        ],
      ),
    );
  }
}
