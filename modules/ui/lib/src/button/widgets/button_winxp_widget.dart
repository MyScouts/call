import 'package:flutter/material.dart';

class ButtonWinxpWidget extends StatelessWidget {
  const ButtonWinxpWidget({
    super.key,
    required this.title,
    this.isSelected = false,
    this.margin,
    this.onTap,
    this.icon,
  });

  final bool isSelected;
  final Widget? icon;
  final EdgeInsets? margin;
  final void Function()? onTap;

  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: margin,
        decoration: BoxDecoration(
          gradient: isSelected
              ? const LinearGradient(
                  colors: [
                    Color(0xff99D7FF),
                    Color(0xff1E90FF),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )
              : null,
          color: isSelected ? null : const Color(0xffECF2FF),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: LayoutBuilder(builder: (_, boxConstraints) {
          return Row(
            mainAxisAlignment: icon == null
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            children: [
              if (icon != null) icon!,
              Text(
                title,
                style: isSelected
                    ? Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Colors.white,
                        )
                    : Theme.of(context)
                        .textTheme
                        .labelMedium
                        ?.copyWith(fontWeight: FontWeight.w500),
              ),
            ],
          );
        }),
      ),
    );
  }
}
