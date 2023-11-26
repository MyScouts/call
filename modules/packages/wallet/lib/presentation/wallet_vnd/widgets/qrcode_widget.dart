import 'dart:io';

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:ui/ui.dart';
import '../../../../wallet.dart';
import '../../../core/theme/wallet_theme.dart';
import '../../shared/widgets/icon_button_widget.dart';
import '../../wallet_constant.dart';

class QrCodeWidget extends StatefulWidget {
  final bool isChecked;
  final String? qrImage;
  final ValueChanged<File?>? qrCodeFile;

  const QrCodeWidget({
    Key? key,
    this.isChecked = false,
    this.qrCodeFile,
    this.qrImage,
  }) : super(key: key);

  @override
  State<QrCodeWidget> createState() => _QrCodeWidgetState();
}

class _QrCodeWidgetState extends State<QrCodeWidget> {
  final _qrCodeFile = ValueNotifier<File?>(null);
  File imageFile = File('');

  void onTapChooseQrCode() {
    context.showChooseQrCode().then((path) {
      if (path is String) {
        _qrCodeFile.value = File(path);
        if (widget.qrCodeFile != null) {
          imageFile = _qrCodeFile.value!;
          widget.qrCodeFile!(_qrCodeFile.value);
          setState(() {});
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5),
        Text(
          'Mã QR ',
          style: context.text.titleMedium?.copyWith(
            color: WalletTheme.greyTextColor,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Opacity(
              opacity: 0,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: IconButton(
                  onPressed: null,
                  icon: ImageWidget(IconAppConstants.icEdit2),
                ),
              ),
            ),
            widget.qrImage != null && widget.qrImage != 'null'
                ? ClipRRect(
                    borderRadius: WalletConstant.borderRadius10,
                    child: ImageWidget(
                      widget.qrImage!,
                      width: 150,
                      height: 150,
                    ),
                  )
                : imageFile.path.isNotEmpty
                    ? ClipRRect(
                        borderRadius: WalletConstant.borderRadius10,
                        child: SizedBox(
                          width: 150,
                          height: 150,
                          child: Image.file(imageFile, fit: BoxFit.cover),
                        ),
                      )
                    : IconButtonWidget(
                        icon: ImageConstants.imageCamera,
                        onTap: widget.isChecked ? null : onTapChooseQrCode,
                      ),
            Opacity(
              opacity: imageFile.path.isNotEmpty && !widget.isChecked ? 1 : 0,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: IconButton(
                  onPressed: widget.isChecked ? null : onTapChooseQrCode,
                  icon: ImageWidget(IconAppConstants.icEdit2),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        if (!widget.isChecked)
          Text(
            WalletConstant.qrCodeMessage,
            textAlign: TextAlign.center,
            style: context.text.titleMedium?.copyWith(
              color: WalletTheme.greyLightTextColor,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
      ],
    );
  }
}
