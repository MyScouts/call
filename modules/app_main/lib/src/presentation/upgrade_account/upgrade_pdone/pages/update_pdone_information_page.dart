import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:localization/localization.dart';
import 'package:ui/ui.dart';

import '../../../../domain/entities/update_account/check_protector_payload.dart';
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

  void _onListenerBloc(BuildContext context, UpgradePDoneState state) {
    if (state is UpdateProfileLoading) {
      showLoading();
    } else if (state is UpdateProfileSuccess) {
      // userBloc.add(UserUpdateBirthDayEvent(birthDay!));
      hideLoading();
      if (widget.onNextPage != null) {
        widget.onNextPage!.call();
      }
    } else if (state is UpdateProfileFailure) {
      hideLoading();
      showToastMessage(state.errorMessage);
    } else if (state is GetMyProfileSuccess) {
      // updateInformation(state.user.profile);
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
      birthPlace:
          '${bpStreetCtrl.text}, ${bpWardCtrl.text}, ${bpDistrictCtrl.text}, ${bpProvinceCtrl.text}',
      currentPlace: UpdatePlaceInformationPayload(
        address: cAddressCtrl.text,
        provinceName: cProvinceCtrl.text,
        districtName: cDistrictCtrl.text,
        wardName: cWardCtrl.text,
        street: cStreetCtrl.text,
      ),
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
      // protector:,
      // protectorPDoneId,
      // protectorIdentityNumber,
      // protectorEmailPhone,
    );
    upgradePDoneBloc.add(UpdatePDoneProfileEvent(payload));
    // if (_showProtectorCtrl.value && needValidatingProtector) {
    //   // showToastMessage('ID P-DONE không hợp lệ', ToastMessageType.error);
    //   showToastMessage('Bạn cần nhấn nút kiểm tra lại thông tin người bảo hộ',
    //       ToastMessageType.error);
    //   return;
    // }
    // if (_showProtectorCtrl.value) {
    //   if (_showResultValidateProtectorCtrl.value
    //       .contains(msgValidateProtectorOk)) {
    //     payload = payload.copyWith(
    //       protectorEmailPhone: emailOrPhoneProtectorCtrl.text,
    //       protectorPDoneId: pDoneIdProtectorCtrl.text,
    //       protectorIdentityNumber: identifyNumberProtectorCtrl.text,
    //     );
    //     upgradePDoneBloc.add(UpdatePDoneProfileEvent(payload));
    //   }
    // } else {
    //   upgradePDoneBloc.add(UpdatePDoneProfileEvent(payload));
    // }
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

  void _validateEmailOrPhone(String? text) {
    // needValidatingProtector = true;
    // final validate =
    //     context.validateEmailOrPhone(text, 'Thông tin không hợp lệ');
    // validatorEmailOrPhone = validate;
    // checkValidation();
    // _showResultValidateProtectorCtrl.value = '';
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
    //
    // final validEmailOrPhone =
    //     context.validateEmailOrPhone(emailOrPhone, 'messageError') == null;
    //
    // if (!validEmailOrPhone) {
    //   isValidatingProtector = false;
    //   showToastMessage(
    //       'Số điện thoại/Email không hợp lệ', ToastMessageType.error);
    //   return;
    // }

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
      // await upgradePDoneBloc.checkProtector(payload).then((res) {
      //   context.startDialogCheckProtectorVerifyOTP(res, payload).then((value) {
      //     if (value != null && value) {
      //       _showResultValidateProtectorCtrl.value = msgValidateProtectorOk;
      //       needValidatingProtector = false;
      //     }
      //   });
      // });
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

    // if (widget.pDoneProfile != null) {
    //   updateInformation(widget.pDoneProfile!);
    // }
    //
    // upgradePDoneBloc.add(GetListMasterEvent());
    // showLoading();
    _initTextFormField();
  }

  void _initTextFormField() {
    final eKycData =
        (upgradePDoneBloc.state as ExtractedEKycIdCardSuccess).data;
    identifyNumberCtrl.text = eKycData['id'];
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

    nickNameCtrl.text = eKycData['name'];
    genderCtrl.text = eKycData['sex'];
    supplyAddressCtrl.text = eKycData['issue_by'];
    birthPlaceAddressCtrl.text = eKycData['birthplace'];
    bpProvinceCtrl.text = eKycData['province'];
    bpDistrictCtrl.text = eKycData['district'];
    bpStreetCtrl.text = eKycData['street'];
    bpWardCtrl.text = eKycData['ward'];
    birthDay = eKycData['birthday'].toString().parseDateTime();
    supplyDate = eKycData['issue_date'].toString().parseDateTime();
    expiryDate = eKycData['expiry'].toString().parseDateTime();
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
              UpgradeAccount? dataInfo;

              if (state is GetListMasterSuccess) {
                dataInfo = state.upgradeAccount;
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
                  InfomationLayoutFieldWidget(
                    required: false,
                    label: UpdateInformationType.birthDay.title(context),
                    child: InputDateTimeWidget(
                      hintText: 'Ngày sinh',
                      useHorizontalLayout: true,
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

                  InfomationLayoutFieldWidget(
                    required: false,
                    label: UpdateInformationType.supplyDate.title(context),
                    child: InputDateTimeWidget(
                      hintText: 'Ngày cấp thẻ',
                      useHorizontalLayout: true,
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

                  InfomationLayoutFieldWidget(
                    required: false,
                    label: UpdateInformationType.expiryDate.title(context),
                    child: InputDateTimeWidget(
                      hintText: 'Ngày hết hạn thẻ',
                      useHorizontalLayout: true,
                      radius: 17,
                      date: expiryDate,
                      formatText: (date) => S
                          .of(context)
                          .formatDateDDmmYYYYhhMM(date, date)
                          .split('|')
                          .first,
                      max: DateTime.now(),
                      onChange: (dateTime) {
                        expiryDate = dateTime;
                      },
                    ),
                  ),

                  /// Giới tính - Ngày sinh
                  InformationFieldWidget(
                    required: true,
                    controller: genderCtrl,
                    onChanged: (value) => onUpdatePayload(
                      payload.copyWith(sex: value == 'Nam' ? 1 : 0),
                    ),
                    type: UpdateInformationType.gender,
                    validator: (value) => context.validateGender(
                      genderCtrl.text,
                      'Giới tính trong thẻ không hợp lệ',
                    ),
                    maxLength: 4,
                  ),

                  /// Tài khoản em chưa 18 cần ng bảo hộ
                  // ValueListenableBuilder<bool>(
                  //   valueListenable: _showProtectorCtrl,
                  //   builder: (context, value, child) {
                  //     return value
                  //         ? Container(
                  //             margin: const EdgeInsets.only(top: 15),
                  //             padding:
                  //                 const EdgeInsets.fromLTRB(10, 18, 10, 15),
                  //             decoration: BoxDecoration(
                  //               color: AppColors.grey71,
                  //               border: Border.all(color: AppColors.grey10),
                  //               borderRadius: const BorderRadius.all(
                  //                 Radius.circular(5),
                  //               ),
                  //             ),
                  //             child: Column(
                  //               crossAxisAlignment: CrossAxisAlignment.stretch,
                  //               children: [
                  //                 Text(
                  //                   'Trường hợp đăng ký P-done dưới 18 tuổi',
                  //                   style:
                  //                       Theme.of(context).textTheme.labelMedium,
                  //                 ),
                  //                 SelectInformationWidget<Protector>(
                  //                   required: true,
                  //                   builder: (item) =>
                  //                       DropdownItemWidget(text: item.name),
                  //                   items: dataInfo?.protectors ?? [],
                  //                   type: UpdateInformationType.protector,
                  //                   onChanged: (val) {
                  //                     if (val != null) {
                  //                       onUpdatePayload(payload.copyWith(
                  //                           protector: val.id));
                  //                       setState(() {
                  //                         currentProtector = val;
                  //                       });
                  //                     }
                  //                   },
                  //                   currentValue: currentProtector?.name,
                  //                   validator: (value) =>
                  //                       context.validateEmptyInfo(
                  //                           currentProtector?.name,
                  //                           'Vui lòng chọn người bảo hộ'),
                  //                 ),
                  //                 InformationFieldWidget(
                  //                   required: true,
                  //                   controller: pDoneIdProtectorCtrl,
                  //                   onChanged: validatePDoneID,
                  //                   type: UpdateInformationType
                  //                       .pDoneIDOfProtector,
                  //                   validator: (text) {
                  //                     return validatorPDoneId;
                  //                   },
                  //                 ),
                  //                 InformationFieldWidget(
                  //                   required: true,
                  //                   controller: emailOrPhoneProtectorCtrl,
                  //                   onChanged: _validateEmailOrPhone,
                  //                   type: UpdateInformationType.emailAndPhone,
                  //                   validator: (text) {
                  //                     return validatorEmailOrPhone;
                  //                   },
                  //                 ),
                  //
                  //                 /// Số ID/CCCD/HC *
                  //                 InformationFieldWidget(
                  //                   required: true,
                  //                   isBold: true,
                  //                   maxLength: 12,
                  //                   controller: identifyNumberProtectorCtrl,
                  //                   onChanged: _validateIdentifyNumber,
                  //                   type: UpdateInformationType
                  //                       .idNumberOfProtector,
                  //                   textInputType: TextInputType.number,
                  //                   inputFormatters: <TextInputFormatter>[
                  //                     FilteringTextInputFormatter.digitsOnly,
                  //                   ],
                  //                   validator: (value) {
                  //                     return validatorIdentifyNumber;
                  //                   },
                  //                 ),
                  //                 Padding(
                  //                   padding: const EdgeInsets.symmetric(
                  //                     vertical: 12,
                  //                   ),
                  //                   child: GradiantButton(
                  //                     onPressed: _onValidateProtector,
                  //                     child: Text(
                  //                       'Kiểm tra thông tin',
                  //                       style: Theme.of(context)
                  //                           .textTheme
                  //                           .labelLarge
                  //                           ?.copyWith(color: AppColors.white),
                  //                     ),
                  //                   ),
                  //                 ),
                  //                 ValueListenableBuilder(
                  //                   valueListenable:
                  //                       _showResultValidateProtectorCtrl,
                  //                   builder: (_, val, __) {
                  //                     if (val == '') {
                  //                       return const SizedBox();
                  //                     }
                  //                     return Text(
                  //                       val.toString(),
                  //                       style: Theme.of(context)
                  //                           .textTheme
                  //                           .labelMedium!
                  //                           .copyWith(
                  //                             color: val.toString() ==
                  //                                     msgValidateProtectorOk
                  //                                 ? Colors.green
                  //                                 : Colors.red,
                  //                           ),
                  //                     );
                  //                   },
                  //                 )
                  //               ],
                  //             ),
                  //           )
                  //         : const SizedBox();
                  //   },
                  // ),

                  Column(
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
                              controller: bpProvinceCtrl,
                              onChanged: (value) => onUpdatePayload(
                                  payload.copyWith(firstName: value)),
                              type: UpdateInformationType.province,
                              validator: (value) => context.validateEmptyInfo(
                                bpProvinceCtrl.text,
                                'Vui lòng nhập tỉnh thành',
                              ),
                            ),
                          ),
                          _buildSpacerBetweenFields(),
                          Expanded(
                            child: InformationFieldWidget(
                              controller: bpDistrictCtrl,
                              required: true,
                              onChanged: (value) => onUpdatePayload(
                                  payload.copyWith(middleName: value)),
                              type: UpdateInformationType.district,
                              validator: (value) => context.validateEmptyInfo(
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
                              required: true,
                              controller: bpWardCtrl,
                              onChanged: (value) => onUpdatePayload(
                                  payload.copyWith(firstName: value)),
                              type: UpdateInformationType.ward,
                              validator: (value) => context.validateEmptyInfo(
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
                              onChanged: (value) => onUpdatePayload(
                                  payload.copyWith(middleName: value)),
                              type: UpdateInformationType.street,
                              validator: (value) => context.validateEmptyInfo(
                                bpStreetCtrl.text,
                                'Vui lòng nhập đường/thôn',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  // /// Nơi ở hiện tại
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          'Nơi ở hiện tại',
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
                              controller: cProvinceCtrl,
                              onChanged: (value) => onUpdatePayload(
                                  payload.copyWith(firstName: value)),
                              type: UpdateInformationType.province,
                              validator: (value) => context.validateEmptyInfo(
                                cProvinceCtrl.text,
                                'Vui lòng nhập tỉnh thành',
                              ),
                            ),
                          ),
                          _buildSpacerBetweenFields(),
                          Expanded(
                            child: InformationFieldWidget(
                              controller: cDistrictCtrl,
                              required: true,
                              onChanged: (value) => onUpdatePayload(
                                  payload.copyWith(middleName: value)),
                              type: UpdateInformationType.district,
                              validator: (value) => context.validateEmptyInfo(
                                cDistrictCtrl.text,
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
                              required: true,
                              controller: cWardCtrl,
                              onChanged: (value) => onUpdatePayload(
                                  payload.copyWith(firstName: value)),
                              type: UpdateInformationType.ward,
                              validator: (value) => context.validateEmptyInfo(
                                cWardCtrl.text,
                                'Vui lòng nhập xã/phường',
                              ),
                            ),
                          ),
                          _buildSpacerBetweenFields(),
                          Expanded(
                            child: InformationFieldWidget(
                              controller: cStreetCtrl,
                              required: true,
                              onChanged: (value) => onUpdatePayload(
                                  payload.copyWith(middleName: value)),
                              type: UpdateInformationType.street,
                              validator: (value) => context.validateEmptyInfo(
                                cStreetCtrl.text,
                                'Vui lòng nhập đường/thôn',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  /// Số ID/CCCD/HC *
                  InformationFieldWidget(
                    required: checkIsUnder15ShouldEnableField(),
                    isBold: true,
                    maxLength: 12,
                    controller: identifyNumberCtrl,
                    onChanged: (value) => onUpdatePayload(
                        payload.copyWith(identityNumber: value)),
                    type: UpdateInformationType.idNumber,
                    textInputType: TextInputType.number,
                    validator: (value) => checkIsUnder15ShouldEnableField()
                        ? context.validateCCCD(
                            identifyNumberCtrl.text, 'Thông tin không hợp lệ')
                        : null,
                    shouldEnabled: checkIsUnder15ShouldEnableField(),
                  ),

                  /// Ngày Cấp - Nơi Cấp
                  InformationFieldWidget(
                    required: checkIsUnder15ShouldEnableField(),
                    shouldEnabled: checkIsUnder15ShouldEnableField(),
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
                    validator: (value) => checkIsUnder15ShouldEnableField()
                        ? context.validateEmptyInfo(
                            supplyAddressCtrl.text, 'Vui lòng nhập nơi cấp')
                        : null,
                  ),

                  /// Chiều Cao - Cân Nặng
                  // if (!AppConstants.notRelease)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: InformationFieldWidget(
                          onChanged: (value) => onUpdatePayload(
                              payload.copyWith(
                                  height: int.tryParse(value.toString()))),
                          type: UpdateInformationType.bloodType,
                          textInputType: TextInputType.text,
                          controller: bloodGroupCtrl,
                        ),
                      ),
                      _buildSpacerBetweenFields(),
                      Expanded(
                        child: InformationFieldWidget(
                          onChanged: (value) => onUpdatePayload(
                              payload.copyWith(
                                  weight: int.tryParse(value.toString()))),
                          type: UpdateInformationType.maritalStatus,
                          textInputType: TextInputType.text,
                          controller: maritalStatusCtrl,
                        ),
                      ),
                    ],
                  ),

                  /// Nghề Nghiệp
                  // if (!AppConstants.notRelease)

                  InformationFieldWidget(
                    type: UpdateInformationType.career,
                    textInputType: TextInputType.text,
                    controller: jobCtrl,
                    onChanged: (String? value) {},
                  ),

                  /// Sở Thích
                  // if (!AppConstants.notRelease)
                  InformationFieldWidget(
                    type: UpdateInformationType.hobby,
                    textInputType: TextInputType.text,
                    controller: interestCtrl,
                    onChanged: (String? value) {},
                  ),

                  /// Năng Khiếu
                  // if (!AppConstants.notRelease)
                  InformationFieldWidget(
                    type: UpdateInformationType.gifted,
                    textInputType: TextInputType.text,
                    controller: talentCtrl,
                    onChanged: (String? value) {},
                  ),

                  /// Học vấn
                  // if (!AppConstants.notRelease)
                  InformationFieldWidget(
                    type: UpdateInformationType.academicLevel,
                    textInputType: TextInputType.text,
                    controller: academyCtrl,
                    onChanged: (String? value) {},
                  ),

                  validationListenableBuilder(builder: (isValid) {
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
                  }),
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
