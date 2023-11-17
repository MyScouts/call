import 'package:app_core/app_core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:localization/localization.dart';

import '../../ui.dart';

class NotificationDialog extends StatelessWidget {
  final Function() onPressed;
  final String title;
  final String? summary;
  const NotificationDialog({
    super.key,
    required this.onPressed,
    required this.title,
    this.summary,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return AlertDialog(
      contentPadding: const EdgeInsets.only(top: 10, bottom: 10),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      content: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        width: width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              child: ImageWidget(
                ImageConstants.bgCongratulation,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: context.text.titleMedium!.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  if (summary != null) const SizedBox(height: 10),
                  if (summary != null)
                    Text(
                      summary!,
                      textAlign: TextAlign.center,
                      style: context.text.bodySmall!.copyWith(
                        color: context.theme.disabledColor,
                      ),
                    ),
                  const SizedBox(height: 25),
                  PrimaryButton(
                    title: S.current.lbl_continue,
                    onTap: () {
                      Navigator.pop(context);
                      onPressed();
                    },
                    disabled: false,
                    width: MediaQuery.of(context).size.width,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
