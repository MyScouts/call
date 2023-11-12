import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/marshop/widgets/gradiant_button.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:ui/ui.dart';

class WarningModal extends StatelessWidget {
  const WarningModal({super.key});

  @override
  Widget build(BuildContext context) {
    return DialogContainerWidget(
      marginContent: const EdgeInsets.symmetric(horizontal: 30),
      paddingContent: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          ImageWidget(IconAppConstants.icWaiting),
          Text(
            "Chờ phê duyệt yêu cầu",
            style: context.textTheme.titleMedium!.copyWith(
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            "Yêu cầu của bạn đã được gửi lên hệ thống của chúng tôi.",
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          GradiantButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Xác nhận"),
          )
        ],
      ),
    );
  }
}
