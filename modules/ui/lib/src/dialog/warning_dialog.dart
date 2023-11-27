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
  final bool hasBackButton;

  const WarningDialog({
    super.key,
    this.marginContent,
    this.paddingContent,
    this.hasBackButton = false,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return DialogContainerWidget(
      marginContent: const EdgeInsets.symmetric(horizontal: 30),
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
              padding: const EdgeInsets.only(
                  top: 20, bottom: 12, left: 32, right: 32),
              child: Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
            if (content != '')
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  content,
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: const Color(0xff6E6E6E),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        height: 20 / 14,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
            if (hasBackButton)
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: OutlinedButton(
                  onPressed: Navigator.of(context).pop,
                  child: Text(
                    'Quay lại',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: const Color(0xff647396),
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ),
              ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
