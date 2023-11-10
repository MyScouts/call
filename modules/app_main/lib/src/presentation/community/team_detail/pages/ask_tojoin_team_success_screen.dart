import 'package:app_main/src/presentation/community/community_coordinator.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:ui/ui.dart';

class AskToJoinTeamSuccessScreen extends StatelessWidget {
  static const String routeName = '/ask-to-join-team-success';

  const AskToJoinTeamSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    ImageWidget(ImageConstants.bgCongratulation),
                    const SizedBox(height: 20),
                    Text(
                      'Gửi đăng ý thành công',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 18,
                            color: const Color(0xFF101B28),
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Bạn đã hoàn thành đơn đăng ký để tham gia Team Thể Thao. Chúng tôi sẽ gửi thông báo tới bạn khi có những cập nhật mới nhất.',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 16,
                              height: 1.4,
                              color: const Color(0xFF667385),
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            PrimaryButton(
              title: 'Xong',
              onTap: context.backToTeamDetailScreen,
              disabled: false,
              width: MediaQuery.of(context).size.width,
            ),
            SizedBox(height: MediaQuery.of(context).padding.bottom + 20)
          ],
        ),
      ),
    );
  }
}
