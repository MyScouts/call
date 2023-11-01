import 'package:flutter/material.dart';

class EmptyDataWidget extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final TextStyle? titleStyle;

  const EmptyDataWidget(
      {super.key, this.title, this.subtitle, this.titleStyle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (title?.isNotEmpty ?? false)
            Text(
              title!,
              style: titleStyle ?? Theme.of(context).textTheme.labelMedium,
            ),
          // if (subtitle?.isNotEmpty ?? false)
          //   Padding(
          //     padding: const EdgeInsets.only(left: 40, right: 40, top: 10.0),
          //     child: Text(
          //       subtitle!,
          //       style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          //             color: AppColors.grey50,
          //             fontSize: 12,
          //             height: 1.4,
          //           ),
          //       textAlign: TextAlign.center,
          //     ),
          //   ),
        ],
      ),
    );
  }
}
