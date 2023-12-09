import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/extensions/string_extension.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:localization/localization.dart';
import 'package:ui/ui.dart';

import '../../../../data/models/payloads/upgrade_account/upgrade_pdone/pdone_verify_protector.dart';
import '../../../../domain/entities/update_account/update_pdone_birth_place_payload.dart';
import '../../../../domain/entities/update_account/update_profile_payload.dart';
import '../../../shared/extensions/validation_extension.dart';
import '../../upgrade_account_constants.dart';
import '../../upgrade_account_coordinator.dart';
import '../../upgrade_ja/widgets/gradiant_button.dart';
import '../bloc/place_information/place_information_bloc.dart';
import '../bloc/upgrade_pdone/upgrade_pdone_bloc.dart';
import '../mixin/update_pdone_information_mixin.dart';
import '../views/widgets/place_information_widget.dart';
import '../views/widgets/verify_protector_widget.dart';
import 'update_pdone_otp.dart';

const msgValidateProtectorOk = 'Thông tin người bảo hộ trùng khớp';

class UpdatePDoneInformationPage extends StatefulWidget {
  static const String routeName = '/update-pdone-information';

  const UpdatePDoneInformationPage({
    super.key,
    this.onNextPage,
  });

  final VoidCallback? onNextPage;

  @override
  State<UpdatePDoneInformationPage> createState() =>
      _UpdatePDoneInformationPageState();
}

