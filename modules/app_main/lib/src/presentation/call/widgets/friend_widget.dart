//import 'dart:developer' as developer;
import 'package:app_core/app_core.dart';
import 'package:app_main/src/domain/entities/friend/friend_model.dart';
import 'package:app_main/src/presentation/call/phone_book_detail/phone_book_detail_coordinator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:ui/ui.dart';

import 'avatar_caller_widget.dart';

class FriendWidget extends StatelessWidget {
  final FriendModel data;
  const FriendWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.startPhoneBookDetail(data);
      },
      child: Row(
        children: [
          AvatarCallerWidget(
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
                    data.displayName ?? '',
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
