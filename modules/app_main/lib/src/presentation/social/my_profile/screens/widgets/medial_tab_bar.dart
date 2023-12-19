
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

import '../../../social_constants.dart';

class MedialTabBar extends StatefulWidget {
  final int index;
  final Function(int) onChange;

  const MedialTabBar({
    super.key,
    required this.index,
    required this.onChange,
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
          activeIconName: MedialEnum.getActiveIconName(MedialEnum.video),
        ),
        _tab(
          MedialEnum.reels.index,
          text: MedialEnum.reels.text,
          iconName: MedialEnum.getIconName(MedialEnum.reels),
          activeIconName: MedialEnum.getActiveIconName(MedialEnum.reels),
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
    final bool selected = widget.index == index;

    return Expanded(
      child: InkWell(
        onTap: () {
          widget.onChange(index);
        
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
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
              const SizedBox(width: 4),
              Text(
                text,
                style: TextStyle(
                  fontSize: 14,
                  color: selected ? AppColors.blueEdit : AppColors.grey78,
                  fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