class _UpdatePDoneInformationPageState extends State<UpdatePDoneInformationPage>
    with ValidationMixin, UpdatePDoneInformationMixin {
  UpgradePDoneBloc get upgradePDoneBloc => context.read();

  // validator protector PDoneId
  String? validatorPDoneId = 'Bạn phải nhập ID P-Done';

  // validator protector Email or Phone
  String? validatorEmailOrPhone = 'Thông tin không hợp lệ';

  // validator protector Identify number
  String? validatorIdentifyNumber = 'Thông tin không hợp lệ';

  bool isValidatingProtector = false;

  // prevent change after validate protector
  bool needValidatingProtector = false;

  PDoneOptionMethod pDoneOptionMethod = PDoneOptionMethod.userIdentityCard;

  PDoneAPICaller pDoneAPICaller = PDoneAPICaller.adult;

  bool isShowProtector() {
    return pDoneAPICaller == PDoneAPICaller.teenager ||
        pDoneOptionMethod == PDoneOptionMethod.userBirthCer;
  }

  bool protectorApprove = false;

  DateTime maxBirthDay = DateTime.now();

  void _onListenerBloc(BuildContext context, UpgradePDoneState state) {
    if (state is UpdatePDoneProfileLoading) {
      showLoading();
    }
    if (state is UpdatePdoneAdultProfileSuccess ||
        state is UpdatePdoneTeenagerProfileSuccess) {
      hideLoading();
      context.upgradePdoneSuccess();
    }

    if (state is UpdatePdoneChildrenProfileSuccess) {
      hideLoading();
      context.upgradePdoneChildrenSuccess();
    }

    if (state is UpdatePDoneProfileFailure) {
      hideLoading();

      showToastMessage(state.errorMessage, ToastMessageType.warning);
    }

    if (state is RejectProtectorState) {
      hideLoading();
      Future.delayed(const Duration(milliseconds: 200)).then((value) {
        setState(() {});
      });
      showToastMessage(
          'Người bảo hộ đã từ chối yêu cầu của bạn!', ToastMessageType.error);
    }
    if (state is GetMyProfileSuccess) {}

    if (state is UpdatePDoneSendOTPSuccessState) {
      hideLoading();
      showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) {
            return StatefulBuilder(builder: (ctx, _) {
              return FractionallySizedBox(
                heightFactor: 1,
                child: UpdatePDoneOtp(
                  blocUpdate: upgradePDoneBloc,
                  payload: payload,
                  pDoneAPICaller: pDoneAPICaller,
                  phoneNumber: state.currentPhoneNumber,
                ),
              );
            });
          });
    }

    if (state is UpdatePDoneSendOTPFailureState) {
      hideLoading();
      showToastMessage(state.errorMessage, ToastMessageType.error);
    }
  }

  void _onTapNext() {
    payload = payload.copyWith(
      firstName: firstNameCtrl.text,
      lastName: lastNameCtrl.text,
      middleName: middleNameCtrl.text,
      nickname: nickNameCtrl.text,
      sex: gender,
      birthday: birthDay?.toYYYYmmdd ?? '',
      identityNumber: identifyNumberCtrl.text,
      supplyDate: supplyDate?.toYYYYmmdd ?? '',
      supplyAddress: supplyAddressCtrl.text,
      height: int.tryParse(heightCtrl.text) ?? 0,
      weight: int.tryParse(weightCtrl.text) ?? 0,
      maritalStatus: maritalStatusCtrl.text,
      bloodGroup: bloodGroupCtrl.text,
      academicLevel: academyCtrl.text,
      job: jobCtrl.text,
      interest: interestCtrl.text,
      talent: talentCtrl.text,
    );
    if (pDoneOptionMethod == PDoneOptionMethod.userIdentityCard) {
      payload = payload.copyWith(
        birthPlace: UpdatePDoneBirthPlacePayload(
            countryName: 'VN',
            countryCode: '',
            provinceName: bpProvinceCtrl.text,
            districtName: bpDistrictCtrl.text,
            wardName: bpWardCtrl.text),
      );
    }
    _sendOTP();
  }

  void _sendOTP() {
    upgradePDoneBloc.add(UpdatePDoneSendOTPEvent(identifyNumberCtrl.text));
  }

  void onUpdatePayload(UpdateProfilePayload val) {
    EasyDebounce.debounce(
        'onUpdateInfomationPayload', const Duration(milliseconds: 200), () {
      onValidation();
      payload = val;
    });
  }

  @override
  void initState() {
    super.initState();
    _initTextFormField();
    _initBirthCer();
  }

  void _initBirthCer() {
    if (((upgradePDoneBloc.state as ExtractedEKycIdCardSuccess).metaData
            as Map<dynamic, dynamic>)
        .isNotEmpty) {
      payload = payload.copyWith(
          birthCertificateUrl:
              (upgradePDoneBloc.state as ExtractedEKycIdCardSuccess)
                  .metaData[UpgradePDoneMeta.imageBirthCer]);
      pDoneAPICaller = PDoneAPICaller.children;
      // final now = DateTime.now();
      // maxBirthDay = DateTime(now.year - 14, now.month, now.day);
    }
  }

  void _initTextFormField() {
    dynamic dataEKyc =
        (upgradePDoneBloc.state as ExtractedEKycIdCardSuccess).dataEKyc;
    if (dataEKyc is String && dataEKyc.isNotEmpty) {
      dataEKyc = dataEKyc.toMap();
    }
    if (dataEKyc.isNotEmpty) {
      final eKycData = dataEKyc['object'];
      identifyNumberCtrl.text = eKycData['id'] ?? '';
      final nameArr = eKycData['name'].toString().split(" ");

      if (nameArr.length == 3) {
        firstNameCtrl.text = nameArr[0];
        middleNameCtrl.text = nameArr[1];
        lastNameCtrl.text = nameArr[2];
      }
      if (nameArr.length == 2) {
        firstNameCtrl.text = nameArr[0];
        middleNameCtrl.text = '';
        lastNameCtrl.text = nameArr[1];
      }
      final postCode = eKycData['post_code'][0];
      nickNameCtrl.text = eKycData['name'] ?? '';
      if (GenderType.female.getText() == eKycData['gender']) {
        gender = GenderType.female.toValue()!;
      }
      if (GenderType.male.getText() == eKycData['gender']) {
        gender = GenderType.male.toValue()!;
      }

      supplyAddressCtrl.text = eKycData['issue_place'];
      birthPlaceAddressCtrl.text = eKycData['recent_location'];
      bpProvinceCtrl.text = postCode['city'][1];
      bpDistrictCtrl.text = postCode['district'][1];
      bpStreetCtrl.text = postCode['detail'];
      bpWardCtrl.text = postCode['ward'][1];
      birthDay = eKycData['birth_day'].toString().parseDateTime();
      supplyDate = eKycData['issue_date'].toString().parseDateTime();
      expiryDate = eKycData['valid_date'].toString().parseDateTime();
      if (DateTime.now().year - (birthDay?.year ?? 0) >= 18) {
        pDoneAPICaller = PDoneAPICaller.adult;
        // pDoneAPICaller = PDoneAPICaller.teenager;
      } else {
        pDoneAPICaller = PDoneAPICaller.teenager;
        // pDoneAPICaller = PDoneAPICaller.adult;
      }
    } else {
      pDoneOptionMethod = PDoneOptionMethod.userBirthCer;
    }

    if (pDoneAPICaller == PDoneAPICaller.adult) {
      protectorApprove = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return validationFormBuilder(
      child: ScaffoldHideKeyboard(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.fromLTRB(
            UpgradeAccountConstants.horizontalScreen,
            0,
            UpgradeAccountConstants.horizontalScreen,
            80,
          ),
          child: BlocConsumer<UpgradePDoneBloc, UpgradePDoneState>(
            listener: _onListenerBloc,
            builder: (context, state) {
              if (state is GetListMasterSuccess) {
                hideLoading();
              }

              return Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Họ tên - Tên đệm
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: InformationFieldWidget(
                            required: true,
                            shouldEnabled: pDoneOptionMethod !=
                                PDoneOptionMethod.userIdentityCard,
                            controller: firstNameCtrl,
                            onChanged: (value) => onUpdatePayload(
                                payload.copyWith(firstName: value)),
                            type: UpdateInformationType.firstName,
                            validator: (value) => context.validateEmptyInfo(
                              firstNameCtrl.text,
                              'Vui lòng nhập họ',
                            ),
                          ),
                        ),
                        _buildSpacerBetweenFields(),
                        Expanded(
                          child: InformationFieldWidget(
                            controller: middleNameCtrl,
                            shouldEnabled: pDoneOptionMethod !=
                                PDoneOptionMethod.userIdentityCard,
                            onChanged: (value) => onUpdatePayload(
                                payload.copyWith(middleName: value)),
                            type: UpdateInformationType.middleName,
                          ),
                        ),
                      ],
                    ),

                    /// Tên
                    InformationFieldWidget(
                      required: true,
                      shouldEnabled: pDoneOptionMethod !=
                          PDoneOptionMethod.userIdentityCard,
                      controller: lastNameCtrl,
                      onChanged: (value) =>
                          onUpdatePayload(payload.copyWith(lastName: value)),
                      type: UpdateInformationType.lastName,
                      validator: (value) => context.validateEmptyInfo(
                        lastNameCtrl.text,
                        'Vui lòng nhập tên',
                      ),
                    ),

                    /// Nickname
                    InformationFieldWidget(
                      required: true,
                      controller: nickNameCtrl,
                      onChanged: (value) =>
                          onUpdatePayload(payload.copyWith(nickname: value)),
                      type: UpdateInformationType.nickName,
                      validator: (value) => context.validateEmptyInfo(
                        nickNameCtrl.text,
                        'Vui lòng nhập Nickname',
                      ),
                      maxLength: 40,
                    ),
                    InformationLayoutFieldWidget(
                      required: true,
                      label: UpdateInformationType.birthDay.title(context),
                      child: InputDateTimeWidget(
                        hintText: 'Ngày sinh',
                        // validator: (value) {
                        //   return context.validateEmptyInfo(
                        //     bpProvinceCtrl.text,
                        //     'Vui lòng nhập ngày sinh',
                        //   );
                        // },
                        useHorizontalLayout: true,
                        enabled: pDoneOptionMethod !=
                            PDoneOptionMethod.userIdentityCard,
                        radius: 17,
                        date: birthDay,
                        formatText: (date) => S
                            .of(context)
                            .formatDateDDmmYYYYhhMM(date, date)
                            .split(' ')
                            .first,
                        max: maxBirthDay,
                        onChange: (dateTime) {
                          birthDay = dateTime;
                        },
                      ),
                    ),

                    /// Giới tính - Ngày sinh
                    GenderInput(
                      onChange: (sex) {
                        if (sex != null) {
                          gender = sex;
                          setState(() {});
                        }
                      },
                    ),

                    pDoneOptionMethod == PDoneOptionMethod.userIdentityCard
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Text(
                                  'Nơi sinh',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(fontSize: 14),
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: InformationFieldWidget(
                                      required: true,
                                      shouldEnabled: pDoneOptionMethod !=
                                          PDoneOptionMethod.userIdentityCard,
                                      controller: bpProvinceCtrl,
                                      onChanged: (value) => onUpdatePayload(
                                          payload.copyWith(firstName: value)),
                                      type: UpdateInformationType.province,
                                      validator: (value) {
                                        context.validateEmptyInfo(
                                          bpProvinceCtrl.text,
                                          'Vui lòng nhập tỉnh thành',
                                        );
                                        onValidation();
                                        return null;
                                      },
                                    ),
                                  ),
                                  _buildSpacerBetweenFields(),
                                  Expanded(
                                    child: InformationFieldWidget(
                                      shouldEnabled: pDoneOptionMethod !=
                                          PDoneOptionMethod.userIdentityCard,
                                      controller: bpDistrictCtrl,
                                      required: true,
                                      onChanged: (value) => onUpdatePayload(
                                          payload.copyWith(middleName: value)),
                                      type: UpdateInformationType.district,
                                      validator: (value) =>
                                          context.validateEmptyInfo(
                                        bpDistrictCtrl.text,
                                        'Vui lòng nhập quận/huyện',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: InformationFieldWidget(
                                      shouldEnabled: pDoneOptionMethod !=
                                          PDoneOptionMethod.userIdentityCard,
                                      required: true,
                                      controller: bpWardCtrl,
                                      onChanged: (value) => onUpdatePayload(
                                          payload.copyWith(firstName: value)),
                                      type: UpdateInformationType.ward,
                                      validator: (value) =>
                                          context.validateEmptyInfo(
                                        bpWardCtrl.text,
                                        'Vui lòng nhập xã/phường',
                                      ),
                                    ),
                                  ),
                                  _buildSpacerBetweenFields(),
                                  Expanded(
                                    child: InformationFieldWidget(
                                      controller: bpStreetCtrl,
                                      required: true,
                                      shouldEnabled: pDoneOptionMethod !=
                                          PDoneOptionMethod.userIdentityCard,
                                      onChanged: (value) {
                                        onUpdatePayload(payload.copyWith(
                                            middleName: value));
                                        onValidation();
                                      },
                                      type: UpdateInformationType.street,
                                      validator: (value) =>
                                          context.validateEmptyInfo(
                                        bpStreetCtrl.text,
                                        'Vui lòng nhập đường/thôn',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        : BlocProvider<PlaceInformationBloc>(
                            create: (context) => injector.get(),
                            child: PlaceInformationWidget(
                              title: 'Nơi sinh',
                              initPlaceInformation: birthPlace,
                              onUpdatePlaceInformation: (value) {
                                onUpdatePayload(
                                  payload.copyWith(
                                    birthPlace: UpdatePDoneBirthPlacePayload(
                                        countryName: 'VN',
                                        countryCode: '',
                                        address: birthPlaceAddressCtrl.text,
                                        provinceName:
                                            birthPlace?.province?.name ?? '',
                                        districtName:
                                            birthPlace?.district?.name,
                                        wardName: birthPlace?.ward?.name),
                                  ),
                                );
                              },
                              addressCtrl: birthPlaceAddressCtrl,
                              required: true,
                            ),
                          ),

                    BlocProvider<PlaceInformationBloc>(
                      create: (context) => injector.get(),
                      child: PlaceInformationWidget(
                        title: 'Địa chỉ ở hiện tại',
                        initPlaceInformation: currentPlace,
                        onUpdatePlaceInformation: (value) {
                          onUpdatePayload(
                              payload.copyWith(currentPlace: value));
                        },
                        addressCtrl: currentPlaceAddressCtrl,
                        required: true,
                      ),
                    ),
                    pDoneOptionMethod == PDoneOptionMethod.userIdentityCard
                        ? Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: InformationFieldWidget(
                                  required: true,
                                  isBold: true,
                                  maxLength: 12,
                                  controller: identifyNumberCtrl,
                                  onChanged: (value) {
                                    onUpdatePayload(payload.copyWith(
                                        identityNumber: value));
                                    onValidation();
                                  },
                                  type: UpdateInformationType.idNumber,
                                  textInputType: TextInputType.number,
                                  validator: (value) =>
                                      checkIsUnder15ShouldEnableField()
                                          ? context.validateCCCD(
                                              identifyNumberCtrl.text,
                                              'Thông tin không hợp lệ')
                                          : null,
                                  shouldEnabled: pDoneOptionMethod !=
                                      PDoneOptionMethod.userIdentityCard,
                                ),
                              ),
                              _buildSpacerBetweenFields(),
                              Expanded(
                                child: InformationLayoutFieldWidget(
                                  required: false,
                                  label: UpdateInformationType.supplyDate
                                      .title(context),
                                  child: InputDateTimeWidget(
                                    hintText: 'Ngày cấp',
                                    useHorizontalLayout: true,
                                    enabled: pDoneOptionMethod !=
                                        PDoneOptionMethod.userIdentityCard,
                                    radius: 17,
                                    date: supplyDate,
                                    formatText: (date) => S
                                        .of(context)
                                        .formatDateDDmmYYYYhhMM(date, date)
                                        .split(' ')
                                        .first,
                                    max: DateTime.now(),
                                    onChange: (dateTime) {
                                      onValidation();
                                      supplyDate = dateTime;
                                    },
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Container(),

                    /// Ngày Cấp - Nơi Cấp
                    pDoneOptionMethod == PDoneOptionMethod.userIdentityCard
                        ? InformationFieldWidget(
                            required: true,
                            shouldEnabled: pDoneOptionMethod !=
                                PDoneOptionMethod.userIdentityCard,
                            controller: supplyAddressCtrl,
                            onChanged: (value) {
                              onUpdatePayload(
                                payload.copyWith(supplyAddress: value),
                              );
                              onValidation();
                            },
                            type: UpdateInformationType.placeofIdNumber,
                            inputFormatters: [
                              FilteringTextInputFormatter.deny(RegExp('[0-9]'))
                            ],
                            validator: (value) =>
                                checkIsUnder15ShouldEnableField()
                                    ? context.validateEmptyInfo(
                                        supplyAddressCtrl.text,
                                        'Vui lòng nhập nơi cấp')
                                    : null,
                          )
                        : Container(),
                    isShowProtector()
                        ? VerifyProtectorWidget(
                            onUpdatePlaceInformation:
                                (PDoneVerifyProtectorRequest value) {
                              pDoneVerifyProtectorRequest = value;
                            },
                            updateProtectorStatus: (bool value) {
                              protectorApprove = value;
                              Future.delayed(Duration(milliseconds: 200))
                                  .then((value) {
                                setState(() {
                                  onValidation();
                                });
                              });
                            },
                          )
                        : Container(),

                    validationListenableBuilder(
                      builder: (isValid) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 38),
                          child: GradiantButton(
                            onPressed: (isValid && protectorApprove)
                                ? _onTapNext
                                : null,
                            child: Text(
                              'TIẾP THEO',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(color: AppColors.white),
                            ),
                          ),
                        );
                      },
                    ),
                    KeyboardVisibilityBuilder(
                        builder: (context, isKeyboardVisible) {
                      return SizedBox(height: isKeyboardVisible ? 250 : 0);
                    }),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildSpacerBetweenFields() {
    return const SizedBox(width: 10);
  }
}
