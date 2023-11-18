import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/presentation/upgrade_account/place_information_constant.dart';
import 'package:app_main/src/presentation/upgrade_account/upgrade_account_coordinator.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:imagewidget/imagewidget.dart';

import '../../../../marshop/widgets/gradiant_button.dart';
import '../../../upgrade_account_constants.dart';
import '../../bloc/upgrade_pdone/upgrade_pdone_bloc.dart';
import 'birth_cer_camera.dart';

class RegisterPdoneBirthCerCapture extends StatefulWidget {
  final VoidCallback onNextPage;

  const RegisterPdoneBirthCerCapture({
    super.key,
    required this.onNextPage,
  });

  @override
  State<StatefulWidget> createState() {
    return _RegisterPdoneBirthCerCaptureState();
  }
}

class _RegisterPdoneBirthCerCaptureState
    extends State<RegisterPdoneBirthCerCapture> {
  late MethodChannel _channel;

  @override
  void initState() {
    super.initState();
    _channel = const MethodChannel('flutter.sdk.ekyc/integrate');
  }

  UpgradePDoneBloc get upgradePDoneBloc => context.read<UpgradePDoneBloc>();

  XFile? captureFile;

  void _onListenerBloc(BuildContext context, UpgradePDoneState state) {
    if (state is ExtractedEKycIdCardSuccess) {
      // context.upgradePdoneSuccess();
      widget.onNextPage();
    }

    if (state is ExtractedEKycIdCardFailure) {
      // context.upgradePdoneSuccess();
      context.showToastMessage(state.errorMessage, ToastMessageType.error);
    }

    if (state is UploadedSuccessImageBirthCer) {
      hideLoading();
      _startEKycByNameMethod(methodName: 'startEkycFace');
    }

    if (state is UploadingImageBirthCer) {
      showLoading();
    }

    if (state is UploadedFailureImageBirthCer) {
      hideLoading();
      context.showToastMessage(state.errorMessage, ToastMessageType.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocListener<UpgradePDoneBloc, UpgradePDoneState>(
      listener: _onListenerBloc,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTitle(context),
                  _buildMainContent(context),
                  _buildGuide(context),
                ],
              ),
            ),
          ),
          _buildNextBtn(context),
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        'Chọn 1 trong 2 phương thức\nchụp ảnh hoặc tải ảnh lên từ thư viện',
        style: Theme.of(context).textTheme.headlineSmall,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildMainContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 13, 16, 21),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Chụp / tải ảnh giấy khai sinh',
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontSize: 18),
          ),
          const SizedBox(
            height: 12,
          ),
          captureFile == null
              ? Stack(
                  children: [
                    ImageWidget(ImageConstants.birthCerCapture),
                    Positioned.fill(
                      top: 272,
                      left: 80,
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: GestureDetector(
                          child: Column(
                            children: [
                              ImageWidget(
                                IconAppConstants.icCameraRound,
                                width: 48,
                                height: 48,
                              ),
                              Text(
                                'Chụp ảnh',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        color: const Color(0xFF4B84F7),
                                        fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                          onTap: () async {
                            captureFile = await showModalBottomSheet<XFile?>(
                                context: context,
                                isScrollControlled: true,
                                builder: (context) {
                                  return StatefulBuilder(builder: (ctx, state) {
                                    return const FractionallySizedBox(
                                      heightFactor: 0.9,
                                      child: BirthCerCameraScreen(),
                                    );
                                  });
                                });
                            if (captureFile != null) {
                              setState(() {});
                            }
                          },
                        ),
                      ),
                    ),
                    Positioned.fill(
                      top: 272,
                      right: 80,
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: GestureDetector(
                          child: Column(
                            children: [
                              ImageWidget(
                                IconAppConstants.icUploadImage,
                                width: 48,
                                height: 48,
                              ),
                              Text(
                                'Tải lên',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        color: const Color(0xFF4B84F7),
                                        fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                          onTap: () async {
                            captureFile = await ImagePicker()
                                .pickImage(source: ImageSource.gallery);
                            if (captureFile != null) {
                              Future.delayed(const Duration(milliseconds: 200))
                                  .then((value) {
                                setState(() {});
                              });
                            }
                          },
                        ),
                      ),
                    )
                  ],
                )
              : Stack(
                  children: [
                    ImageWidget(ImageConstants.birthCerBackgroundConfirm),
                    Positioned.fill(
                      child: Align(
                        child: Image.file(
                          File(captureFile!.path),
                          height: 520,
                        ),
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }

  Future<void> _startEKycByNameMethod({required String methodName}) async {
    final json = await _channel.invokeMethod(methodName, ekycInfo);
    final urlBirthCer = (upgradePDoneBloc.state as UploadedSuccessImageBirthCer)
        .imageBirthCerUrl;
    upgradePDoneBloc.add(
      ExtractingIdCardEvent(
          jsonDecode(json), {UpgradePDoneMeta.imageBirthCer: urlBirthCer}),
    );
  }

  Widget _buildGuide(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: context.buildGuide(),
      ),
    );
  }

  Widget _buildNextBtn(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 26),
      child: GradiantButton(
        onPressed: () {
          if (captureFile == null) {
            showToastMessage(
                'Vui lòng chụp ảnh trước khi xác thực', ToastMessageType.error);
          } else {
            upgradePDoneBloc.add(UploadImageBirthCerEvent(xFile: captureFile!));
          }
          // widget.onNextPage.call();
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
