import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/presentation/app_coordinator.dart';
import 'package:app_main/src/presentation/upgrade_account/upgrade_account_coordinator.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:mobilehub_ui_core/mobilehub_ui_core.dart';
import '../../../../blocs/user/user_cubit.dart' hide UserState;
import '../../../../data/data_sources/ekyc/ekyc_viettel.dart';
import '../../../../domain/entities/commity_action_type.dart';
import '../../../../domain/entities/update_account/update_pdone_kyc_payload.dart';
import '../../../shared/user/bloc/user_bloc.dart';
import '../../upgrade_account_constants.dart';
import '../../upgrade_ja/widgets/gradiant_button.dart';
import '../bloc/upgrade_pdone/upgrade_pdone_bloc.dart';
import '../views/widgets/image_with_upload_button_widget.dart';
import '../views/widgets/upload_front_face_widget.dart';

class UpdateKycPage extends StatefulWidget {
  final VoidCallback onNextPage;

  const UpdateKycPage({
    super.key,
    required this.onNextPage,
  });

  @override
  State<UpdateKycPage> createState() => _UpdateKycPageState();
}

class _UpdateKycPageState extends State<UpdateKycPage> {
  KycType _type = KycType.over15;

  String? kycIdentityFront;
  String? kycIdentityBack;
  String? portraitIdentity;

  String? kycPassport;
  String? portraitPassport;

  UpgradePDoneBloc get upgradePDoneBloc => context.read<UpgradePDoneBloc>();

  bool get enableBtn =>
      _type == KycType.over15 || _type == KycType.under15idNumber
          ? (validImg(kycIdentityFront) &&
              validImg(kycIdentityBack) &&
              validImg(portraitIdentity))
          : (validImg(kycPassport) && validImg(portraitPassport));

  bool validImg(String? img) {
    return img != null;
    // return img != null && img.contains('https');
  }

  void _onListenerBloc(BuildContext context, UpgradePDoneState state) {

    if (state is UpdateKYCLoading || state is ExtractingEKycIdCard) {
      showLoading();
    } else if (state is UpdateKYCSuccess) {
      hideLoading();
      context.read<UserBloc>().add(
            UserUpgradeAccountEvent(PDoneActionType.registerPDone),
          );
      // context.startDialogUpgradeAccountSuccess('P-Done').then((value) {
      //   Navigator.pop(context);
      // });
    } else if (state is UpdateKYCFailure) {
      hideLoading();
      showToastMessage(state.errorMessage);
    } else if (state is UploadKYCImageSuccess) {
      final type = state.type;
      switch (type) {
        case ImageKYCType.kycPassport:
          kycPassport = state.image;
          break;
        case ImageKYCType.kycIdentityFront:
          kycIdentityFront = state.image;
          break;
        case ImageKYCType.kycIdentityBack:
          kycIdentityBack = state.image;
          break;
        case ImageKYCType.portraitIdentity:
          portraitIdentity = state.image;
          break;
        case ImageKYCType.portraitPassport:
          portraitPassport = state.image;
          break;
      }
      setState(() {});
    }
    if (state is ExtractedEKycIdCardSuccess) {
      hideLoading();
      // context.upgradePdoneSuccess();
      widget.onNextPage();
    }
  }

