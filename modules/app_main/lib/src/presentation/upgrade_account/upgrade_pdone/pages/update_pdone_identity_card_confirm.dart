import 'dart:convert';
import 'dart:io';

import 'package:app_core/app_core.dart';
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
    final faceLiveNessData =
        (upgradePDoneBloc.state as ExtractedEKycIdCardSuccess).imageEKyc;

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
          Expanded(child: SingleChildScrollView(
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
                    ..._buildGuide(),

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

  List<Widget> _buildGuide() {
    return [
      Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Text(
          'Hướng dẫn',
          style: Theme.of(context).textTheme.headlineMedium!,
        ),
      ),
      Padding(
          padding: const EdgeInsets.only(top: 8),
          child: RichText(
            text: TextSpan(
              text: '1. Hình ảnh rõ ràng, ',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: AppColors.black12,
                    fontWeight: FontWeight.w500,
                  ),
              children: const [
                TextSpan(
                  text: 'không bị mờ & cắt góc',
                  style: TextStyle(
                    color: AppColors.black12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          )),
      Padding(
        padding: const EdgeInsets.only(top: 8),
        child: RichText(
          text: TextSpan(
            text: '2. Hình ảnh bắt buộc phải ',
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: AppColors.black12,
                fontWeight: FontWeight.w500,
                fontSize: 14),
            children: const [
              TextSpan(
                text: 'xoay ngang',
                style: TextStyle(
                    color: AppColors.black12,
                    fontWeight: FontWeight.w600,
                    fontSize: 14),
              ),
            ],
          ),
        ),
      ),
      Padding(
          padding: const EdgeInsets.only(top: 8),
          child: RichText(
            text: TextSpan(
              text: '3. Giấy tờ gốc, ',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: AppColors.black12,
                    fontWeight: FontWeight.w500,
                  ),
              children: const [
                TextSpan(
                  text: 'còn hạn sử dụng',
                  style: TextStyle(
                    color: AppColors.black12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          )),
      Padding(
        padding: const EdgeInsets.only(left: 6, top: 8),
        child: Text(
          'Toàn bộ thông tin cá nhân của Quý khách đều được P-Done đảm bảo an toàn bảo mật.',
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: AppColors.blue33,
                fontWeight: FontWeight.w400,
              ),
        ),
      ),
    ];
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
