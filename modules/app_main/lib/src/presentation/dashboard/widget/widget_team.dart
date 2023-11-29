import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

class WidgetTeam extends StatelessWidget {
  const WidgetTeam({
    super.key,
    this.enableEditMode = false,
    this.onRemoved,
  });

  final bool enableEditMode;
  final VoidCallback? onRemoved;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Stack(
            clipBehavior: Clip.none,
            fit: StackFit.expand,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22.0),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 12),
                child: ImageWidget(
                  IconAppConstants.widgetTeam,
                  fit: BoxFit.fill,
                ),
              ),
              if (enableEditMode)
                Positioned(
                  left: 5,
                  top: -10,
                  child: GestureDetector(
                    onTap: onRemoved,
                    behavior: HitTestBehavior.opaque,
                    child: const SizedBox.square(
                      dimension: 25,
                      child: Center(
                        child: CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 15,
                          child: Icon(
                            Icons.remove,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        Text(
          'Live',
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
