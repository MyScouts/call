import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/social/my_profile/screens/widgets/profile_avatar.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

class PostHeaderUserInfo extends StatelessWidget {
  const PostHeaderUserInfo({
    required this.user,
    required this.time,
    this.isShowSetting = true,
    this.isDarkMode = false,
    super.key,
  });
  final User? user;
  final bool isShowSetting;
  final String time;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: ProfileAvatar(
            avatarUrl: user.getUserAvatar,
            size: 42,
            isPDone: user.getIsPDone,
            fontSize: 12,
            profileTypePadding: 2,
            avatarPadding: 3,
            backgroundColor: AppColors.blueEdit,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInfoDetail(),
              const SizedBox(height: 2),
              _buildPostTime(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPostTime() {
    return Text(
      time,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.grey77,
      ),
    );
  }

  Widget _buildInfoDetail() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              user.getDisplayName,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: isDarkMode ? AppColors.white : AppColors.black10,
              ),
            ),
            if (user.getIsPDone) const SizedBox(width: 4),
            if (user.getIsPDone)
              ImageWidget(
                IconAppConstants.icShopVdone,
                width: 24,
                height: 24,
              ),
            const SizedBox(width: 8),
            Text(
              user.getPDoneId,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.grey77,
              ),
            ),
          ],
        ),
        if (isShowSetting)
          GestureDetector(
            onTap: () => print('setting'),
            child: const Icon(
              Icons.more_vert,
              size: 24,
            ),
          ),
      ],
    );
  }
}
