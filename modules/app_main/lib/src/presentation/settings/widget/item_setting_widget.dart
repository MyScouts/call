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
  final BorderRadiusGeometry? border;
  final bool hasBorder;
  final Function()? onPressed;
  final Function(bool)? onUpdate;

  const ItemSettingWidget({
    super.key,
    this.title,
    this.name,
    this.summary,
    this.avatar,
    this.icon,
    this.onPressed,
    this.border,
    this.hasBorder = false,
    this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: border ?? BorderRadius.circular(10),
          boxShadow: context.theme.themeDecoration.defaultShadow,
        ),
        child: Row(
          children: [
            if (avatar != null)
              const IntrinsicHeight(
                child: CircleAvatar(),
              ),
            if (icon != null)
              IntrinsicHeight(
                child: ImageWidget(
                  icon!,
                  width: 20,
                ),
              ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  border: hasBorder
                      ? const Border(
                          bottom: BorderSide(
                            width: .5,
                            color: Color(0xFFF2F2F6),
                          ),
                        )
                      : null,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (title != null)
                              Text(
                                title!,
                                style: context.text.bodyLarge!.copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            if (name != null) const SizedBox(height: 2),
                            if (name != null)
                              Text(
                                name!,
                                softWrap: true,
                                style: context.text.titleMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            if (summary != null)
                              Text(
                                summary!,
                                style: context.text.titleSmall,
                              )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
