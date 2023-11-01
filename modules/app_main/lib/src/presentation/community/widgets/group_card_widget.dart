import 'package:app_core/app_core.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

class GroupCardWidget extends StatelessWidget {
  final Group group;
  final ValueChanged<Group>? onTap;

  const GroupCardWidget({super.key, required this.group, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(group),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              offset: const Offset(0, 4),
              blurRadius: 15,
              spreadRadius: 0,
            ),
          ],
        ),
        margin: const EdgeInsets.all(4),
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 4,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: ImageWidget(
                    group.avatar!.optimizeSize400,
                    borderRadius: 100,
                  ),
                ),
              ),
              if (group.name?.isNotEmpty ?? false)
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.only(top: 6.0, bottom: 12),
                    child: Text(
                      group.name!.toUpperCase(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontSize: 9,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFFE4221F),
                          ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
