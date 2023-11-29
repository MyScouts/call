import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

import '../../../social_constants.dart';

class MedialTabBar extends StatefulWidget {
  final TabController controller;

  const MedialTabBar({
    super.key,
    required this.controller,
  });

  @override
  State<MedialTabBar> createState() => _MedialTabBarState();
}

class _MedialTabBarState extends State<MedialTabBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _tab(
          MedialEnum.post.index,
          text: MedialEnum.post.text,
          iconName: MedialEnum.getIconName(MedialEnum.post),
          activeIconName: MedialEnum.getActiveIconName(MedialEnum.post),
        ),
        _tab(
          MedialEnum.video.index,
          text: MedialEnum.video.text,
          iconName: MedialEnum.getIconName(MedialEnum.video),
          activeIconName: MedialEnum.getActiveIconName(MedialEnum.post),
        ),
        _tab(
          MedialEnum.reels.index,
          text: MedialEnum.reels.text,
          iconName: MedialEnum.getIconName(MedialEnum.reels),
          activeIconName: MedialEnum.getActiveIconName(MedialEnum.post),
        ),
      ],
    );
  }

  Widget _tab(
    int index, {
    required String iconName,
    required String activeIconName,
    required String text,
    double iconSize = 21,
  }) {
    final bool selected = widget.controller.index == index;

    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            widget.controller.animateTo(index);
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: selected ? AppColors.blueEdit : AppColors.grey79,
                width: selected ? 3 : 1,
              ),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageWidget(
                selected ? activeIconName : iconName,
                width: iconSize,
                height: iconSize,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 14,
                    color: selected ? AppColors.blueEdit : AppColors.grey78,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
