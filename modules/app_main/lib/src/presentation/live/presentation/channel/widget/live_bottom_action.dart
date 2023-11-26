import 'package:app_main/src/core/extensions/list_extension.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

import 'live_button_action.dart';
import 'live_comment_widget.dart';
import 'live_gift_button.dart';
import 'live_heart_button.dart';
import 'live_rose_button.dart';

class LiveBottomAction extends StatelessWidget {
  const LiveBottomAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              child: const Row(
                children: [
                  Expanded(child: LiveCommentWidget()),
                  SizedBox(
                    width: 60,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        LiveHeartButton(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: <Widget>[
                      LiveButtonAction(
                        icon: ImageWidget(IconAppConstants.icLiveMarshop),
                        onPressed: () {},
                      ),
                      LiveButtonAction(
                        icon: ImageWidget(IconAppConstants.icLiveComment),
                        onPressed: () {},
                      ),
                      LiveButtonAction(
                        icon: ImageWidget(IconAppConstants.icLiveShare),
                        onPressed: () {},
                      ),
                      LiveButtonAction(
                        icon: ImageWidget(IconAppConstants.icLiveSetting),
                        onPressed: () {},
                      ),
                      LiveButtonAction(
                        bgColor: const Color(0xff4B84F7),
                        icon: ImageWidget(IconAppConstants.icLiveQr),
                        onPressed: () {},
                      ),
                      const Spacer(),
                      const LiveRoseButton(),
                    ].separated(const SizedBox(width: 10)),
                  ),
                ),
                const LiveGiftButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
