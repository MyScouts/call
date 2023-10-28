import 'package:flutter/material.dart';

import 'skeleton_filtered_widget.dart';

class AttributionSkeleton extends StatelessWidget {
  const AttributionSkeleton({
    super.key,
    this.isUp,
    required this.title,
    required this.value,
    required this.ratio,
  });

  final bool? isUp;
  final String title;
  final String value;
  final double ratio;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SkeletonFilteredWidget(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.transparent,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: SkeletonFilteredWidget(
                  child: Text(
                    value,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
              ),
              const SizedBox(width: 15),
            ],
          ),
        ],
      ),
    );
  }
}
