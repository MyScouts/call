import 'package:app_main/src/presentation/general_setting/terms_conditions/widgets/policy_content.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../general_setting/general_coordinator.dart';

class PolicyWidget extends StatelessWidget {
  final bool isAccepted;

  const PolicyWidget({
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
            ),
        children: [
          TextSpan(
            text: 'Điều khoản dịch vụ và Chính sách ',
            style: TextStyle(
              decoration: TextDecoration.underline,
              color: isAccepted == true ? AppColors.blue31 : Colors.grey,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () => context.startTermsAndCondition(policyContents),
          ),
          const TextSpan(text: 'của VDONE')
        ],
      ),
    );
  }
}
