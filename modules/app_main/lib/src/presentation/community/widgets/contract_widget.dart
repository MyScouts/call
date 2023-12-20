import 'package:app_main/src/presentation/general_setting/contracts/contract_constant.dart';
import 'package:app_main/src/presentation/general_setting/general_coordinator.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ContractWidget extends StatelessWidget {
  final bool isAccepted;

  const ContractWidget({
    super.key,
    required this.isAccepted,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Tôi đã đọc và đồng ý với ',
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: const Color(0xFF8C8C8C),
              fontWeight: FontWeight.w400,
              height: 1.6,
            ),
        children: [
          TextSpan(
            text: 'Hợp đồng Boss Group',
            style: TextStyle(
              decoration: TextDecoration.underline,
              color: isAccepted == true ? AppColors.blue31 : Colors.grey,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () => context.startContractView(
                    type: TypeContract.joinBossGroup,
                  ),
          ),
          const TextSpan(text: ' của VDONE')
        ],
      ),
    );
  }
}
