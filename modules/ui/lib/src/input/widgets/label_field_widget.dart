import 'package:flutter/material.dart';

class LabelFieldWidget extends StatelessWidget {
  final String text;
  final bool required;

  final bool isBold;

  const LabelFieldWidget({
    super.key,
    required this.text,
    this.required = false,
    this.isBold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12, top: 20),
      child: Row(
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: isBold ? FontWeight.w600 : FontWeight.w500,
                ),
          ),
          if (required)
            Text(
              ' *',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.red,
                  ),
            ),
        ],
      ),
    );
  }
}
