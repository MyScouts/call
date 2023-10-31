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
  // UpgradePDoneBloc get upgradePDoneBloc => context.read();
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
    if (_showProtectorCtrl.value && needValidatingProtector) {
      // showToastMessage('ID P-DONE không hợp lệ', ToastMessageType.error);
      showToastMessage('Bạn cần nhấn nút kiểm tra lại thông tin người bảo hộ',
          ToastMessageType.error);
      return;
    }
    if (_showProtectorCtrl.value) {
      if (_showResultValidateProtectorCtrl.value
          .contains(msgValidateProtectorOk)) {
        payload = payload.copyWith(
          protectorEmailPhone: emailOrPhoneProtectorCtrl.text,
          protectorPDoneId: pDoneIdProtectorCtrl.text,
          protectorIdentityNumber: identifyNumberProtectorCtrl.text,
        );
        // upgradePDoneBloc.add(UpdatePDoneProfileEvent(payload));
      }
    } else {
      // upgradePDoneBloc.add(UpdatePDoneProfileEvent(payload));
    }
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
    showLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sửa thông tin cá nhân'),
        centerTitle: true,
        titleSpacing: 0,
        elevation: 0,
        leading: IconButton(
          padding: const EdgeInsets.all(2),
          icon: const Icon(Icons.arrow_back),
          onPressed: Navigator.of(context).pop,
        ),
      ),
      // appBar: widget.pDoneProfile != null
      //     ? AppBar(
      //         title: const Text('Sửa thông tin cá nhân'),
      //         centerTitle: true,
      //         titleSpacing: 0,
      //         elevation: 0,
      //         leading: IconButton(
      //           padding: const EdgeInsets.all(2),
      //           icon: const Icon(Icons.arrow_back),
      //           onPressed: Navigator.of(context).pop,
      //         ),
      //       )
      //     : null,
      body: validationFormBuilder(
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

                    /// Giới tính - Ngày sinh
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: SelectInformationWidget<Gender>(
                            required: true,
                            builder: (item) =>
                                DropdownItemWidget(text: item.value),
                            currentValue: currentGender?.value,
                            items: dataInfo?.genders ?? [],
                            type: UpdateInformationType.gender,
                            onChanged: (val) {
                              if (val != null) {
                                onUpdatePayload(payload.copyWith(sex: val.key));
                                setState(() {
                                  currentGender = val;
                                });
                              }
                            },
                            validator: (value) => context.validateEmptyInfo(
                                currentGender?.value,
                                'Vui lòng chọn giới tính'),
                          ),
                        ),
                        _buildSpacerBetweenFields(),
                        // TODO: fix heare
                        // Expanded(
                        //   child: InfomationLayoutFieldWidget(
                        //     required: true,
                        //     label:
                        //         UpdateInformationType.birthDay.title(context),
                        //     child: InputDateTimeWidget(
                        //       hintText: 'Chọn ngày sinh',
                        //       useHorizontalLayout: true,
                        //       radius: 17,
                        //       date: birthDay,
                        //       formatText: (date) => S
                        //           .of(context)
                        //           .formatDateDDmmYYYYhhMM(date, date)
                        //           .split('|')
                        //           .first,
                        //       max: DateTime.now(),
                        //       onChange: (value) {
                        //         if (value != null) {
                        //           birthDay = value;

                        //           final isUnder18 = value.isUnder18yearsAgo();
                        //           _showProtectorCtrl.value = isUnder18;
                        //           needValidatingProtector = isUnder18;

                        //           if (!isUnder18) {
                        //             onUpdatePayload(
                        //               payload.copyWith(
                        //                   protector: null,
                        //                   protectorPDoneId: null),
                        //             );
                        //             currentProtector = null;
                        //             identifyNumberProtectorCtrl.clear();
                        //             pDoneIdProtectorCtrl.clear();
                        //             emailOrPhoneProtectorCtrl.clear();
                        //           }

                        //           final isUnder15 = value.isUnder15yearsAgo();

                        //           if (isUnder15) {
                        //             supplyAddressCtrl.clear();
                        //             identifyNumberCtrl.clear();
                        //             supplyDate = null;
                        //             onUpdatePayload(
                        //               payload.copyWith(
                        //                   supplyDate: null,
                        //                   identityNumber: null,
                        //                   supplyAddress: null),
                        //             );
                        //           }

                        //           setState(() {});
                        //           onUpdatePayload(
                        //               payload.copyWith(birthday: value.text()));
                        //         }
                        //       },
                        //       validator: (value) => context.validateEmptyInfo(
                        //         birthDay?.toString(),
                        //         'Vui lòng chọn thông tin',
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),

                    /// Tài khoản em chưa 18 cần ng bảo hộ
                    ValueListenableBuilder<bool>(
                      valueListenable: _showProtectorCtrl,
                      builder: (context, value, child) {
                        return value
                            ? Container(
                                margin: const EdgeInsets.only(top: 15),
                                padding:
                                    const EdgeInsets.fromLTRB(10, 18, 10, 15),
                                decoration: BoxDecoration(
                                  color: AppColors.grey71,
                                  border: Border.all(color: AppColors.grey10),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      'Trường hợp đăng ký P-done dưới 18 tuổi',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
                                    ),
                                    SelectInformationWidget<Protector>(
                                      required: true,
                                      builder: (item) =>
                                          DropdownItemWidget(text: item.name),
                                      items: dataInfo?.protectors ?? [],
                                      type: UpdateInformationType.protector,
                                      onChanged: (val) {
                                        if (val != null) {
                                          onUpdatePayload(payload.copyWith(
                                              protector: val.id));
                                          setState(() {
                                            currentProtector = val;
                                          });
                                        }
                                      },
                                      currentValue: currentProtector?.name,
                                      validator: (value) =>
                                          context.validateEmptyInfo(
                                              currentProtector?.name,
                                              'Vui lòng chọn người bảo hộ'),
                                    ),
                                    InformationFieldWidget(
                                      required: true,
                                      controller: pDoneIdProtectorCtrl,
                                      onChanged: validatePDoneID,
                                      type: UpdateInformationType
                                          .pDoneIDOfProtector,
                                      validator: (text) {
                                        return validatorPDoneId;
                                      },
                                    ),
                                    InformationFieldWidget(
                                      required: true,
                                      controller: emailOrPhoneProtectorCtrl,
                                      onChanged: _validateEmailOrPhone,
                                      type: UpdateInformationType.emailAndPhone,
                                      validator: (text) {
                                        return validatorEmailOrPhone;
                                      },
                                    ),

                                    /// Số ID/CCCD/HC *
                                    InformationFieldWidget(
                                      required: true,
                                      isBold: true,
                                      maxLength: 12,
                                      controller: identifyNumberProtectorCtrl,
                                      onChanged: _validateIdentifyNumber,
                                      type: UpdateInformationType
                                          .idNumberOfProtector,
                                      textInputType: TextInputType.number,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.digitsOnly,
                                      ],
                                      validator: (value) {
                                        return validatorIdentifyNumber;
                                      },
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12,
                                      ),
                                      child: GradiantButton(
                                        onPressed: _onValidateProtector,
                                        child: Text(
                                          'Kiểm tra thông tin',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge
                                              ?.copyWith(
                                                  color: AppColors.white),
                                        ),
                                      ),
                                    ),
                                    ValueListenableBuilder(
                                      valueListenable:
                                          _showResultValidateProtectorCtrl,
                                      builder: (_, val, __) {
                                        if (val == '') {
                                          return const SizedBox();
                                        }
                                        return Text(
                                          val.toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium!
                                              .copyWith(
                                                color: val.toString() ==
                                                        msgValidateProtectorOk
                                                    ? Colors.green
                                                    : Colors.red,
                                              ),
                                        );
                                      },
                                    )
                                  ],
                                ),
                              )
                            : const SizedBox();
                      },
                    ),

                    // /// Nơi Sinh
                    BlocProvider<PlaceInformationBloc>(
                      create: (context) => injector.get(),
                      child: PlaceInformationWidget(
                        title: 'Nơi sinh',
                        initPlaceInformation: birthPlace,
                        onUpdatePlaceInformation:
                            (UpdatePlaceInformationPayload value) {
                          onUpdatePayload(payload.copyWith(birthPlace: value));
                        },
                        addressCtrl: birthPlaceAddressCtrl,
                        notRelease: AppConstants.notRelease,
                      ),
                    ),

                    // /// Nơi ở hiện tại
                    BlocProvider<PlaceInformationBloc>(
                      create: (context) => injector.get(),
                      child: PlaceInformationWidget(
                        title: 'Địa chỉ ở hiện tại',
                        initPlaceInformation: currentPlace,
                        onUpdatePlaceInformation:
                            (UpdatePlaceInformationPayload value) {
                          onUpdatePayload(
                              payload.copyWith(currentPlace: value));
                        },
                        addressCtrl: currentPlaceAddressCtrl,
                        // notRelease: AppConstants.notRelease,
                      ),
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
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // TODO: fix heare
                        // Expanded(
                        //   child: InfomationLayoutFieldWidget(
                        //     label: UpdateInformationType.dateOfIdNumber
                        //         .title(context),
                        //     required: checkIsUnder15ShouldEnableField(),
                        //     isBold: true,
                        //     child: InputDateTimeWidget(
                        //       hintText: 'Chọn ngày',
                        //       useHorizontalLayout: true,
                        //       date: supplyDate,
                        //       enabled: checkIsUnder15ShouldEnableField(),
                        //       max: DateTime.now(),
                        //       radius: 17,
                        //       displayValueIsLabel:
                        //           checkIsUnder15ShouldEnableField(),
                        //       formatText: (date) => S
                        //           .of(context)
                        //           .formatDateDDmmYYYYhhMM(date, date)
                        //           .split('|')
                        //           .first,
                        //       validator: (value) =>
                        //           checkIsUnder15ShouldEnableField()
                        //               ? context.validateEmptyInfo(
                        //                   supplyDate?.toString(),
                        //                   'Vui lòng chọn ngày cấp')
                        //               : null,
                        //       onChange: (value) {
                        //         setState(() {
                        //           supplyDate = value;
                        //         });
                        //         onUpdatePayload(payload.copyWith(
                        //             supplyDate: value?.text()));
                        //       },
                        //     ),
                        //   ),
                        // ),
                        _buildSpacerBetweenFields(),
                        Expanded(
                          child: InformationFieldWidget(
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
                            validator: (value) =>
                                checkIsUnder15ShouldEnableField()
                                    ? context.validateEmptyInfo(
                                        supplyAddressCtrl.text,
                                        'Vui lòng nhập nơi cấp')
                                    : null,
                          ),
                        ),
                      ],
                    ),

                    /// Chiều Cao - Cân Nặng
                    if (!AppConstants.notRelease)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: InformationFieldWidget(
                              onChanged: (value) => onUpdatePayload(
                                  payload.copyWith(
                                      height: int.tryParse(value.toString()))),
                              type: UpdateInformationType.height,
                              suffixText: 'cm',
                              textInputType: TextInputType.number,
                              controller: heightCtrl,
                            ),
                          ),
                          _buildSpacerBetweenFields(),
                          Expanded(
                            child: InformationFieldWidget(
                              onChanged: (value) => onUpdatePayload(
                                  payload.copyWith(
                                      weight: int.tryParse(value.toString()))),
                              type: UpdateInformationType.weight,
                              suffixText: 'kg',
                              textInputType: TextInputType.number,
                              controller: weightCtrl,
                            ),
                          ),
                        ],
                      ),

                    /// Nhóm Máu - Tình Trạng Hôn Nhân
                    if (!AppConstants.notRelease)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: SearchInputInformationWidget<BloodGroup>(
                              type: UpdateInformationType.bloodType,
                              initialValue: bloodGroup != null
                                  ? SuggestionsField(
                                      name: bloodGroup?.name ?? '',
                                      data: bloodGroup!)
                                  : null,
                              // currentValue: bloodGroup?.name,
                              onSelected: (value) => onUpdatePayload(
                                  payload.copyWith(bloodGroup: value?.id)),
                              suggestions:
                                  (dataInfo?.bloodGroups?.reversed ?? [])
                                      .map((e) => SuggestionsField(
                                          name: e.name ?? '', data: e))
                                      .toList(),
                            ),
                          ),
                          _buildSpacerBetweenFields(),
                          Expanded(
                            child: SearchInputInformationWidget<MaritalStatus>(
                              type: UpdateInformationType.relationshipStatus,
                              initialValue: maritalStatus != null
                                  ? SuggestionsField(
                                      name: maritalStatus?.name ?? '',
                                      data: maritalStatus!)
                                  : null,
                              onSelected: (value) => onUpdatePayload(
                                  payload.copyWith(maritalStatus: value?.key)),
                              suggestions: (dataInfo?.maritalStatus ?? [])
                                  .map((e) => SuggestionsField(
                                      name: e.name ?? '', data: e))
                                  .toList(),
                            ),
                          ),
                        ],
                      ),

                    /// Học vấn hiện tại
                    if (!AppConstants.notRelease)
                      SearchInputInformationWidget<AcademicLevel>(
                        type: UpdateInformationType.academicLevel,
                        onSelected: (value) => onUpdatePayload(
                            payload.copyWith(academicLevel: value?.key)),
                        initialValue: academicLevel != null
                            ? SuggestionsField(
                                name: academicLevel?.name ?? '',
                                data: academicLevel!)
                            : null,
                        suggestions: (dataInfo?.academicLevels?.reversed ?? [])
                            .map((e) =>
                                SuggestionsField(name: e.name ?? '', data: e))
                            .toList(),
                      ),

                    /// Nghề Nghiệp
                    if (!AppConstants.notRelease)
                      SearchInputInformationWidget<Job>(
                        type: UpdateInformationType.career,
                        initialValue: job != null
                            ? SuggestionsField(
                                name: job?.name ?? '', data: job!)
                            : null,
                        onSelected: (value) =>
                            onUpdatePayload(payload.copyWith(job: value?.key)),
                        suggestions: (dataInfo?.jobs?.reversed ?? [])
                            .map((e) =>
                                SuggestionsField(name: e.name ?? '', data: e))
                            .toList(),
                      ),

                    /// Sở Thích
                    if (!AppConstants.notRelease)
                      SearchInputInformationWidget<Interest>(
                        type: UpdateInformationType.hobby,
                        initialValue: interest != null
                            ? SuggestionsField(
                                name: interest?.name ?? '', data: interest!)
                            : null,
                        onSelected: (value) => onUpdatePayload(
                            payload.copyWith(interest: value?.key)),
                        suggestions: (dataInfo?.interests?.reversed ?? [])
                            .map((e) =>
                                SuggestionsField(name: e.name ?? '', data: e))
                            .toList(),
                      ),

                    /// Năng Khiếu
                    if (!AppConstants.notRelease)
                      SearchInputInformationWidget<Talent>(
                        type: UpdateInformationType.gifted,
                        initialValue: talent != null
                            ? SuggestionsField(
                                name: talent?.name ?? '', data: talent!)
                            : null,
                        onSelected: (value) => onUpdatePayload(
                            payload.copyWith(talent: value?.key)),
                        suggestions: (dataInfo?.talents?.reversed ?? [])
                            .map((e) =>
                                SuggestionsField(name: e.name ?? '', data: e))
                            .toList(),
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
      ),
    );
  }

  Widget _buildSpacerBetweenFields() {
    return const SizedBox(width: 10);
  }
}
