import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/presentation/authentication/authentication_coordinator.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:localization/localization.dart';
import 'package:ui/ui.dart';

import '../../../../data/models/payloads/upgrade_account/upgrade_pdone/pdone_verify_protector.dart';
import '../../../../domain/entities/update_account/check_protector_payload.dart';
import '../../../../domain/entities/update_account/update_pdone_birth_place_payload.dart';
import '../../../../domain/entities/update_account/update_place_information_payload.dart';
import '../../../../domain/entities/update_account/update_profile_payload.dart';
import '../../../../domain/entities/update_account/upgrade_account.dart';
import '../../../app_constants.dart';
import '../../../shared/extensions/validation_extension.dart';
import '../../upgrade_account_constants.dart';
import '../../upgrade_account_coordinator.dart';
import '../../upgrade_ja/widgets/gradiant_button.dart';
import '../bloc/place_information/place_information_bloc.dart';
import '../bloc/upgrade_pdone/upgrade_pdone_bloc.dart';
import '../mixin/update_pdone_information_mixin.dart';
import '../views/widgets/place_information_widget.dart';
import '../views/widgets/select_information_widget.dart';
import '../views/widgets/verify_protector_widget.dart';
import 'update_pdone_otp.dart';

const msgValidateProtectorOk = 'Thông tin người bảo hộ trùng khớp';

class UpdatePDoneInformationPage extends StatefulWidget {
  static const String routeName = '/update-pdone-information';

  const UpdatePDoneInformationPage({
    super.key,
    this.onNextPage,
    // this.pDoneProfile,
  });

  final VoidCallback? onNextPage;

  // final PDoneProfile? pDoneProfile;

  @override
  State<UpdatePDoneInformationPage> createState() =>
      _UpdatePDoneInformationPageState();
}

