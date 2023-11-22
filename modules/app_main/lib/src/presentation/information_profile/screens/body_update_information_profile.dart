import 'package:app_core/app_core.dart';
import 'package:app_main/src/blocs/user/user_cubit.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/domain/entities/bank.dart';
import 'package:app_main/src/domain/entities/update_account/infomation_pdone_profile.dart';
import 'package:app_main/src/domain/entities/update_account/information_none_pdone_profile.dart';
import 'package:app_main/src/domain/entities/update_account/upgrade_account.dart';
import 'package:app_main/src/presentation/information_profile/bloc/bloc/information_update_profil_bloc.dart';
import 'package:app_main/src/presentation/information_profile/bloc/cubit/information_pdone_profile_cubit.dart';
import 'package:app_main/src/presentation/information_profile/bloc/place_information_2/place_information_2_bloc.dart';
import 'package:app_main/src/presentation/information_profile/screens/body_information_profile.dart';
import 'package:app_main/src/presentation/information_profile/screens/information_profile_screen.dart';
import 'package:app_main/src/presentation/information_profile/widgets/bank_dropdown.dart';
import 'package:app_main/src/presentation/information_profile/widgets/bloodtype_dropdown.dart';
import 'package:app_main/src/presentation/information_profile/widgets/provinces_dropdown.dart';
import 'package:app_main/src/presentation/information_profile/widgets/district_dropdown.dart';
import 'package:app_main/src/presentation/information_profile/widgets/education_dropdown.dart';
import 'package:app_main/src/presentation/information_profile/widgets/gender_dropdown.dart';
import 'package:app_main/src/presentation/information_profile/widgets/marital_status_dropdown.dart';
import 'package:app_main/src/presentation/information_profile/widgets/countries_dropdown.dart';
import 'package:app_main/src/presentation/information_profile/widgets/protector_dropdown.dart';
import 'package:app_main/src/presentation/information_profile/widgets/update_information_profile_mixin.dart';
import 'package:app_main/src/presentation/information_profile/widgets/ward_dropdown.dart';
import 'package:app_main/src/presentation/marshop/widgets/gradiant_button.dart';
import 'package:app_main/src/presentation/shared/extensions/validation_extension.dart';
import 'package:app_main/src/presentation/upgrade_account/place_information_constant.dart';
import 'package:app_main/src/presentation/upgrade_account/upgrade_ja/upgrade_agree_policy.bloc.dart';
import 'package:app_main/src/presentation/upgrade_account/upgrade_pdone/bloc/place_information/place_information_bloc.dart';
import 'package:app_main/src/presentation/upgrade_account/upgrade_pdone/bloc/upgrade_pdone/upgrade_pdone_bloc.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:intl/intl.dart';
import 'package:localization/generated/l10n.dart';
import 'package:mobilehub_bloc/mobilehub_bloc.dart';
import 'package:ui/ui.dart';

class BodyUpdateInformationProfile extends StatefulWidget {
  final UserCubit userCubit;
  final User authInfo;
  final bool isEdit;
  final InformationNonePdoneProfile? informationNonePdoneProfile;
  const BodyUpdateInformationProfile({
    super.key,
    required this.userCubit,
    required this.authInfo,
    required this.isEdit,
    this.informationNonePdoneProfile,
  });

  @override
  State<BodyUpdateInformationProfile> createState() => _BodyUpdateInformationProfileState();
}

