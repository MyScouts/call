// ignore_for_file: lines_longer_than_80_chars

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

import 'widgets/dialog_container_widget.dart';

class WarningDialog extends StatelessWidget {
  final EdgeInsets? marginContent;
  final EdgeInsets? paddingContent;
  final String title;
  final String content;

  const WarningDialog({
    super.key,
    this.marginContent,
    this.paddingContent,
    required this.title,
    required this.content,
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
                child: const Icon(Icons.close, color: AppColors.grey8),
              ),
            ),
            ImageWidget(ImageConstants.warning),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 12, left: 32, right: 32),
              child: Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ),
            if (content != '')
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  content,
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(color: const Color(0xff979797)),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
