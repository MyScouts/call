import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/dashboard/dashboard_coordinator.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:localization/localization.dart';
import 'package:ui/ui.dart';

class CongratulationRegisterDialog extends StatelessWidget {
  const CongratulationRegisterDialog(
      {super.key, this.imgPath, this.content, this.button});

  final String? imgPath;
  final Widget? content;
  final Widget? button;

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
                    S.current.congratulations_on_your_successful_registration,
                    textAlign: TextAlign.center,
                    style: context.text.titleMedium!.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    S.current.wish_you_have_great_experiences_on_our_products,
                    textAlign: TextAlign.center,
                    style: context.text.bodySmall!.copyWith(
                      color: context.theme.disabledColor,
                    ),
                  ),
                  const SizedBox(height: 25),
                  PrimaryButton(
                    title: S.current.lbl_continue,
                    onTap: () => context.startDashboardUtil(),
                    disabled: false,
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
