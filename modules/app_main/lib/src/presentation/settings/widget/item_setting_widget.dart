import 'package:app_core/app_core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

class ItemSettingWidget extends StatelessWidget {
  final String? title;
  final String? name;
  final String? summary;
  final String? avatar;
  final String? icon;
  final bool hasBorder;
  final Function()? onPressed;

  const ItemSettingWidget({
    super.key,
    this.title,
    this.name,
    this.summary,
    this.avatar,
    this.hasBorder = false,
    this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 11),
        child: IntrinsicHeight(
          child: Row(
            children: [
              if (avatar != null) const CircleAvatar(radius: 32),
              if (icon != null) ImageWidget(icon!, width: 20),
              const SizedBox(width: 15),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (title != null)
                          Text(
                            title!,
                            style: context.text.bodyLarge!.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        if (name != null) const SizedBox(height: 2),
                        if (name != null)
                          Text(
                            name!,
                            style: context.text.titleSmall,
                          ),
                        if (summary != null)
                          Text(
                            summary!,
                            style: context.text.titleSmall,
                          )
                      ],
                    ),
                    const RotatedBox(
                      quarterTurns: 90,
                      child: Icon(
                        Icons.keyboard_arrow_left_outlined,
                        size: 25,
                        color: AppColors.grey14,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
