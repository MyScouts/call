// ignore_for_file: lines_longer_than_80_chars

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

import '../../ui.dart';
import 'widgets/dialog_container_widget.dart';

class ApproveDialog extends StatelessWidget {
  final EdgeInsets? marginContent;
  final EdgeInsets? paddingContent;
  final String? title;
  final String content;
  final DialogApproveStatus type;

  const ApproveDialog({
    super.key,
    required this.type,
    this.marginContent,
    this.paddingContent,
    this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return DialogContainerWidget(
      marginContent: const EdgeInsets.symmetric(horizontal: 40),
      borderRadius: BorderRadius.circular(20),
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
          type.icon,
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              bottom: 12,
              left: 5,
              right: 5,
            ),
            child: Text(
              type.title,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontWeight: FontWeight.w700,
                    height: 1.5,
                    fontSize: 18,
                    color: AppColors.textBlackColor,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
          if (content != '')
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Text(
                content,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: const Color(0xFF6E6E6E),
                    fontWeight: FontWeight.w400,
                    height: 1.4,
                    fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: PrimaryButton(
              title: type.buttonTitle,
              height: 55,
              onTap: Navigator.of(context).pop,
              disabled: false,
              width: MediaQuery.of(context).size.width,
            ),
          )
        ],
      ),
    );
  }
}

enum DialogApproveStatus {
  waiting,
  approved,
}

extension DialogApproveStatusExt on DialogApproveStatus {
  Widget get icon {
    switch (this) {
      case DialogApproveStatus.waiting:
        return ImageWidget(
          IconAppConstants.icWaiting,
          height: 70,
          width: 70,
        );
      case DialogApproveStatus.approved:
        return ImageWidget(
          IconAppConstants.icApproved,
          height: 70,
          width: 70,
        );
    }
  }

  String get title {
    switch (this) {
      case DialogApproveStatus.waiting:
        return 'Chờ phê duyệt yêu cầu';
      case DialogApproveStatus.approved:
        return 'Phê duyệt thành công';
    }
  }

  String get buttonTitle {
    switch (this) {
      case DialogApproveStatus.waiting:
        return 'Xác nhận';
      case DialogApproveStatus.approved:
        return 'Hoàn thành';
    }
  }
}
