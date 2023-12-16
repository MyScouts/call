import 'package:app_main/src/presentation/general_setting/general_coordinator.dart';
import 'package:app_main/src/presentation/general_setting/terms_conditions/widgets/policy_content.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class ReadMorePolicy extends StatefulWidget {
  final int? maxLine;

  const ReadMorePolicy({super.key, this.maxLine});

  @override
  State<ReadMorePolicy> createState() => _ReadMorePolicyState();
}

class _ReadMorePolicyState extends State<ReadMorePolicy> {
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
                policyContents.first['title'].toString(),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF373737),
                      height: 20 / 14,
                    ),
              ),
              Text(
                policyContents.first['content'].toString(),
                maxLines: widget.maxLine ?? 18,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      height: 1.5,
                      fontWeight: FontWeight.w400,
                    ),
              ),
              GestureDetector(
                onTap: context.startTermsAndCondition,
                child: Text(
                  'Xem thêm',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        height: 1.5,
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
