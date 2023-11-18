import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:wallet/presentation/shared/widgets/tab_indicator_decoration.dart';

class TabbarIndicatorCenterWidget<T> extends StatelessWidget {
  const TabbarIndicatorCenterWidget({
    super.key,
    required this.controller,
    this.onChanged,
    required this.tabItems,
    required this.builderItem,
    this.paddingItem = EdgeInsets.zero,
    this.isScrollable = true,
    this.indicator,
    this.labelPadding,
    this.labelColor,
  });

  final TabController? controller;
  final void Function(int)? onChanged;
  final List<T> tabItems;
  final Widget Function(T) builderItem;
  final EdgeInsets paddingItem;
  final bool isScrollable;
  final Decoration? indicator;
  final EdgeInsets? labelPadding;
  final Color? labelColor;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: isScrollable,
      controller: controller,
      onTap: onChanged,
      labelColor: labelColor ?? AppColors.blue15,
      unselectedLabelColor: AppColors.black10,
      indicatorColor: AppColors.blue11,
      labelPadding: labelPadding ?? const EdgeInsets.symmetric(horizontal: 10),
      labelStyle: Theme.of(context).textTheme.titleSmall,
      unselectedLabelStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w500,
          ),
      indicator: indicator ??
          TabIndicatorDecoration(
            weight: 2,
            width: 8,
            color: AppColors.blue11,
          ),
      tabs: tabItems.map(
        (e) {
          return Padding(
            padding: paddingItem,
            child: builderItem(e),
          );
        },
      ).toList(),
    );
  }
}
