import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class AttributeGenerator extends StatelessWidget {
  final Map<String, Widget> data;
  final MapEntry<Widget, Widget>? titleBar;

  const AttributeGenerator({
    Key? key,
    required this.data,
    this.titleBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (titleBar != null)
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                titleBar!.key,
                const Spacer(),
                titleBar!.value,
              ],
            ),
          ),
        ...data.entries.map(
          (e) => Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                Text(
                  e.key,
                  style: context.text.bodyMedium!.copyWith(
                    color: AppColors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: DefaultTextStyle(
                    style: context.text.bodyMedium!.copyWith(
                      color: AppColors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.right,
                    child: e.value,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
