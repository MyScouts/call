//import 'dart:developer' as developer;
import 'package:app_core/app_core.dart';
import 'package:app_main/src/domain/entities/chat/member_response_model.dart';
import 'package:app_main/src/presentation/chat/widgets/avatar_member_widget.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class MemberWidget extends StatelessWidget {
  final MemberResponseModel data;
  final VoidCallback? onTap;
  final VoidCallback? onTapWidget;
  final bool showAction;
  const MemberWidget({
    super.key,
    required this.data,
    this.onTap,
    this.showAction = true,
    this.onTapWidget,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapWidget,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AvatarMemberWidget(
            avatar: data.member.avatar ?? '',
            size: 40,
          ),
          kSpacingWidth8,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.member.displayName ?? '',
                style: context.textTheme.headlineSmall?.copyWith(
                  color: AppColors.black,
                ),
              ),
              kSpacingHeight2,
              Text(
                'ID: ${data.member.pDoneId}',
                style: context.textTheme.headlineSmall?.copyWith(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textDisable,
                ),
              ),
            ],
          ),
          kSpacer,
          if (showAction) IconButton(onPressed: onTap, icon: const Icon(Icons.more_vert)),
        ],
      ),
    );
  }
}