class _UpdatePDoneInformationPageState extends State<UpdatePDoneInformationPage>
    with ValidationMixin, UpdatePDoneInformationMixin {
  UpgradePDoneBloc get upgradePDoneBloc => context.read();

  // UserBloc get userBloc => context.read();

  final _showProtectorCtrl = ValueNotifier<bool>(false);

  // validator protector PDoneId
  String? validatorPDoneId = 'Bạn phải nhập ID P-Done';

  // validator protector Email or Phone
  String? validatorEmailOrPhone = 'Thông tin không hợp lệ';

  // validator protector Identify number
  String? validatorIdentifyNumber = 'Thông tin không hợp lệ';

  bool isValidatingProtector = false;

  // prevent change after validate protector
  bool needValidatingProtector = false;

  final _showResultValidateProtectorCtrl = ValueNotifier<String>('');

  PDoneOptionMethod pDoneOptionMethod = PDoneOptionMethod.userIdentityCard;

  PDoneOptionRangeAge rangeAge = PDoneOptionRangeAge.over18;

  bool isShowProtector() {
    return rangeAge == PDoneOptionRangeAge.under18AndOver15 ||
        pDoneOptionMethod == PDoneOptionMethod.userBirthCer;
  }

  void _onListenerBloc(BuildContext context, UpgradePDoneState state) {
    if (state is UpdateProfileLoading) {
      showLoading();
    } else if (state is UpdateProfileSuccess) {
      hideLoading();
      context.upgradePdoneSuccess();
    } else if (state is UpdateProfileFailure) {
      hideLoading();

      showToastMessage(state.errorMessage, ToastMessageType.warning);
    } else if (state is GetMyProfileSuccess) {}
    if (state is VerifyOTPProtectorSuccessState) {
      hideLoading();
      context.upgradePdoneWithProtectorSuccess();
    }

    if (state is UpdatePDoneSendOTPSuccessState) {
      hideLoading();
      showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) {
            return StatefulBuilder(builder: (ctx, state) {
              return FractionallySizedBox(
                heightFactor: 1,
                child: UpdatePDoneOtp(
                  blocUpdate: upgradePDoneBloc,
                  payload: payload,
                  rangeAge: rangeAge,
                ),
              );
            });
          });
    }

    if (state is UpdatePDoneSendOTPFailureState) {
      hideLoading();
      showToastMessage(state.errorMessage, ToastMessageType.error);
    }
    if (state is VerifyOTPProtectorFailureState) {
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
      sex: genderCtrl.text == 'Nam' ? 1 : 0,
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

    upgradePDoneBloc.add(UpdatePDoneSendOTP());
  }

  void onUpdatePayload(UpdateProfilePayload val) {
    EasyDebounce.debounce(
        'onUpdateInfomationPayload', const Duration(milliseconds: 200), () {
      onValidation();
      payload = val;
    });
  }

  Future<void> validatePDoneID(String? text) async {
    final validate =
        context.validateformatPDoneAccount(text, 'ID P-Done không hợp lệ!');

    needValidatingProtector = true;
    _showResultValidateProtectorCtrl.value = '';

    if (validate != null) {
      validatorPDoneId = validate;
      checkValidation();
      return;
    }

    EasyDebounce.debounce('testDeb', const Duration(milliseconds: 300),
        () async {
      // final id = text!.trim();
      // final res = await upgradePDoneBloc.checkPDoneAccountEvent(id);
      // validatorPDoneId = res ? null : 'ID P-Done không tồn tại';
      // checkValidation();
      //
      // if (res) {
      //   onUpdatePayload(payload.copyWith(protectorPDoneId: id));
      // }
    });
  }

  void _validateIdentifyNumber(String? text) {
    needValidatingProtector = true;
    final validate = context.validateCCCD(text, 'Thông tin không hợp lệ');
    validatorIdentifyNumber = validate;
    checkValidation();
    _showResultValidateProtectorCtrl.value = '';
  }

  Future<void> _onValidateProtector() async {
    if (isValidatingProtector) {
      return;
    }

    isValidatingProtector = true;

    final pDoneId = pDoneIdProtectorCtrl.text;

    final validate =
        context.validateformatPDoneAccount(pDoneId, 'ID P-Done không hợp lệ!');

    if (validate != null) {
      validatorPDoneId = validate;
      showToastMessage('ID P-Done không hợp lệ!', ToastMessageType.error);
      checkValidation();
      isValidatingProtector = false;
      return;
    }

    final emailOrPhone = emailOrPhoneProtectorCtrl.text;
    final identifyNumber = identifyNumberProtectorCtrl.text;

    final validiIdentifyNumber = identifyNumber.isNotEmpty &&
        context.validateEmptyInfo(identifyNumber, 'messageError') == null;

    if (!validiIdentifyNumber) {
      isValidatingProtector = false;
      showToastMessage('Số ID/CCCD/HC không hợp lệ', ToastMessageType.error);
      return;
    }

    try {
      final payload = CheckProtectorPayload(
        protectorPDoneId: pDoneIdProtectorCtrl.text,
        protectorEmailPhone: emailOrPhone,
        protectorIdentityNumber: identifyNumber,
      );
    } catch (e) {
      if (e is DioError) {
        if (e.response != null && e.response?.data['errors'] != null) {
          final errors = e.response?.data['errors'] as List;
          for (final e in errors) {
            if (e == 'PROTECTOR_IDENTITY_INVALID') {
              validatorIdentifyNumber = 'Thông tin không hợp lệ';
              checkValidation();
              showToastMessage(
                  'Số ID/CCCD/HC không hợp lệ', ToastMessageType.error);
            }
            if (e == 'PROTECTOR_EMAIL_OR_PHONE_INVALID') {
              validatorEmailOrPhone = 'Thông tin không hợp lệ';
              checkValidation();
              showToastMessage(
                  'Email hoặc phone không hợp lệ', ToastMessageType.error);
            }
            if (e == 'PROTECTOR_NOT_FOUND') {
              validatorPDoneId = 'Thông tin không hợp lệ';
              showToastMessage(
                  'ID P-DONE không hợp lệ', ToastMessageType.error);
              checkValidation();
            }
            if (e == 'PROTECTOR_GTE_18_OLD') {
              validatorPDoneId = 'Người bảo hộ phải trên 18 tuổi';
              showToastMessage(
                  'Người bảo hộ phải trên 18 tuổi', ToastMessageType.error);
              checkValidation();
            }
          }
        }
      }
    } finally {
      isValidatingProtector = false;
    }
  }

  @override
  void initState() {
    super.initState();
    _initTextFormField();
  }

  void _initTextFormField() {
    if (((upgradePDoneBloc.state as ExtractedEKycIdCardSuccess).data
            as Map<dynamic, dynamic>)
        .isNotEmpty) {
      final eKycData =
          (upgradePDoneBloc.state as ExtractedEKycIdCardSuccess).data['object'];
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
      genderCtrl.text = eKycData['gender'] ?? 'Nam';
      supplyAddressCtrl.text = eKycData['issue_place'];
      birthPlaceAddressCtrl.text = eKycData['recent_location'];
      bpProvinceCtrl.text = postCode['city'][1];
      bpDistrictCtrl.text = postCode['district'][1];
      bpStreetCtrl.text = postCode['detail'];
      bpWardCtrl.text = postCode['ward'][1];
      birthDay = eKycData['birth_day'].toString().parseDateTime();
      supplyDate = eKycData['issue_date'].toString().parseDateTime();
      expiryDate = eKycData['valid_date'].toString().parseDateTime();

      if (DateTime.now().year - (birthDay?.year ?? 0) > 18) {
        rangeAge = PDoneOptionRangeAge.over18;
      } else {
        rangeAge = PDoneOptionRangeAge.under18AndOver15;
      }
    } else {
      pDoneOptionMethod = PDoneOptionMethod.userBirthCer;
    }
  }

  @override
  Widget build(BuildContext context) {
    return validationFormBuilder(
      child: AutoHideKeyboard(
        child: SingleChildScrollView(
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

              return Column(
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
                    shouldEnabled:
                        pDoneOptionMethod != PDoneOptionMethod.userIdentityCard,
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
                    required: false,
                    label: UpdateInformationType.birthDay.title(context),
                    child: InputDateTimeWidget(
                      hintText: 'Ngày sinh',
                      useHorizontalLayout: true,
                      enabled: pDoneOptionMethod !=
                          PDoneOptionMethod.userIdentityCard,
                      radius: 17,
                      date: birthDay,
                      formatText: (date) => S
                          .of(context)
                          .formatDateDDmmYYYYhhMM(date, date)
                          .split('|')
                          .first,
                      max: DateTime.now(),
                      onChange: (dateTime) {
                        birthDay = dateTime;
                      },
                    ),
                  ),

                  /// Giới tính - Ngày sinh
                  InformationFieldWidget(
                    required: true,
                    controller: genderCtrl,
                    shouldEnabled:
                        pDoneOptionMethod != PDoneOptionMethod.userIdentityCard,
                    onChanged: (value) => onUpdatePayload(
                      payload.copyWith(sex: value == 'Nam' ? 1 : 0),
                    ),
                    type: UpdateInformationType.gender,
                    maxLength: 4,
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
                                    validator: (value) =>
                                        context.validateEmptyInfo(
                                      bpProvinceCtrl.text,
                                      'Vui lòng nhập tỉnh thành',
                                    ),
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
                                    onChanged: (value) => onUpdatePayload(
                                        payload.copyWith(middleName: value)),
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
                                      districtName: birthPlace?.district?.name,
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
                        onUpdatePayload(payload.copyWith(currentPlace: value));
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
                                onChanged: (value) => onUpdatePayload(
                                    payload.copyWith(identityNumber: value)),
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
                                      .split('|')
                                      .first,
                                  max: DateTime.now(),
                                  onChange: (dateTime) {
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
                      ? BlocProvider<UpgradePDoneBloc>(
                          create: (context) => injector.get(),
                          child: VerifyProtectorWidget(
                            onUpdatePDoneVerifyProtector:
                                (PDoneVerifyProtectorRequest value) {
                              onUpdatePayload(
                                payload.copyWith(
                                  protector: value.protector,
                                  protectorPDoneId: value.identityNumber,
                                  protectorEmailPhone: value.phoneNumber,
                                  protectorIdentityNumber: value.identityNumber,
                                  protectorPhoneCode: value.phoneCode,
                                ),
                              );
                            },
                          ),
                        )
                      : Container(),

                  validationListenableBuilder(
                    builder: (isValid) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 38),
                        child: GradiantButton(
                          onPressed: isValid ? _onTapNext : null,
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
                ],
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
