import 'package:app_main/src/presentation/shared/user/views/user_avatar_widget.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

class CreatePost extends StatelessWidget {
  final String? avatar;
  const CreatePost({this.avatar, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => print('on tap create post'),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            children: [
              UserAvatarWidget(size: 42),
              SizedBox(width: 12),
              Text(
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
            spacing: 8,
            children: [
              _buildIcon(
                  iconName: IconAppConstants.icVideoRd,
                  onTap: () => print('on tap video')),
              _buildIcon(
                  iconName: IconAppConstants.icCamera,
                  onTap: () => print('on tap camera')),
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
