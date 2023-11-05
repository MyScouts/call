import 'package:app_core/app_core.dart';
import 'package:app_main/src/blocs/user_action/user_action_cubit.dart';
import 'package:app_main/src/data/models/payloads/user/user_action_payload.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:ui/ui.dart';

class BlockUserModal extends StatefulWidget {
  final User userInfo;
  const BlockUserModal({
    super.key,
    required this.userInfo,
  });

  @override
  State<BlockUserModal> createState() => _ReportUserModalState();
}

class _ReportUserModalState extends State<BlockUserModal> {
  final TextEditingController _contentCtrl = TextEditingController();
  final ValueNotifier<bool> _formValidCtrl = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _contentCtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: const EdgeInsets.only(
          left: paddingHorizontal,
          right: paddingHorizontal,
          bottom: 30,
        ),
        decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_ios),
              ),
            ),
            Center(
              child: SizedBox(
                height: 80,
                width: 80,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: ImageWidget(
                    ImageConstants.defaultUserAvatar,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Text(
                "Chặn ${widget.userInfo.getdisplayName} ?",
                style: context.textTheme.titleMedium!.copyWith(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 5),
            Center(
              child: Text(
                "Hành động này sẽ khiến tài khoản ${widget.userInfo.getdisplayName} không thể:",
                style: context.textTheme.labelMedium!.copyWith(
                  color: AppColors.grey14,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            _buildRule(
              icon: IconAppConstants.icNewsBan,
              text: "Xem bài viết trên dòng thời gian của bạn",
            ),
            _buildRule(
              icon: IconAppConstants.icChatBan,
              text: "Nhắn tin cho bạn",
            ),
            _buildRule(
              icon: IconAppConstants.icFriendBan,
              text: "Thêm bạn làm bạn bè",
            ),
            _buildRule(
              icon: IconAppConstants.icNewsBan,
              text:
                  "Nếu các bạn là bạn bè, việc chặn ${widget.userInfo.getdisplayName} cũng sẽ huỷ kết bạn với cô ấy",
            ),
            const SizedBox(height: 20),
            PrimarySolidButton(
              title: "Chặn",
              onTap: () => context.read<UserActionCubit>().blockUser(
                    userId: widget.userInfo.id!,
                  ),
              disabled: false,
              color: AppColors.red500,
              width: null,
            ),
          ],
        ),
      ),
    );
  }

  _buildRule({required String icon, required String text}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          ImageWidget(icon),
          const SizedBox(width: 5),
          Expanded(
            child: Text(
              text,
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
