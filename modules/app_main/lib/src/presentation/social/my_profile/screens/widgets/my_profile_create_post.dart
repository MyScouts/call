import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/social/my_profile/screens/widgets/profile_avatar.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imagewidget/imagewidget.dart';

class MyProfileCreatePost extends StatelessWidget {
  final String? avatar;
  final Function onTapCreatePost;
  final Function onTapImage;
  final Function onTapVideo;

  final User? user;
  const MyProfileCreatePost(
      {required this.user,
      required this.onTapCreatePost,
      required this.onTapImage,
      required this.onTapVideo,
      this.avatar,
      super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTapCreatePost(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ProfileAvatar(
                avatarUrl: user == null
                    ? ImageConstants.defaultUserAvatar
                    : user.getUserAvatar,
                size: 42,
                isPDone: user.getIsPDone,
                fontSize: 12,
                profileTypePadding: 2,
                avatarPadding: 3,
                backgroundColor: AppColors.blueEdit,
              ),
              const SizedBox(width: 12),
              const Text(
                'Bạn đang nghĩ gì?',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey76,
                ),
              ),
            ],
          ),
          Wrap(
            spacing: 16.w,
            children: [
              _buildIcon(
                iconName: IconAppConstants.icVideoRd,
                onTap: () => onTapVideo(),
              ),
              _buildIcon(
                iconName: IconAppConstants.icCamera,
                onTap: () => onTapImage(),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildIcon({
    required String iconName,
    Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: ImageWidget(
        iconName,
        width: 28,
        height: 28,
      ),
    );
  }
}
