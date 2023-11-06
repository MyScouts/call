import 'package:app_core/app_core.dart';
import 'package:design_system/design_system.dart';
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
          color: const Color(0xffF3F5F7),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(5),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                Expanded(
                  flex: 1,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                    child: ImageWidget(
                      group.banner ?? ImageConstants.communityBanner,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const Spacer(flex: 1),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 3,
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
          ],
        ),
      ),
    );
  }
}
