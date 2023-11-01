import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

class EmptyDataListWidget extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String? image;
  final String? package;
  final bool isLight;

  const EmptyDataListWidget({
    super.key,
    this.title,
    this.subtitle,
    this.isLight = true,
    this.image,
    this.package,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImageWidget(
            image ?? ImageConstants.emptyDataList,
            package: package ?? ImageWidget.packageDefault,
          ),
          const SizedBox(height: 10),
          if (title?.isNotEmpty ?? false)
            Text(
              title!,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: isLight
                      ? const Color(0xFF4F4F4F)
                      : const Color(0xFFF3F3F3)),
            ),
          if (subtitle?.isNotEmpty ?? false)
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, top: 10.0),
              child: Text(
                subtitle!,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color:
                          isLight ? AppColors.grey50 : const Color(0xFF959595),
                      fontSize: 12,
                      height: 1.4,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
        ],
      ),
    );
  }
}
