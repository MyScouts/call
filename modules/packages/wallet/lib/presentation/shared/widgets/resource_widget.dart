import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class ResourceWidget extends StatelessWidget {
  final String title;
  final String amount;
  const ResourceWidget({super.key, required this.title, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: context.text.titleMedium?.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        ),
        Text(
          amount,
          style: context.text.titleMedium?.copyWith(
            color: const Color(0xFF4B84F7),
            fontWeight: FontWeight.w700,
            fontSize: 24,
            height: 1.4,
          ),
        ),
      ],
    );
  }
}
