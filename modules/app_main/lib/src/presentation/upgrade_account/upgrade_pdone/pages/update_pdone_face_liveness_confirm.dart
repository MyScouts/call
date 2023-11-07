import 'dart:convert';
import 'dart:io';

import 'package:app_core/app_core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../marshop/widgets/gradiant_button.dart';
import '../bloc/upgrade_pdone/upgrade_pdone_bloc.dart';

class UpdatePdoneFaceLiveNessConfirm extends StatefulWidget {
  final VoidCallback onNextPage;

  const UpdatePdoneFaceLiveNessConfirm({
    super.key,
    required this.onNextPage,
  });

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _UpdatePdoneFaceLiveNessConfirmState();
  }
}

class _UpdatePdoneFaceLiveNessConfirmState
    extends State<UpdatePdoneFaceLiveNessConfirm> {
  UpgradePDoneBloc get upgradePDoneBloc => context.read();

  late String faceLiveNessPath;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final faceLiveNessData =
        (upgradePDoneBloc.state as ExtractedEKycIdCardSuccess).imageEKyc;
    print((upgradePDoneBloc.state as ExtractedEKycIdCardSuccess)
        .imageEKyc['face_live_ness']);
    faceLiveNessPath = faceLiveNessData['face_live_ness'];
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              ..._buildLabelGuide(context),
              _buildImageFaceLiveNess(),
            ],
          ),
          _buildNextStepBtn(),
        ],
      ),
    );
  }

  List<Widget> _buildLabelGuide(BuildContext ctx) {
    return [
      Text(
        'Ảnh chân dung',
        style: Theme.of(context).textTheme.headlineMedium!,
        textAlign: TextAlign.center,
      ),
      Text(
        'Chụp ảnh selfie rõ mặt để so sánh với CCCD',
        style: Theme.of(context).textTheme.bodySmall!,
        textAlign: TextAlign.center,
      )
    ];
  }

  Widget _buildImageFaceLiveNess() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 48, vertical: 40),
      height: 296,
      decoration:
          const BoxDecoration(color: Colors.red, shape: BoxShape.rectangle),
      child: Image.file(File(faceLiveNessPath)),
    );
  }

  Widget _buildNextStepBtn() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 56),
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
    );
  }
}
