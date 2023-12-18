import 'package:app_main/src/app_dimens.dart';
import 'package:app_main/src/presentation/social/my_profile/my_profile_constants.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

class EmptyPost extends StatelessWidget {
  const EmptyPost({super.key, required this.postType});
  final PostType postType;

  @override
  Widget build(BuildContext context) {
    String text = '';
    if (postType.isText) {
      text = 'Chưa có bài viết nào';
    }

    if (postType.isVideo) {
      text = 'Chưa có video nào';
    }

    if (postType.isFilm) {
      text = 'Chưa có thước phim nào';
    }

    return Padding(
      padding: EdgeInsets.only(bottom: bottomInset),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          ImageWidget(
            IconAppConstants.icDoubleImage,
            width: 80,
            height: 80,
          ),
          Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.grey76,
            ),
          ),
        ],
      ),
    );
  }
}
