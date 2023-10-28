import 'package:app_main/src/presentation/general_setting/general_coordinator.dart';
import 'package:app_main/src/presentation/general_setting/terms_conditions/widgets/policy_content.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class ReadMorePolicy extends StatefulWidget {
  const ReadMorePolicy({super.key});

  @override
  State<ReadMorePolicy> createState() => _ReadMorePolicyState();
}

class _ReadMorePolicyState extends State<ReadMorePolicy> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(20, 10, 20, MediaQuery.of(context).padding.bottom + 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                policyContents.first['title'].toString(),
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Text(
                policyContents.first['content'].toString(),
                maxLines: 15,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      height: 1.5,
                      fontWeight: FontWeight.w400,
                    ),
              ),
              GestureDetector(
                onTap: context.startTermsAndCondition,
                child: Text(
                  'Xem thêm',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
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
