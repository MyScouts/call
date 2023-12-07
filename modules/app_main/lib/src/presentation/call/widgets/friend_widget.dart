//import 'dart:developer' as developer;
import 'package:app_core/app_core.dart';
import 'package:app_main/src/domain/entities/chat/member_model.dart';
import 'package:app_main/src/presentation/call/phone_book_detail/phone_book_detail_coordinator.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

import 'avatar_caller_widget.dart';

class FriendWidget extends StatelessWidget {
  final MemberModel data;
  final VoidCallback? onTap;
  const FriendWidget({super.key, required this.data, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {
        context.startPhoneBookDetail(data);
      },
      child: Row(
        children: [
          AvatarWidget(
            avatar: data.avatar,
            size: 40,
          ),
          kSpacingWidth8,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    data.fullName ?? '',
                    style: context.textTheme.titleMedium!.copyWith(
                      fontSize: 16,
                      color: AppColors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              kSpacingHeight2,
              Text(
                'ID: ${data.pDoneId}',
                style: context.textTheme.titleMedium!.copyWith(
                  fontSize: 12,
                  color: AppColors.grey14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
