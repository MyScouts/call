import 'package:app_core/app_core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:ui/ui.dart';

class CommunityNotificationScreen extends StatefulWidget {
  static const String routeName = 'community-notification';
  const CommunityNotificationScreen({super.key});

  @override
  State<CommunityNotificationScreen> createState() =>
      _CommunityNotificationScreenState();
}

class _CommunityNotificationScreenState
    extends State<CommunityNotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        bottomOpacity: 0.0,
        shadowColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const CustomBackButton(),
        ),
        shape: Border.all(width: 0, color: Colors.transparent),
        title: const Text("Thông báo"),
        actions: [
          TextButton(
            style: ButtonStyle(
              shadowColor: MaterialStateProperty.all(Colors.transparent),
              overlayColor: MaterialStateProperty.all(Colors.transparent),
            ),
            onPressed: () {},
            child: Text(
              "Xoá",
              style: context.textTheme.titleMedium!.copyWith(
                color: Colors.grey,
              ),
            ),
          )
        ],
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 50),
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Center(
            child: ImageWidget(
              ImageConstants.bgNotiEmpty,
              width: 200,
            ),
          ),
          Text(
            "Bạn không có thông báo",
            style: context.textTheme.titleSmall!
                .copyWith(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(
            "Thông báo mới sẽ xuất hiện ở đây",
            style: context.textTheme.titleSmall!.copyWith(color: Colors.grey),
          )
        ]),
      ),
    );
  }
}
