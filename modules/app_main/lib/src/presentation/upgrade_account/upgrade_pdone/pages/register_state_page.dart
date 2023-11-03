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


class RegisterEKycStatePage extends StatelessWidget {

  const RegisterEKycStatePage({
    required this.onClickBtn,
    super.key,
  });
  final Function() onClickBtn;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 42, right: 38, left: 38),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ImageWidget(ImageConstants.pdoneSuccess),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 36),
            child: Text(
              'Chúc mừng bạn đã nâng cấp\nP-Done thành công',
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GradiantButton(
              onPressed: (){
                Navigator.of(context).pop();
                onClickBtn.call();
              },
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
    );
  }
}