class _BodyUpdateInformationProfileState extends State<BodyUpdateInformationProfile>
    with ValidationMixin, UpdateInformationProfileMixin, AutomaticKeepAliveClientMixin {
  final _phoneCtrl = TextEditingController();

  bool isFirstTimeOne = false;
  bool isFirstTimeTwo = false;

  DateTime? tempDate;
  late final informationCubit = context.read<InformationPdoneProfileCubit>();
  late final upgradePDoneBloc = context.read<UpgradePDoneBloc>();
  late final getListBankBloc = context.read<GetListBanksBloc>();
  late final placeInformationBloc = context.read<PlaceInformationBloc>();
  late final placeInformationBloc2 = context.read<PlaceInformationBloc2>();
  late final updateInformationBloc = context.read<InformationUpdateProfilBloc>();

  @override
  bool get wantKeepAlive => true;

  void _listenerInformations(BuildContext context, UpgradePDoneState state) {
    if (state is GetListMasterLoading) {
      showLoading();
    }

    if (state is GetListMasterSuccess) {
      hideLoading();
      protectorsChanged.value = state.upgradeAccount.protectors ?? [];
      gendersChanged.value = state.upgradeAccount.genders ?? [];
      maritalsChanged.value = state.upgradeAccount.maritalStatus ?? [];
      jobsChanged.value = state.upgradeAccount.jobs ?? [];
      bloodTypesChanged.value = state.upgradeAccount.bloodGroups ?? [];
      educationsChanged.value = state.upgradeAccount.academicLevels ?? [];
      hobbiesChanged.value = state.upgradeAccount.interests ?? [];
      talentsChanged.value = state.upgradeAccount.talents ?? [];
    }

    if (state is GetListMasterFailure) {
      hideLoading();
    }
  }

  void _listenerPlaces(BuildContext context, PlaceInformationState state) {
    if (state is PlaceInformationInitial) {
      countriesChanged.value = state.countries;
      if (!isFirstTimeOne) {
        currentCountry = state.countries!.first;
        placeInformationBloc.add(GetListProvincesEvent(state.countries!.first.iso2!));
      }
    }

    if (state is GetListProvincesSuccess) {
      provincesChanged.value = state.provinces;
      if (!isFirstTimeOne) {
        currentProvince = state.provinces!.first;
        placeInformationBloc
            .add(GetDistrictsByProvinceEvent(state.countries!.first.iso2!, state.provinces!.first.stateCode));
      }
    }

    if (state is GetDistrictsSuccess) {
      districtsChanged.value = state.districts;
      if (!isFirstTimeOne) {
        currentDistrict = state.districts!.first;
        placeInformationBloc.add(GetWardsByDistrictEvent(
            state.countries!.first.iso2!, state.provinces!.first.stateCode, state.districts!.first.code!));
      }
    }

    if (state is GetWardsSuccess) {
      wardsChanged.value = state.wards;
      if (!isFirstTimeOne) {
        currentWard = state.wards!.first;
        isFirstTimeOne = true;
      }
    }
  }

  void _listenerPlaces2(BuildContext context, PlaceInformationState2 state) {
    if (state is PlaceInformationInitial2) {
      countries2Changed.value = state.countries;
      if (!isFirstTimeTwo) {
        currentCountry2 = state.countries!.first;
        placeInformationBloc2.add(GetListProvincesEvent2(state.countries!.first.iso2!));
      }
    }

    if (state is GetListProvincesSuccess2) {
      provinces2Changed.value = state.provinces;
      if (!isFirstTimeTwo) {
        currentProvince2 = state.provinces!.first;
        placeInformationBloc2
            .add(GetDistrictsByProvinceEvent2(state.countries!.first.iso2!, state.provinces!.first.stateCode));
      }
    }

    if (state is GetDistrictsSuccess2) {
      districts2Changed.value = state.districts;
      if (!isFirstTimeTwo) {
        currentDistrict2 = state.districts!.first;
        placeInformationBloc2.add(GetWardsByDistrictEvent2(
            state.countries!.first.iso2!, state.provinces!.first.stateCode, state.districts!.first.code!));
      }
    }

    if (state is GetWardsSuccess2) {
      wards2Changed.value = state.wards;
      if (!isFirstTimeTwo) {
        currentWard2 = state.wards!.first;
        isFirstTimeTwo = true;
      }
    }
  }

  @override
  void initState() {
    if (widget.informationNonePdoneProfile != null) {
      if (widget.informationNonePdoneProfile!.birthday.isNotEmpty) {
        tempDate = DateFormat("yyyy-MM-dd").parse(widget.informationNonePdoneProfile!.birthday);
      }
    }

    upgradePDoneBloc.add(GetListMasterEvent());
    getListBankBloc.add(GetListDataEvent());
    placeInformationBloc.add(UserClearCountryEvent());
    placeInformationBloc2.add(UserClearCountryEvent2());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 25),
      child: AutoHideKeyboard(
        child: BlocConsumer<UpgradePDoneBloc, UpgradePDoneState>(
          listener: _listenerInformations,
          builder: (_, state) {
            return BlocListener<GetListBanksBloc, GetListState>(
              listener: (_, state) {
                if (state is GetListDataSuccess<Bank>) {
                  banksChanged.value = state.data;
                  LoggerService.print("Banks: $banksChanged");
                }
              },
              child: BlocConsumer<InformationUpdateProfilBloc, InformationUpdateProfilState>(
                listener: (_, state) {
                  if (state is InformationUpdateProfilLoading) {
                    showLoading();
                  }

                  if (state is InformationNoneUpdateProfilSuccess) {
                    hideLoading();
                    showToastMessage("Nâng cấp tài khoản thành công");
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const InformationProfileScreen()),
                    );
                  }
                  if (state is InformationUpdateProfilFailed) {
                    hideLoading();
                    showToastMessage(state.message!, ToastMessageType.error);
                  }
                },
                builder: (context, state) {
                  return SingleChildScrollView(
                    child: validationFormBuilder(
                      child: Column(
                        children: [
                          _buildToolbar(),
                          const SizedBox(height: 20),
                          Container(height: 20, color: AppColors.bgColor),
                          _buildFieldInformation(),
                          Container(height: 20, color: AppColors.bgColor),
                          _buildFieldIdentifierInformation(),
                          Container(height: 20, color: AppColors.bgColor),
                          if (tempDate != null && widget.isEdit && widget.authInfo.getIsPDone) ...[
                            (widget.authInfo.isUnderFifteen(tempDate)) ? _buildProtectorInformation() : Container(),
                          ],
                          if (tempDate != null && widget.isEdit && widget.authInfo.getIsPDone) ...[
                            (widget.authInfo.isUnderFifteen(tempDate))
                                ? Container(height: 20, color: AppColors.bgColor)
                                : Container(),
                          ],
                          _buildBankInformation(),
                          Container(height: 20, color: AppColors.bgColor),
                          _buildMoreInformation(),
                          _buildButtonUpdate(context),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildButtonUpdate(BuildContext context) {
    return validationListenableBuilder(
      builder: (isValid) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
          child: PrimaryButton(
            disabled: !isValid,
            onTap: () => widget.authInfo.getIsPDone
                ? updateInformationBloc.add(InformationUpdateProfilEvent(passPdonePayload()))
                : updateInformationBloc.add(InformationNoneUpdateProfilEvent(passNonePDonePayload())),
            height: 45,
            title: 'Cập nhật',
            width: MediaQuery.of(context).size.width,
          ),
        );
      },
    );
  }

  Widget _buildFieldInformation() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Thông tin cá nhân",
            style: TextStyle(
              color: AppColors.black,
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
          (widget.isEdit && widget.authInfo.getIsPDone)
              ? Row(
                  children: [
                    Expanded(
                      child: InformationFieldWidget(
                        required: true,
                        shouldEnabled: false,
                        controller: firstNameTxtController,
                        type: UpdateInformationType.firstName,
                        validator: (value) => context.validateEmptyInfo(
                          firstNameTxtController.text,
                          'Vui lòng nhập họ',
                        ),
                        onChanged: (value) {
                          firstName = value!;
                          onValidation();
                        },
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: InformationFieldWidget(
                        required: false,
                        shouldEnabled: false,
                        controller: middleNameTxtController,
                        type: UpdateInformationType.middleName,
                        validator: (value) => context.validateEmptyInfo(
                          middleNameTxtController.text,
                          'Vui lòng nhập tên đệm',
                        ),
                        onChanged: (value) {
                          middleName = value!;
                          onValidation();
                        },
                      ),
                    )
                  ],
                )
              : InformationFieldWidget(
                  required: true,
                  shouldEnabled: true,
                  controller: fullNameTxtController,
                  type: UpdateInformationType.fullName,
                  validator: (value) => context.validateEmptyInfo(
                    fullNameTxtController.text,
                    'Vui lòng nhập họ và tên',
                  ),
                  onChanged: (value) {
                    fullName = value!;
                    onValidation();
                  },
                ),
          (widget.isEdit && widget.authInfo.getIsPDone)
              ? InformationFieldWidget(
                  required: true,
                  shouldEnabled: false,
                  controller: lastNameTxtController,
                  type: UpdateInformationType.lastName,
                  validator: (value) => context.validateEmptyInfo(
                    lastNameTxtController.text,
                    'Vui lòng nhập tên',
                  ),
                  onChanged: (value) {
                    lastName = value!;
                    onValidation();
                  },
                )
              : Container(),
          //Nick name
          InformationFieldWidget(
            required: true,
            shouldEnabled: true,
            maxLength: 24,
            controller: nickNameTxtController,
            onChanged: (String? value) {
              nickName = value!;
              onValidation();
            },
            type: UpdateInformationType.nickName,
            validator: (value) => context.validateNicknameInfo(
              nickNameTxtController.text,
              'Vui lòng nhập nick name',
            ),
          ),
          (widget.isEdit && widget.authInfo.getIsPDone) ? Container() : const SizedBox(height: 3),
          (widget.isEdit && widget.authInfo.getIsPDone)
              ? Row(
                  children: [
                    Expanded(
                      child: InformationFieldWidget(
                        required: true,
                        shouldEnabled: false,
                        hintText: widget.informationNonePdoneProfile!.sex.genderToString,
                        controller: lastNameTxtController,
                        type: UpdateInformationType.gender,
                        validator: (value) {},
                        onChanged: (value) {},
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: InformationFieldWidget(
                        required: true,
                        shouldEnabled: false,
                        hintText: widget.informationNonePdoneProfile!.birthday,
                        controller: lastNameTxtController,
                        type: UpdateInformationType.birthDay,
                        validator: (value) {},
                        onChanged: (value) {},
                      ),
                    )
                  ],
                )
              : Row(
                  children: [
                    Expanded(
                        child: ValueListenableBuilder(
                      builder: (_, genderValue, __) {
                        if (genderValue.isNotEmpty) {
                          return GenderDropdown(
                            required: true,
                            genders: genderValue,
                            onChange: (sex) {
                              genderParam = sex;
                            },
                          );
                        }
                        return GenderDropdown(
                          required: true,
                          genders: genders,
                          onChange: (sex) {
                            genderParam = sex;
                          },
                        );
                      },
                      valueListenable: gendersChanged,
                    )),
                    const SizedBox(width: 20),
                    Expanded(
                      child: ValueListenableBuilder(
                        builder: (_, dateTimeValue, __) {
                          return InformationLayoutFieldWidget(
                            required: true,
                            label: UpdateInformationType.birthDay.title(context),
                            child: InputDateTimeWidget(
                              hintText: 'Ngày sinh',
                              useHorizontalLayout: true,
                              enabled: true,
                              radius: 17,
                              date: dateTimeValue,
                              formatText: (date) => S.of(context).formatDateDDmmYYYYhhMM(date, date).split('|').first,
                              max: DateTime.now(),
                              onChange: (dateTime) {
                                birthDay = dateTime!;
                                onValidation();
                              },
                            ),
                          );
                        },
                        valueListenable: birthDayChanged,
                      ),
                    ),
                  ],
                ),

          //Email
          InformationFieldWidget(
            required: true,
            shouldEnabled: true,
            controller: emailAddressTxtController,
            onChanged: (String? value) {
              onValidation();
            },
            type: UpdateInformationType.email,
            validator: (value) => context.validateEmailInfo(
              emailAddressTxtController.text,
              'Địa chỉ email không hợp lệ',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProtectorInformation() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Thông tin người bảo hộ",
            style: TextStyle(
              color: AppColors.black,
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 20),
          //Người bảo hộ
          ValueListenableBuilder(
            builder: (_, protectorsValue, __) {
              if (protectorsValue.isNotEmpty) {
                return ProtectorDropdown(
                  required: true,
                  protectors: protectorsValue,
                  onChange: (protector) {
                    protectorID = protector;
                  },
                );
              }
              return Container();
            },
            valueListenable: protectorsChanged,
          ),

          /// ID Pdone
          InformationFieldWidget(
            required: true,
            shouldEnabled: true,
            controller: idPDoneProtectorTxtController,
            onChanged: (String? value) {
              onValidation();
            },
            type: UpdateInformationType.pDoneID,
            validator: (value) => context.validateEmptyInfo(
              idPDoneProtectorTxtController.text,
              'Vui lòng nhập ID Pdone',
            ),
          ),
          const SizedBox(height: 16),
          Text(
            S.current.lbl_Phone.capitalize(),
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Color(0xFF212121),
              height: 20 / 14,
              leadingDistribution: TextLeadingDistribution.even,
            ),
          ),
          const SizedBox(height: 5),
          AppPhoneInput(
            controller: _phoneCtrl,
            onChange: (value) => onValidation(),
            onPhoneCodeChange: (value) {
              if (value.dialCode != null) {
                phoneCode = value.dialCode!;
                debugPrint("$value");
              }
            },
          ),
          //CCCD
          InformationFieldWidget(
            required: true,
            shouldEnabled: true,
            controller: idNumberProtectorTxtController,
            onChanged: (String? value) {
              onValidation();
            },
            type: UpdateInformationType.idNumber,
            validator: (value) => widget.authInfo.isUnderFifteen(tempDate)
                ? context.validateCCCD(idNumberProtectorTxtController.text, 'Thông tin không hợp lệ')
                : null,
          ),
        ],
      ),
    );
  }

  Widget _buildBankInformation() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Thông tin ngân hàng",
            style: TextStyle(
              color: AppColors.black,
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 20),
          ValueListenableBuilder(
            builder: (_, banksValue, __) {
              if (banksValue.isNotEmpty) {
                return BankDropdown(
                  required: true,
                  banks: banksValue,
                  onChange: (bank) {
                    bankParam = bank;
                  },
                );
              }
              return Container();
            },
            valueListenable: banksChanged,
          ),
          InformationFieldWidget(
            required: true,
            shouldEnabled: true,
            controller: bankNumberTxtController,
            onChanged: (String? value) {
              onValidation();
            },
            type: UpdateInformationType.bankNumber,
            validator: (value) => context.validateEmptyInfo(
              bankNumberTxtController.text,
              'Vui lòng nhập số tài khoản',
            ),
          ),
          InformationFieldWidget(
            required: true,
            shouldEnabled: true,
            controller: bankAccountHolderTxtController,
            onChanged: (String? value) {
              onValidation();
            },
            type: UpdateInformationType.bankAccountHolder,
            validator: (value) => context.validateEmptyInfo(
              bankAccountHolderTxtController.text,
              'Vui lòng nhập tên chủ tài khoản',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMoreInformation() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Thông tin thêm",
            style: TextStyle(
              color: AppColors.black,
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 20),
          ValueListenableBuilder(
            builder: (_, educationsValue, __) {
              if (educationsValue.isNotEmpty) {
                return EducationDropdown(
                  educations: educationsValue,
                  required: false,
                  onChange: (edu) {
                    eduParam = edu;
                  },
                );
              }
              return Container();
            },
            valueListenable: educationsChanged,
          ),
          const SizedBox(height: 20),
          const Text(
            "Nghề nghiệp",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Color(0xFF212121),
              height: 20 / 14,
              leadingDistribution: TextLeadingDistribution.even,
            ),
          ),
          const SizedBox(height: 7),
          Autocomplete<AutocompleteOption>(
            optionsBuilder: (TextEditingValue textEditingValue) {
              if (textEditingValue.text.isEmpty) {
                return const Iterable<AutocompleteOption>.empty();
              }

              var filteredAndSortedJobs = jobsChanged.value
                  .where((element) => element.name!.contains(textEditingValue.text.toLowerCase()))
                  .map((job) => AutocompleteOption(
                        displayText: job.name!,
                        key: job.key!,
                      ))
                  .toList();

              filteredAndSortedJobs.sort((a, b) => a.displayText!.compareTo(b.displayText!));

              return filteredAndSortedJobs;
            },
            onSelected: (AutocompleteOption itemSelected) {
              jobParam = itemSelected.key!;
            },
            displayStringForOption: (option) => option.displayText!,
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: ValueListenableBuilder(
                  builder: (_, bloodTypesValue, __) {
                    // if (bloodTypesValue.isNotEmpty) {
                    //   return BloodTypeDropDown(
                    //     required: false,
                    //     bloodTypes: bloodTypesValue,
                    //     onChange: (bloodType) {
                    //       bloodTypeParam = bloodType;
                    //     },
                    //   );
                    // }
                    return Container();
                  },
                  valueListenable: bloodTypesChanged,
                ),
              ),
              const SizedBox(width: 20),
              // Expanded(
              //   child: ValueListenableBuilder(
              //     builder: (_, maritalsValue, __) {
              //       if (maritalsValue.isNotEmpty) {
              //         return MaritalStatusDropDown(
              //           required: false,
              //           maritals: maritalsValue,
              //           onChange: (marital) {
              //             martialStatusParam = marital;
              //           },
              //         );
              //       }
              //       return Container();
              //     },
              //     valueListenable: maritalsChanged,
              //   ),
              // ),
            ],
          ),
          const SizedBox(height: 15),
          const Text(
            "Năng khiếu",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Color(0xFF212121),
              height: 20 / 14,
              leadingDistribution: TextLeadingDistribution.even,
            ),
          ),
          const SizedBox(height: 7),
          Autocomplete<AutocompleteOption>(
            optionsBuilder: (TextEditingValue textEditingValue) {
              if (textEditingValue.text.isEmpty) {
                return const Iterable<AutocompleteOption>.empty();
              }

              var filteredAndSortedTalents = talentsChanged.value
                  .where((element) => element.name!.contains(textEditingValue.text.toLowerCase()))
                  .map((talent) => AutocompleteOption(
                        displayText: talent.name!,
                        key: talent.key!,
                      ))
                  .toList();

              filteredAndSortedTalents.sort((a, b) => a.displayText!.compareTo(b.displayText!));

              return filteredAndSortedTalents;
            },
            onSelected: (AutocompleteOption itemSelected) {
              talentParam = itemSelected.key!;
            },
            displayStringForOption: (option) => option.displayText!,
          ),
          const SizedBox(height: 15),
          const Text(
            "Sở thích",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Color(0xFF212121),
              height: 20 / 14,
              leadingDistribution: TextLeadingDistribution.even,
            ),
          ),
          const SizedBox(height: 7),
          Autocomplete<AutocompleteOption>(
            optionsBuilder: (TextEditingValue textEditingValue) {
              if (textEditingValue.text.isEmpty) {
                return const Iterable<AutocompleteOption>.empty();
              }

              var filteredAndSortedInterests = hobbiesChanged.value
                  .where((element) => element.name!.contains(textEditingValue.text.toLowerCase()))
                  .map((hobbie) => AutocompleteOption(
                        displayText: hobbie.name!,
                        key: hobbie.key!,
                      ))
                  .toList();

              filteredAndSortedInterests.sort((a, b) => a.displayText!.compareTo(b.displayText!));

              return filteredAndSortedInterests;
            },
            onSelected: (AutocompleteOption itemSelected) {
              hobbyParam = itemSelected.key!;
            },
            displayStringForOption: (option) => option.displayText!,
          ),
        ],
      ),
    );
  }

  Widget _buildFieldIdentifierInformation() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Xác thực danh tính",
            style: TextStyle(
              color: AppColors.black,
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "Địa chỉ thường trú",
            style: TextStyle(
              color: AppColors.black,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          BlocListener<PlaceInformationBloc, PlaceInformationState>(
            listener: _listenerPlaces,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    children: [
                      //Quốc gia
                      Expanded(
                        child: ValueListenableBuilder(
                          builder: (_, countriesValue, __) {
                            if (countriesValue!.isNotEmpty) {
                              return CountriesDropdown(
                                required: true,
                                countries: countriesValue,
                                onChange: (country) {
                                  currentCountry = country;
                                  placeInformationBloc.add(GetListProvincesEvent(country.iso2!));
                                },
                              );
                            }
                            return CountriesDropdown(
                              required: true,
                              countries: countries,
                              onChange: (country) {
                                currentCountry = country;
                                placeInformationBloc.add(GetListProvincesEvent(country.iso2!));
                              },
                            );
                          },
                          valueListenable: countriesChanged,
                        ),
                      ),
                      const SizedBox(width: 20),
                      //Tỉnh thành
                      Expanded(
                        child: ValueListenableBuilder(
                          builder: (_, provincesValue, __) {
                            if (provincesValue!.isNotEmpty) {
                              return ProvinceDropDown(
                                required: true,
                                provinces: provincesValue,
                                onChange: (province) {
                                  currentProvince = province;
                                  placeInformationBloc
                                      .add(GetDistrictsByProvinceEvent(currentCountry!.iso2!, province.stateCode!));
                                },
                              );
                            }
                            return ProvinceDropDown(
                              required: true,
                              provinces: provinces,
                              onChange: (province) {
                                currentProvince = province;
                                placeInformationBloc
                                    .add(GetDistrictsByProvinceEvent(currentCountry!.iso2!, province.stateCode!));
                              },
                            );
                          },
                          valueListenable: provincesChanged,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    children: [
                      //Quận/huyện
                      Expanded(
                        child: ValueListenableBuilder(
                          builder: (_, districtsValue, __) {
                            if (districtsValue!.isNotEmpty) {
                              return DistrictDropDown(
                                required: true,
                                districts: districtsValue,
                                onChange: (district) {
                                  currentDistrict = district;
                                  placeInformationBloc.add(GetWardsByDistrictEvent(
                                      currentCountry!.iso2!, currentProvince!.stateCode!, district.code!));
                                },
                              );
                            }
                            return DistrictDropDown(
                              required: true,
                              districts: districts,
                              onChange: (district) {
                                currentDistrict = district;
                                placeInformationBloc.add(GetWardsByDistrictEvent(
                                    currentCountry!.iso2!, currentProvince!.stateCode!, district.code!));
                              },
                            );
                          },
                          valueListenable: districtsChanged,
                        ),
                      ),
                      const SizedBox(width: 20),
                      //Phường/xã
                      Expanded(
                        child: ValueListenableBuilder(
                          builder: (_, wardsValue, __) {
                            if (wardsValue!.isNotEmpty) {
                              return WardDropDown(
                                required: true,
                                wards: wardsValue,
                                onChange: (ward) {
                                  currentWard = ward;
                                },
                              );
                            }
                            return WardDropDown(
                              required: true,
                              wards: wards,
                              onChange: (ward) {
                                currentWard = ward;
                              },
                            );
                          },
                          valueListenable: wardsChanged,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          //------------------------------------------>
          const SizedBox(height: 20),
          const Text(
            "Địa chỉ hiện tại",
            style: TextStyle(
              color: AppColors.black,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          BlocListener<PlaceInformationBloc2, PlaceInformationState2>(
            listener: _listenerPlaces2,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    children: [
                      //Quốc gia
                      Expanded(
                        child: ValueListenableBuilder(
                          builder: (_, countriesValue, __) {
                            if (countriesValue!.isNotEmpty) {
                              return CountriesDropdown(
                                required: true,
                                countries: countriesValue,
                                onChange: (country) {
                                  currentCountry2 = country;
                                  placeInformationBloc2.add(GetListProvincesEvent2(country.iso2!));
                                },
                              );
                            }
                            return CountriesDropdown(
                              required: true,
                              countries: countries,
                              onChange: (country) {
                                currentCountry2 = country;
                                placeInformationBloc2.add(GetListProvincesEvent2(country.iso2!));
                              },
                            );
                          },
                          valueListenable: countries2Changed,
                        ),
                      ),
                      const SizedBox(width: 20),
                      //Tỉnh thành
                      Expanded(
                        child: ValueListenableBuilder(
                          builder: (_, provincesValue, __) {
                            if (provincesValue!.isNotEmpty) {
                              return ProvinceDropDown(
                                required: true,
                                provinces: provincesValue,
                                onChange: (province) {
                                  currentProvince2 = province;
                                  placeInformationBloc2
                                      .add(GetDistrictsByProvinceEvent2(currentCountry2!.iso2!, province.stateCode!));
                                },
                              );
                            }
                            return ProvinceDropDown(
                              required: true,
                              provinces: provinces,
                              onChange: (province) {
                                currentProvince2 = province;
                                placeInformationBloc2
                                    .add(GetDistrictsByProvinceEvent2(currentCountry2!.iso2!, province.stateCode!));
                              },
                            );
                          },
                          valueListenable: provinces2Changed,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    children: [
                      //Quận/huyện
                      Expanded(
                        child: ValueListenableBuilder(
                          builder: (_, districtsValue, __) {
                            if (districtsValue!.isNotEmpty) {
                              return DistrictDropDown(
                                required: true,
                                districts: districtsValue,
                                onChange: (district) {
                                  currentDistrict2 = district;
                                  placeInformationBloc2.add(GetWardsByDistrictEvent2(
                                      currentCountry2!.iso2!, currentProvince2!.stateCode!, district.code!));
                                },
                              );
                            }
                            return DistrictDropDown(
                              required: true,
                              districts: districts,
                              onChange: (district) {
                                currentDistrict2 = district;
                                placeInformationBloc2.add(GetWardsByDistrictEvent2(
                                    currentCountry2!.iso2!, currentProvince2!.stateCode!, district.code!));
                              },
                            );
                          },
                          valueListenable: districts2Changed,
                        ),
                      ),
                      const SizedBox(width: 20),
                      //Phường/xã
                      Expanded(
                        child: ValueListenableBuilder(
                          builder: (_, wardsValue, __) {
                            if (wardsValue!.isNotEmpty) {
                              return WardDropDown(
                                required: true,
                                wards: wardsValue,
                                onChange: (ward) {
                                  currentWard2 = ward;
                                },
                              );
                            }
                            return WardDropDown(
                              required: true,
                              wards: wards,
                              onChange: (ward) {
                                currentWard2 = ward;
                              },
                            );
                          },
                          valueListenable: wards2Changed,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          //Address
          InformationFieldWidget(
            required: true,
            shouldEnabled: true,
            controller: addressTxtController,
            type: UpdateInformationType.address,
            validator: (value) => context.validateEmptyInfo(
              addressTxtController.text,
              'Vui lòng nhập địa chỉ cụ thể',
            ),
            onChanged: (String? value) {
              address = value!;
              onValidation();
            },
          ),
          Row(
            children: [
              Expanded(
                child: InformationFieldWidget(
                  required: true,
                  shouldEnabled: true,
                  controller: idNumberTxtController,
                  type: UpdateInformationType.idNumber,
                  validator: (value) => context.validateEmptyInfo(
                    idNumberTxtController.text,
                    'Vui lòng nhập số ID/CCCD/HC',
                  ),
                  onChanged: (String? value) {
                    idNumber = value!;
                  },
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: ValueListenableBuilder(
                  builder: (_, dateTimeValue, __) {
                    return InformationLayoutFieldWidget(
                      required: true,
                      label: UpdateInformationType.dateOfIdNumber.title(context),
                      child: InputDateTimeWidget(
                        hintText: 'Ngày cấp',
                        useHorizontalLayout: true,
                        enabled: true,
                        radius: 17,
                        date: dateTimeValue,
                        formatText: (date) => S.of(context).formatDateDDmmYYYYhhMM(date, date).split('|').first,
                        max: DateTime.now(),
                        onChange: (dateTime) {
                          supplyDate = dateTime!;
                        },
                      ),
                    );
                  },
                  valueListenable: supplyDateChanged,
                ),
              ),
            ],
          ),

          //Nơi cấp
          InformationFieldWidget(
            required: true,
            shouldEnabled: true,
            controller: placeOfNumberTxtController,
            type: UpdateInformationType.placeofIdNumber,
            validator: (value) => context.validateEmptyInfo(
              placeOfNumberTxtController.text,
              'Vui lòng nhập nơi cấp',
            ),
            onChanged: (String? value) {
              placeOfNumber = value!;
              onValidation();
            },
          ),
        ],
      ),
    );
  }

  Stack _buildToolbar() {
    return Stack(
      children: [
        Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 180,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.blue16,
                        AppColors.blue11,
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 5,
                  right: 5,
                  child: ImageWidget(
                    ImageConstants.imageCamera,
                    width: 35,
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: 100,
              decoration: const BoxDecoration(
                color: AppColors.white,
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 130,
                    width: 130,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.white,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(120),
                    ),
                    child: ClipRRect(
                      child: ImageWidget(
                        ImageConstants.defaultUserAvatar,
                        borderRadius: 100,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 5,
                    child: ImageWidget(
                      ImageConstants.imageType,
                      width: 30,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.authInfo.getdisplayName,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(width: 5),
                    widget.authInfo.getIsJA
                        ? Container(
                            width: 30,
                            height: 16,
                            decoration: BoxDecoration(
                              color: AppColors.blue32,
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            alignment: Alignment.center,
                            child: const Text(
                              "JA",
                              style: TextStyle(
                                color: AppColors.white,
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
              Visibility.maintain(
                visible: widget.authInfo.getIsHasNickname,
                child: Text(
                  widget.authInfo.getNickname,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: AppColors.grey15,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "ID: ${widget.authInfo.pDoneId}",
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
