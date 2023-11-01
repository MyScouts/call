import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

const kHeighIconVerticalButton = 91.0;

class IconVerticalButton extends StatelessWidget {
  const IconVerticalButton({
    super.key,
    required this.icon,
    required this.title,
    required this.isSelected,
    this.height = kHeighIconVerticalButton,
    this.width,
    this.onTap,
    this.sizeIcon,
    this.shadow = true,
    this.paddingIcon = const EdgeInsets.only(bottom: 6.25, top: 8),
  });

  final String icon;
  final String title;
  final bool isSelected;
  final void Function()? onTap;
  final double? height;
  final double? width;
  final double? sizeIcon;
  final bool shadow;
  final EdgeInsets paddingIcon;

  const IconVerticalButton.noShadow({
    super.key,
    required this.icon,
    required this.title,
    this.height = kHeighIconVerticalButton,
    this.width,
    this.onTap,
    this.sizeIcon,
    this.paddingIcon = const EdgeInsets.only(bottom: 10, top: 8),
  })  : shadow = false,
        isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          if (isSelected && shadow)
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              offset: const Offset(0, 4),
              blurRadius: 20,
              spreadRadius: 0,
            ),
        ],
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: paddingIcon,
                child: ImageWidget(
                  icon,
                  width: sizeIcon,
                  height: sizeIcon,
                ),
              ),
              if (title.isNotEmpty)
                Expanded(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 11,
                        color:
                            isSelected ? AppColors.blue15 : AppColors.grey20),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
