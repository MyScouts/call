import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

import '../../upgrade_ja/widgets/gradiant_button.dart';

class RegisterStatePage extends StatelessWidget {
  const RegisterStatePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: ImageWidget(ImageConstants.rafiki),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 36),
          child: Text(
            'Hồ sơ của bạn đang được xét duyệt.',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
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
    );
  }
}

class UpgradePdoneSuccessDialog extends StatelessWidget {
  const UpgradePdoneSuccessDialog({
    required this.onClickBtn,
    super.key,
  });

  final Function() onClickBtn;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ImageWidget(ImageConstants.pdoneSuccess),
        Padding(
          padding: const EdgeInsets.only(bottom: 42, right: 38, left: 38),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 36),
                child: Text(
                  'Chúc mừng bạn đã xác thực\nthành công!',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16, top: 8),
                child: Text(
                  'Chúc bạn có những trải nghiệm tuyệt\nvời trên sản phẩm của chúng tôi!',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GradiantButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    onClickBtn.call();
                  },
                  child: Text(
                    'Tiếp tục',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge
                        ?.copyWith(color: AppColors.white),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class UpgradePdoneSuccessWidthProtectorDialog extends StatelessWidget {
  const UpgradePdoneSuccessWidthProtectorDialog({
    required this.onClickBtn,
    super.key,
  });

  final Function() onClickBtn;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ImageWidget(ImageConstants.pdoneSuccessWithProtector),
        Padding(
          padding: const EdgeInsets.only(bottom: 42, right: 38, left: 38),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 36),
                child: Text(
                  'Chờ xét duyệt',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16, top: 8),
                child: Text(
                  'Hồ sơ đang chờ duyệt\nbạn sẽ nhận được thông báo khi quá trình xét duyệt\nhoàn thành',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GradiantButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    onClickBtn.call();
                  },
                  child: Text(
                    'Tiếp tục',
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
      ],
    );
  }
}
