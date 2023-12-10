import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/community/widgets/circle_image.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

class InvitePkDialog extends StatelessWidget {
  const InvitePkDialog({
    super.key,
    required this.user,
    required this.onPress,
  });

  final User user;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(32),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Lời mời PK',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    height: 2.0,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: CloseButton(),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text.rich(
              TextSpan(
                text: 'Bạn nhận được 1 lời mới PK từ bạn bè của bạn là ',
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xff6E6E6E),
                  height: 1.4,
                ),
                children: [
                  WidgetSpan(
                    child: CircleNetworkImage(
                      url: user.avatar ?? '',
                      size: 20,
                      defaultImage: ImageWidget(
                        ImageConstants.defaultUserAvatar,
                      ),
                    ),
                  ),
                  TextSpan(
                    text:
                        ' ${user.nickname ?? user.fullName ?? user.displayName ?? ''}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      height: 1.4,
                    ),
                  )
                ],
              ),
            ),
          ),
          Row(
            children: [
              const SizedBox(width: 16),
              Expanded(
                child: TextButton(
                  onPressed: Navigator.of(context).pop,
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xffF4F4F4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Từ chối',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xffDE372D),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    onPress.call();
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xff0E86FC),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Đồng ý',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
