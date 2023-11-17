import 'dart:convert';
import 'dart:io';

import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/data/models/responses/pdone/pdone_information_response.dart';
import 'package:app_main/src/domain/entities/update_account/update_pdone_birth_place_payload.dart';
import 'package:app_main/src/domain/entities/update_account/update_place_information_payload.dart';
import 'package:app_main/src/domain/entities/update_account/update_profile_payload.dart';
import 'package:app_main/src/presentation/app_coordinator.dart';
import 'package:app_main/src/presentation/upgrade_account/place_information_constant.dart';
import 'package:app_main/src/presentation/upgrade_account/upgrade_account_coordinator.dart';
import 'package:app_main/src/presentation/upgrade_account/upgrade_pdone/bloc/pdone_information/pdone_information_bloc.dart';
import 'package:app_main/src/presentation/upgrade_account/upgrade_pdone/bloc/upgrade_pdone/upgrade_pdone_bloc.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui/ui.dart';

import '../../../../marshop/widgets/gradiant_button.dart';

class UpgradeEkycScreen extends StatefulWidget {
  static const String routeName = 'upgrade-ekyc';
  const UpgradeEkycScreen({
    super.key,
  });

  @override
  State<StatefulWidget> createState() {
    return _UpgradeEkycScreenState();
  }
}

class _UpgradeEkycScreenState extends State<UpgradeEkycScreen> {
  UpgradePDoneBloc get upgradePDoneBloc => context.read();
  PDoneInformationBloc get infomationBloc => context.read();
  PDoneInformationData? data;
  UpdateProfilePayload payload = const UpdateProfilePayload();
  late MethodChannel _channel;
  String? frontImagePath;
  String? backImagePath;

  @override
  void initState() {
    super.initState();
    infomationBloc.add(PDoneGetInformationEvent());
    _channel = const MethodChannel('flutter.sdk.ekyc/integrate');
    _initData();
  }

  _initData() async {
    final json = await _channel.invokeMethod('startEkycFull', ekycInfo);
    upgradePDoneBloc.add(ExtractingIdCardEvent(jsonDecode(json), const {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocListener(
        listeners: [
          BlocListener<PDoneInformationBloc, PDoneInformationState>(
            listener: (context, state) {
              if (state is PDoneLoadedSuccessInformation) {
                data = state.data;
              }
            },
          ),
          BlocListener<UpgradePDoneBloc, UpgradePDoneState>(
            listener: (context, state) {
              if (state is ExtractedEKycIdCardFailure) {
                showToastMessage(
                  "Xác thực không thành công vui lòng thử lại sau.",
                  ToastMessageType.error,
                );
                context.pop();
              }

              if (state is ExtractedEKycIdCardSuccess) {
                final eKycData = state.dataEKyc['object'];
                final postCode = eKycData['post_code'][0];
                payload = payload.copyWith(
                  identityNumber: eKycData['id'] ?? '',
                  nickname: eKycData['name'] ?? '',
                  birthPlace: UpdatePDoneBirthPlacePayload(
                    wardId: postCode['ward'][1],
                    provinceId: postCode['city'][1],
                    districtId: postCode['district'][1],
                    address: eKycData['recent_location'],
                  ),
                  currentPlace: UpdatePlaceInformationPayload(
                    countryCode: data?.currentPlace?.countryCode,
                    address: data?.currentPlace?.address,
                    countryName: data?.currentPlace?.countryName,
                    districtCode: data?.currentPlace?.districtCode,
                    districtName: data?.currentPlace?.districtName,
                    provinceCode: data?.currentPlace?.provinceCode,
                    provinceName: data?.currentPlace?.provinceName,
                    street: data?.currentPlace?.street,
                    wardCode: data?.currentPlace?.wardCode,
                    wardName: data?.currentPlace?.wardName,
                  ),
                  supplyAddress: eKycData['issue_place'],
                  supplyDate: eKycData['issue_date']
                      .toString()
                      .parseDateTime()
                      .toYYYYmmdd,
                  academicLevel: data?.academicLevel ?? "",
                  birthday: eKycData['birth_day']
                      .toString()
                      .parseDateTime()
                      .toYYYYmmdd,
                  bloodGroup: data?.bloodGroup ?? "",
                  height: data?.height ?? 0,
                  interest: data?.interest ?? "",
                  job: data?.job ?? "",
                  maritalStatus: data?.maritalStatus ?? '',
                  protectorPDoneId: data?.protectorPDoneId ?? "",
                  talent: data?.talent ?? "",
                );
                final nameArr = eKycData['name'].toString().split(" ");
                if (nameArr.length == 3) {
                  payload = payload.copyWith(
                    firstName: nameArr[0],
                    middleName: nameArr[1],
                    lastName: nameArr[2],
                  );
                }
                if (nameArr.length == 2) {
                  payload = payload.copyWith(
                    firstName: nameArr[0],
                    middleName: '',
                    lastName: nameArr[1],
                  );
                }
                if (GenderType.female.getText() == eKycData['gender']) {
                  payload = payload.copyWith(sex: GenderType.female.toValue());
                }
                if (GenderType.male.getText() == eKycData['gender']) {
                  payload = payload.copyWith(sex: GenderType.male.toValue());
                }
              }
            },
          ),
        ],
        child: BlocBuilder<UpgradePDoneBloc, UpgradePDoneState>(
          builder: (context, state) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (state is! ExtractedEKycIdCardSuccess)
                      const Center(
                        child: CircularProgressIndicator(),
                      ),
                    if (state is ExtractedEKycIdCardSuccess)
                      _buildContent(state),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 12, 0, 26),
                      child: GradiantButton(
                        onPressed: () => context
                            .startUpgradePDoneOTP(payload: payload)
                            .then((value) {
                          print(value);
                          context.pop(data: value);
                        }),
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
              ),
            );
          },
        ),
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
            File(frontImagePath!),
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
            File(backImagePath!),
          ),
        )
      ],
    );
  }

  _buildContent(ExtractedEKycIdCardSuccess state) {
    final faceLiveNessData =
        (upgradePDoneBloc.state as ExtractedEKycIdCardSuccess).imageEKyc;
    frontImagePath = faceLiveNessData['front_cmnd'];
    backImagePath = faceLiveNessData['back_cmnd'];
    return Expanded(
        child: SingleChildScrollView(
      child: Column(
        children: [
          Column(
            children: [
              if (frontImagePath != null) _buildFontIdentityCard(),
              if (backImagePath != null) _buildBackIdentityCard(),
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
    ));
  }
}
