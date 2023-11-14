import 'package:bot_toast/bot_toast.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:ui/ui.dart';

class ShareLinkDialog extends StatelessWidget {
  final Widget? qrCode;
  final String? link;

  const ShareLinkDialog({super.key, this.qrCode, this.link});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 30, left: 40, right: 40),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 15),
                  Text(
                    'Quét QR code',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.black,
                        ),
                  ),
                  const SizedBox(height: 18),
                  const Text('Chia sẻ mã QR này tới với bạn bè của bạn.'),
                  const SizedBox(height: 18),
                  qrCode ?? const SizedBox(),
                  if(link != null) _link(),
                  const SizedBox(height: 18),
                  PrimaryButton(
                    title: 'Xong',
                    height: 50,
                    onTap: Navigator.of(context).pop,
                    disabled: false,
                    width: MediaQuery.of(context).size.width,
                  ),
                ],
              ),
            ),
            Container(
              width: 60,
              height: 60,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xfff4f8ff),
                border: Border.all(width: 3, color: AppColors.white),
                shape: BoxShape.circle,
              ),
              child: ImageWidget(IconAppConstants.icQrCode),
            ),
          ],
        ),
      ],
    );
  }

  Widget _link() {
    return Padding(
      padding: const EdgeInsets.only(top: 18),
      child: Column(
        children: [
          const Text('Hoặc lấy đường dẫn dưới đây'),
          const SizedBox(height: 18),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 50,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(width: 1, color: const Color(0xffd0d6dd)),
                  ),
                  child: Text(link ?? '', overflow: TextOverflow.ellipsis),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Clipboard.setData(ClipboardData(text: link ?? '')).then((value) {
                    BotToast.showText(text: 'Đã sao chép');
                  });
                },
                child: Container(
                  width: 50,
                  height: 50,
                  margin: const EdgeInsets.only(left: 10),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1, color: const Color(0xffd0d6dd)),
                  ),
                  child: const Icon(Icons.copy),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

}
