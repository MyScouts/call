import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/app_coordinator.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class AskJoinTeamDialog extends StatefulWidget {
  final Function() onCancel;
  const AskJoinTeamDialog({
    super.key,
    required this.onCancel,
  });

  @override
  State<AskJoinTeamDialog> createState() => _AskJoinTeamDialogState();
}

class _AskJoinTeamDialogState extends State<AskJoinTeamDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
      contentPadding: const EdgeInsets.only(top: 10, bottom: 20),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      content: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: paddingHorizontal),
        width: MediaQuery.of(context).size.width,
        child: _buildBody(),
      ),
    );
  }

  _buildBody() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.topRight,
          child: CustomCloseButton(onPressed: context.pop),
        ),
        Assets.icons_ic_circle_success.image(width: 60),
        const SizedBox(height: 10),
        Text(
          "Đã gửi thành công yêu cầu",
          style: context.textTheme.titleMedium,
        ),
        const SizedBox(height: 10),
        Text(
          "Yêu cầu đăng ký Team thành công Vui lòng chờ cho đến khi Bos Team phê duyệt!",
          textAlign: TextAlign.center,
          style: context.textTheme.bodyMedium,
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: widget.onCancel,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0XFFF4F4F4),
                border: Border.all(
                  color: Colors.grey,
                )),
            alignment: Alignment.center,
            child: Text(
              "Hủy yêu cầu",
              style: context.textTheme.titleMedium,
            ),
          ),
        )
      ],
    );
  }
}
