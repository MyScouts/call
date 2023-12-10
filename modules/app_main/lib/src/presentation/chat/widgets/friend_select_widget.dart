//import 'dart:developer' as developer;
import 'package:app_core/app_core.dart';
import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/domain/entities/chat/member_model.dart';
import 'package:app_main/src/presentation/chat/chat_coordinator.dart';
import 'package:app_main/src/presentation/chat/conversation/cubit/conversation_cubit.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:ui/ui.dart';

import 'avatar_member_widget.dart';

class FriendSelectWidget extends StatelessWidget {
  final MemberModel data;
  final bool isSelected;
  final VoidCallback onTap;
  const FriendSelectWidget(
      {super.key, required this.data, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AvatarMemberWidget(
              avatar: data.avatar ?? '',
              size: 40,
            ),
            kSpacingWidth8,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.displayName ?? '',
                  style: context.textTheme.headlineSmall?.copyWith(
                    color: AppColors.black,
                  ),
                ),
                kSpacingHeight2,
                Text(
                  'ID: ${data.pDoneId}',
                  style: context.textTheme.headlineSmall?.copyWith(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textDisable,
                  ),
                ),
              ],
            ),
            kSpacer,
            ImageWidget(
              isSelected ? IconAppConstants.icRadioButtonCheck : IconAppConstants.icRadioButton,
            ),
          ],
        ),
      ),
    );
  }
}
