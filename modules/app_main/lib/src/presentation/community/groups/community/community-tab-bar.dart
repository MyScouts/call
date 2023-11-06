import 'package:design_system/design_system.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

class CommunityTabBar extends StatefulWidget {
  final TabController controller;

  const CommunityTabBar({super.key, required this.controller});

  @override
  State<CommunityTabBar> createState() => _CommunityTabBarState();
}

class _CommunityTabBarState extends State<CommunityTabBar> {
  Widget _tab(int index, {required String image, required String title}) {
    return Expanded(
      child: CupertinoButton(
        onPressed: () {
          widget.controller.animateTo(index);
          setState(() {});
        },
        padding: EdgeInsets.zero,
        child: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              border: Border.all(color: const Color(0xffE8E8E8)),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
              color: (widget.controller.index == index) ? const Color(0xff4b84f7) : AppColors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 5),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
                child: ImageWidget(image),
              ),
              Text(title,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: (widget.controller.index == index) ? Colors.white : const Color(0xffacacac),
                      )),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          _tab(0, image: IconAppConstants.communityGroup, title: 'Nhóm \ncộng đồng'),
          const SizedBox(width: 3),
          _tab(1, image: IconAppConstants.communitySurvey, title: 'Khảo sát cộng đồng'),
          const SizedBox(width: 3),
          _tab(2, image: IconAppConstants.communityCharity, title: 'Từ thiện cộng đồng'),
          const SizedBox(width: 3),
          _tab(3, image: IconAppConstants.communityTraining, title: 'Đào tạo \ncộng đồng'),
        ],
      ),
    );
  }
}
