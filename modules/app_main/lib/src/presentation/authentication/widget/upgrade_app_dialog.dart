import 'dart:io';

import 'package:app_core/app_core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:ui/ui.dart';

class UpgradeAppDialog extends StatelessWidget {
  const UpgradeAppDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return AlertDialog(
      contentPadding: const EdgeInsets.only(top: 10, bottom: 10),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      content: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            width: width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3,
                  child: ImageWidget(
                    ImageConstants.bgUpgradeApp,
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
                        "Yêu cầu cập nhật",
                        style: context.textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ), // Text(
                      const SizedBox(height: 10),
                      Text(
                        "Phiên bản hiện tại không hỗ trợ một số tính năng trong dịch vụ bạn đang dùng Vui lòng cập nhật phiên bản mới nhất ",
                        textAlign: TextAlign.center,
                        style: context.textTheme.titleMedium!.copyWith(
                          color: AppColors.grey14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 25),
                      PrimarySolidButton(
                        title: "Cập nhật",
                        onTap: () {
                          Navigator.pop(context);
                          // onPressed();
                        },
                        disabled: false,
                        width: MediaQuery.of(context).size.width,
                      ),
                      const SizedBox(height: 15),
                      Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "Để sau",
                          style: context.textTheme.titleSmall!.copyWith(
                            color: context.theme.primaryColor,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 20,
            top: 0,
            child: CustomCloseButton(
              onPressed: () => exit(0),
            ),
          ),
        ],
      ),
    );
  }
}
