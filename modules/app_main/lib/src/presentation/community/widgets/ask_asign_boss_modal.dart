import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/community/community_coordinator.dart';
import 'package:app_main/src/presentation/marshop/widgets/gradiant_button.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:ui/ui.dart';

class AskAssignBossModal extends StatelessWidget {
  final Team team;
  const AskAssignBossModal({
    super.key,
    required this.team,
  });

  @override
  Widget build(BuildContext context) {
    return DialogContainerWidget(
      marginContent: const EdgeInsets.symmetric(horizontal: 30),
      paddingContent: const EdgeInsets.only(
        left: 14,
        right: 14,
        top: 0,
        bottom: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: CustomCloseButton(onPressed: () => Navigator.pop(context)),
          ),
          ImageWidget(
            ImageConstants.bgEmpty,
            width: 200,
          ),
          const SizedBox(height: 20),
          Text(
            "Hiện tại chưa có Boss Team",
            style: context.textTheme.titleMedium!.copyWith(
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            "Bạn có thể chỉ định Boss Team ngay bây giờ bằng cách chọn người bạn muốn ở trong Team.",
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          GradiantButton(
            onPressed: () {
              context.startAssignTeam(team).then(
                    (value) => Navigator.pop(context, value),
                  );
            },
            child: Text("Chỉ định ngay"),
          )
        ],
      ),
    );
  }
}
