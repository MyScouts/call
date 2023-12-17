import 'package:app_main/src/presentation/community/widgets/policy_boss_group_content.dart';
import 'package:app_main/src/presentation/general_setting/general_coordinator.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class PolicyBossGroupWidget extends StatelessWidget {
  final bool isAccepted;

  const PolicyBossGroupWidget({
    super.key,
    required this.isAccepted,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Tôi đồng ý với ',
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: AppColors.grey10,
              fontWeight: FontWeight.w500,
              height: 1.5,
            ),
        children: [
          TextSpan(
            text: 'Quy định chung về Boss Group và Boss Team',
            style: TextStyle(
              decoration: TextDecoration.underline,
              color: isAccepted == true ? AppColors.blue31 : Colors.grey,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap =
                  () => context.startTermsAndCondition(policyBossGroupContents),
          ),
          const TextSpan(text: ' của VDONE')
        ],
      ),
    );
  }
}
