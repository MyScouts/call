import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

import '../../community_constants.dart';

class CommunityEventGroup extends StatefulWidget {
  const CommunityEventGroup({
    super.key,
    this.onTap,
  });

  final void Function(CommunityEventType)? onTap;

  @override
  State<CommunityEventGroup> createState() => _CommunityEventGroupState();
}

class _CommunityEventGroupState extends State<CommunityEventGroup> {
  CommunityEventType? _eventType;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, BoxConstraints constraints) {
      if (context.isTablet || constraints.maxWidth == double.infinity) {
        return Row(
          children: CommunityEventType.values
              .map(
                (e) => SizedBox(
                  width: 86,
                  child: IconVerticalButton(
                    icon: e.icon,
                    title: e.text(context),
                    isSelected: _eventType == e,
                    onTap: () {
                      widget.onTap?.call(e);
                      setState(() {
                        _eventType = e;
                      });
                    },
                  ),
                ),
              )
              .toList(),
        );
      }

      final widthItem = (constraints.maxWidth -
              (16 * (CommunityEventType.values.length - 1))) /
          CommunityEventType.values.length;

      return SizedBox(
        height: kHeighIconVerticalButton,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final e = CommunityEventType.values[index];

            return SizedBox(
              width: widthItem,
              child: IconVerticalButton(
                height: kHeighIconVerticalButton,
                icon: e.icon,
                title: e.text(context),
                isSelected: _eventType == e,
                onTap: () {
                  widget.onTap?.call(e);
                  setState(() {
                    _eventType = e;
                  });
                },
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(width: 16),
          itemCount: CommunityEventType.values.length,
        ),
      );
    });
  }
}
