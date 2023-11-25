import 'dart:io';

import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/extensions/string_extension.dart';
import 'package:app_main/src/presentation/upgrade_account/upgrade_account_coordinator.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

import '../../../marshop/widgets/gradiant_button.dart';
import '../bloc/upgrade_pdone/upgrade_pdone_bloc.dart';

class UpdatePdoneIdentityCardConfirm extends StatefulWidget {
  final VoidCallback onNextPage;

  const UpdatePdoneIdentityCardConfirm({
    super.key,
    required this.onNextPage,
  });

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _UpdatePdoneIdentityCardConfirmState();
  }
}

class _UpdatePdoneIdentityCardConfirmState
    extends State<UpdatePdoneIdentityCardConfirm> {
  UpgradePDoneBloc get upgradePDoneBloc => context.read();

  late String frontImagePath;
  late String backImagePath;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dynamic faceLiveNessData =
        (upgradePDoneBloc.state as ExtractedEKycIdCardSuccess).imageEKyc;

    if (faceLiveNessData is String) {
      faceLiveNessData = faceLiveNessData.toMap();
    }

    frontImagePath = faceLiveNessData['front_cmnd'];
    backImagePath = faceLiveNessData['back_cmnd'];
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    _buildFontIdentityCard(),
                    _buildBackIdentityCard(),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...context.buildGuide(),
                  ],
                ),
              ],
            ),
          )),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 12, 0, 26),
            child: GradiantButton(
              onPressed: () {
                widget.onNextPage.call();
              },
              height: 45,
              child: Text(
                'Xác thực',
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

  Widget _buildFontIdentityCard() {
    return Column(
      children: [
        const LabelFieldWidget(
          text: 'Ảnh CCCD mặt trước',
          required: true,
          isBold: true,
        ),
        Container(
          color: Colors.red,
          child: Image.file(
            File(frontImagePath),
          ),
        )
      ],
    );
  }

  Widget _buildBackIdentityCard() {
    return Column(
      children: [
        const LabelFieldWidget(
          text: 'Ảnh CCCD mặt sau',
          required: true,
          isBold: true,
        ),
        Container(
          color: Colors.red,
          child: Image.file(
            File(backImagePath),
          ),
        )
      ],
    );
  }
}
