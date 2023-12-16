import 'package:app_main/src/presentation/general_setting/general_coordinator.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'policy_boss_group_content.dart';

class ReadMorePolicyBossGroup extends StatefulWidget {
  final int? maxLine;

  const ReadMorePolicyBossGroup({super.key, this.maxLine});

  @override
  State<ReadMorePolicyBossGroup> createState() =>
      _ReadMorePolicyBossGroupState();
}

class _ReadMorePolicyBossGroupState extends State<ReadMorePolicyBossGroup> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                policyBossGroupContents.first['title'].toString(),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF373737),
                      height: 1.6,
                    ),
              ),
              Text(
                policyBossGroupContents.first['content'].toString(),
                maxLines: widget.maxLine ?? 18,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      height: 1.6,
                      fontWeight: FontWeight.w400,
                    ),
              ),
              Text(
                policyBossGroupContents[1]['title'].toString(),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF373737),
                      height: 1.6,
                    ),
              ),
              Text(
                policyBossGroupContents[1]['content'].toString(),
                maxLines: widget.maxLine ?? 18,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      height: 1.6,
                      fontWeight: FontWeight.w400,
                    ),
              ),
              Text(
                policyBossGroupContents[2]['title'].toString(),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF373737),
                      height: 1.6,
                    ),
              ),
              Text(
                policyBossGroupContents[2]['content'].toString(),
                maxLines: widget.maxLine ?? 18,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      height: 1.6,
                      fontWeight: FontWeight.w400,
                    ),
              ),
              GestureDetector(
                onTap: () => context.startTermsAndCondition(policyBossGroupContents),
                child: Text(
                  'Xem thêm',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        height: 1.6,
                        color: AppColors.blue25,
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
