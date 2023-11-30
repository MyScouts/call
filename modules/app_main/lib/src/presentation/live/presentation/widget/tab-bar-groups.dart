import 'package:app_core/app_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localization/localization.dart';

class TabBarGroups extends StatefulWidget {
  final TabController controller;

  const TabBarGroups({super.key, required this.controller});

  @override
  State<TabBarGroups> createState() => _TabBarGroupsState();
}

enum TabLiveEnum { live, tvLive, marShop }

extension TabLiveEnumExt on TabLiveEnum {
  String get title {
    switch (this) {
      case TabLiveEnum.live:
        return S.current.live;
      case TabLiveEnum.tvLive:
        return S.current.tv_live;
      case TabLiveEnum.marShop:
        return S.current.marShop;
    }
  }
}

class _TabBarGroupsState extends State<TabBarGroups> {
  final indexSelect = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: TabLiveEnum.values.mapIndexed((index, e) {
          return GestureDetector(
            onTap: () {
              indexSelect.value = index;
              widget.controller.animateTo(index);
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Obx(() {
                    final color = indexSelect.value == index ? const Color(0xff4B84F7) : const Color(0xff8C8C8C);
                    return Text(
                      TabLiveEnum.values[index].title,
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: color),
                    );
                  }),
                  const SizedBox(height: 4),
                  Container(
                      width: 22,
                      height: 4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3.5),
                          color: indexSelect.value == index ? const Color(0xff4B84F7) : Colors.transparent))
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
