import 'package:app_main/src/presentation/marshop/widgets/gradiant_button.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:ui/ui.dart';

class UpgradeSuccessDialogWidget extends StatelessWidget {
  final String text;

  const UpgradeSuccessDialogWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return DialogContainerWidget(
      child: Material(
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.only(bottom: 10),
              child: GestureDetector(
                onTap: Navigator.of(context).pop,
                child: const Icon(
                  Icons.close,
                  color: AppColors.grey8,
                ),
              ),
            ),
            ImageWidget(ImageConstants.celebrate),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Chúc mừng bạn đã đăng ký $text thành công!',
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: GradiantButton(
                onPressed: Navigator.of(context).pop,
                child: Text(
                  'Trở lại trang V-News',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(color: AppColors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
