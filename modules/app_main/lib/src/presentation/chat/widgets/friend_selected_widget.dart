//import 'dart:developer' as developer;
import 'package:app_main/src/domain/entities/chat/member_model.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class FriendSelectedWidget extends StatelessWidget {
  final MemberModel data;
  final VoidCallback onTap;
  const FriendSelectedWidget({super.key, required this.data, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 82,
      width: 68,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              AvatarWidget(
                avatar: data.avatar,
                size: 60,
              ),
              Positioned(
                right: 0,
                top: 0,
                child: InkWell(
                  onTap: onTap,
                  borderRadius: BorderRadius.circular(100),
                  child: Container(
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: const Center(child: Icon(Icons.close, size: 20,)),
                  ),
                ),
              ),
            ],
          ),
          kSpacingHeight6,
          Text(
            data.getName,
            maxLines: 1,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.greyLightTextColor,
                  overflow: TextOverflow.ellipsis,
                ),
          )
        ],
      ),
    );
  }
}