  void onTapChooseImage(ImageKYCType type) {
    context.takePhoto().then((path) {
      if (path != null) {
        upgradePDoneBloc.add(UploadKYCImageEvent(path, type));
      }
    });
    // context.checkAndRequestPermissionCamera().then((value) {
    //   if (value is bool && value) {
    //     context.takePhoto().then((path) {
    //       if (path != null) {
    //         upgradePDoneBloc.add(UploadKYCImageEvent(path, type));
    //       }
    //     });
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocListener<UpgradePDoneBloc, UpgradePDoneState>(
        listener: _onListenerBloc,
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            final isUnder14 =
                state.currentUser?.birthday?.isUnder15yearsAgo() ?? false;
            // final isUnder14 = true;
            return Column(
              children: [
                Column(
                  children: KycType.values.map((e) {
                    return RadioListTile<KycType>(
                      title: Text(
                        e.text(),
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      groupValue: _type,
                      onChanged: _onChangedType,
                      value: e,
                      dense: true,
                    );
                  }).toList(),
                ),
                _divider(),
                _buildDescription(_type.description(isUnder14)),
                _type == KycType.over15 || _type == KycType.under15idNumber
                    ? Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 18, 20, 30),
                            child: Row(
                              children: [
                                Expanded(
                                  child: BlocBuilder<UpgradePDoneBloc,
                                      UpgradePDoneState>(
                                    builder: (context, state) {
                                      const type =
                                          ImageKYCType.kycIdentityFront;
                                      if (state is UploadKYCImageUploading &&
                                          state.type == type) {
                                        kycIdentityFront = state.localImage;
                                      }

                                      return Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          ImageWithUploadButtonWidget(
                                            img: kycIdentityFront
                                                    ?.optimizeSize999 ??
                                                ImageConstants.frontCMND,
                                            onTap: () => onTapChooseImage(type),
                                            textBtn: 'Chụp mặt trước',
                                          ),
                                          if (state
                                                  is UploadKYCImageUploading &&
                                              state.type == type)
                                            _buildLoading()
                                        ],
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(width: 22),
                                Expanded(
                                  child: BlocBuilder<UpgradePDoneBloc,
                                      UpgradePDoneState>(
                                    builder: (context, state) {
                                      const type = ImageKYCType.kycIdentityBack;
                                      if (state is UploadKYCImageUploading &&
                                          state.type == type) {
                                        kycIdentityBack = state.localImage;
                                      }

                                      return Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          ImageWithUploadButtonWidget(
                                            img: kycIdentityBack
                                                    ?.optimizeSize999 ??
                                                ImageConstants.backCMND,
                                            onTap: () => onTapChooseImage(type),
                                            textBtn: 'Chụp mặt sau',
                                          ),
                                          if (state
                                                  is UploadKYCImageUploading &&
                                              state.type == type)
                                            _buildLoading()
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          BlocBuilder<UpgradePDoneBloc, UpgradePDoneState>(
                            builder: (context, state) {
                              const type = ImageKYCType.portraitIdentity;

                              if (state is UploadKYCImageUploading &&
                                  state.type == type) {
                                portraitIdentity = state.localImage;
                              }

                              return Stack(
                                alignment: Alignment.center,
                                children: [
                                  UploadFrontFaceWidget(
                                    imgFront: ImageConstants.frontCMND,
                                    uploadedImg:
                                        portraitIdentity?.optimizeSize999,
                                    onTap: () => onTapChooseImage(type),
                                    textBtn: 'Chụp ảnh chân dung cầm thẻ CCCD',
                                  ),
                                  if (state is UploadKYCImageUploading &&
                                      state.type == type)
                                    _buildLoading()
                                ],
                              );
                            },
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(64, 18, 64, 28),
                            child: BlocBuilder<UpgradePDoneBloc,
                                UpgradePDoneState>(builder: (context, state) {
                              const type = ImageKYCType.kycPassport;
                              if (state is UploadKYCImageUploading &&
                                  state.type == type) {
                                kycPassport = state.localImage;
                              }
                              return Stack(
                                alignment: Alignment.center,
                                children: [
                                  ImageWithUploadButtonWidget(
                                    img: kycPassport?.optimizeSize999 ??
                                        ImageConstants.passport,
                                    onTap: () => onTapChooseImage(type),
                                    btnHeight: 39,
                                    textBtn:
                                        'Ảnh chụp trang thông tin hộ chiếu',
                                    fontSizeBtn: 14,
                                    imgHeight: 194,
                                  ),
                                  if (state is UploadKYCImageUploading &&
                                      state.type == type)
                                    _buildLoading()
                                ],
                              );
                            }),
                          ),
                          BlocBuilder<UpgradePDoneBloc, UpgradePDoneState>(
                            builder: (context, state) {
                              const type = ImageKYCType.portraitPassport;

                              if (state is UploadKYCImageUploading &&
                                  state.type == type) {
                                portraitPassport = state.localImage;
                              }

                              return Stack(
                                alignment: Alignment.center,
                                children: [
                                  UploadFrontFaceWidget(
                                    imgFront: ImageConstants.passport,
                                    uploadedImg:
                                        portraitPassport?.optimizeSize999,
                                    onTap: () => onTapChooseImage(type),
                                    textBtn:
                                        'Chụp ảnh chân dung cầm thẻ hộ chiếu',
                                  ),
                                  if (state is UploadKYCImageUploading &&
                                      state.type == type)
                                    _buildLoading()
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(64, 0, 64, 30),
                  child: Text(
                    securityInformation,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: AppColors.grey11),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 60),
                  child: GradiantButton(
                    onPressed: enableBtn ? _onTapVerify : null,
                    height: 45,
                    child: Text(
                      'Xác thực',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge
                          ?.copyWith(color: AppColors.white),
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  void _onChangedType(KycType? value) {
    if (value != null) {
      setState(() {
        _type = value;
      });
    }
  }

  Widget _divider() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Divider(height: 0, color: AppColors.grey12, thickness: 5),
    );
  }

  Widget _buildLoading() {
    return const Align(
      alignment: Alignment.center,
      child: LoadingWidget(),
    );
  }

  Widget _buildDescription(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 40),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodySmall,
        textAlign: TextAlign.center,
      ),
    );
  }

  void _onTapVerify() {

    upgradePDoneBloc.add(
      ExtractingIdCardEvent(
        EKycIdCardRequest(
            backImg: kycIdentityBack!, fontImg: kycIdentityFront!),
      ),
    );

    // final payload = UpdatePDoneKYCPayload(
    //   kycPassport: _type == KycType.over15 || _type == KycType.under15idNumber
    //       ? null
    //       : kycPassport,
    //   kycIdentityFront:
    //       _type == KycType.over15 || _type == KycType.under15idNumber
    //           ? kycIdentityFront
    //           : null,
    //   kycIdentityBack:
    //       _type == KycType.over15 || _type == KycType.under15idNumber
    //           ? kycIdentityBack
    //           : null,
    //   portrait: _type == KycType.over15 || _type == KycType.under15idNumber
    //       ? portraitIdentity!
    //       : portraitPassport!,
    // );
    //
    // upgradePDoneBloc.add(UpdateKYCEvent(payload));
  }
}
