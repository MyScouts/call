import 'package:design_system/design_system.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

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
                        IconAppConstants.newspaper,
                        color: (widget.controller.index == 0) ? const Color(0xff4b84f7) : const Color(0xffacacac),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'Tin Tức',
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
                        IconAppConstants.group,
                        color: (widget.controller.index == 1) ? const Color(0xff4b84f7) : const Color(0xffacacac),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'Cộng Đồng',
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
          )
        ],
      ),
    );
  }
}
