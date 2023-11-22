import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/data/models/payloads/user/user_action_payload.dart';
import 'package:app_main/src/domain/entities/bank.dart';
import 'package:app_main/src/domain/entities/update_account/place/country.dart';
import 'package:app_main/src/domain/entities/update_account/place/district.dart';
import 'package:app_main/src/domain/entities/update_account/place/province.dart';
import 'package:app_main/src/domain/entities/update_account/place/ward.dart';
import 'package:app_main/src/domain/entities/update_account/update_place_information_payload.dart';
import 'package:app_main/src/domain/entities/update_account/upgrade_account.dart';
import 'package:app_main/src/presentation/information_profile/bloc/place_information_2/place_information_2_bloc.dart';
import 'package:app_main/src/presentation/information_profile/widgets/bank_dropdown.dart';
import 'package:app_main/src/presentation/information_profile/widgets/bloodtype_dropdown.dart';
import 'package:app_main/src/presentation/information_profile/widgets/countries_dropdown.dart';
import 'package:app_main/src/presentation/information_profile/widgets/district_dropdown.dart';
import 'package:app_main/src/presentation/information_profile/widgets/education_dropdown.dart';
import 'package:app_main/src/presentation/information_profile/widgets/gender_dropdown.dart';
import 'package:app_main/src/presentation/information_profile/widgets/marital_status_dropdown.dart';
import 'package:app_main/src/presentation/information_profile/widgets/provinces_dropdown.dart';
import 'package:app_main/src/presentation/information_profile/widgets/update_information_profile_mixin.dart';
import 'package:app_main/src/presentation/information_profile/widgets/ward_dropdown.dart';
import 'package:app_main/src/presentation/otp_verify/email_otp_verify.dart';
import 'package:app_main/src/presentation/otp_verify/email_verify_confirm_dialog.dart';
import 'package:app_main/src/presentation/profile/state/user_profile_bloc.dart';
import 'package:app_main/src/presentation/shared/extensions/validation_extension.dart';
import 'package:app_main/src/presentation/upgrade_account/place_information_constant.dart';
import 'package:app_main/src/presentation/upgrade_account/upgrade_ja/upgrade_agree_policy.bloc.dart';
import 'package:app_main/src/presentation/upgrade_account/upgrade_pdone/bloc/place_information/place_information_bloc.dart';
import 'package:app_main/src/presentation/upgrade_account/upgrade_pdone/bloc/upgrade_pdone/upgrade_pdone_bloc.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:localization/generated/l10n.dart';
import 'package:mobilehub_bloc/mobilehub_bloc.dart';
import 'package:ui/ui.dart';

class EditProfileEmpty extends StatefulWidget {
  const EditProfileEmpty({
    super.key,
    required this.onBack,
    this.isPDone = false,
  });

  final bool isPDone;
  final VoidCallback onBack;

  @override
  State<EditProfileEmpty> createState() => _EditProfileEmptyState();
}

class _EditProfileEmptyState extends State<EditProfileEmpty>
    with ValidationMixin, UpdateInformationProfileMixin {
  final fullNameController = TextEditingController();
  final nickNameController = TextEditingController();
  final birthDayController = TextEditingController();
  int gender = 0;
  final emailController = TextEditingController();

  ///
  Country? permanentCountry = countries.first;
  Province? permanentProvince = provinces.first;
  District? permanentDistrict = districts.first;
  Ward? permanentWard = wards.first;

  Country? cuCountry = countries.first;
  Province? cuProvince = provinces.first;
  District? cuDistrict = districts.first;
  Ward? cuWard = wards.first;

  final realAddress = TextEditingController();
  final idNumberController = TextEditingController();
  final placeOfNumberController = TextEditingController();
  final bankNumberController = TextEditingController();
  final bankAccountHolderController = TextEditingController();
  String supplyDateX = DateFormat('dd/MM/yyyy').format(DateTime.now());

  String? bank;
  String bloodType = "";
  String martialStatus = "";
  String edu = "";
  final jobController = TextEditingController();
  final talentController = TextEditingController();
  final hobbyController = TextEditingController();

  late final userBloc = context.read<UserProfileBloc>();

  late final placeInformationBloc = injector<PlaceInformationBloc>()
    ..add(GetListProvincesEvent(permanentCountry!.iso2!));
  late final placeInformationBloc2 = injector<PlaceInformationBloc2>()
    ..add(GetListProvincesEvent2(cuCountry!.iso2!));
  late final bankBloc = injector<GetListBanksBloc>()..add(GetListDataEvent());
  late final upgradePDoneBloc = context.read<UpgradePDoneBloc>()
    ..add(GetListMasterEvent());

  void validate() {
    if (!widget.isPDone) {
      String firstName = '';
      String middleName = '';
      String lastName = '';

      final name = fullNameController.text.trim().split(' ');

      for (var i = 0; i < name.length; i++) {
        if (i == 0) {
          firstName = name[i];
        } else if (i == 1 && name.length == 3) {
          middleName = name[i];
        } else {
          lastName = name[i];
        }
      }

      final birthS = birthDayController.text.split('/');

      List subS = supplyDateX.split('/');

      if (subS.length != 3) {
        subS = supplyDateX.split('-');
        subS = subS.reversed.toList();
      }

      final data = <String, dynamic>{
        if (firstName.trim().isNotEmpty) "firstName": firstName,
        if (middleName.trim().isNotEmpty) "middleName": middleName,
        if (lastName.trim().isNotEmpty) "lastName": lastName,
        if (nickName.trim().isNotEmpty) "nickName": nickName,
        "currentPlace": {
          "countryName": cuCountry?.name,
          "countryCode": cuCountry?.iso2,
          "provinceName": cuProvince?.name,
          "provinceCode": cuProvince?.stateCode.toString(),
          "districtName": cuDistrict?.name,
          "districtCode": cuDistrict?.code,
          "wardName": cuWard?.name,
          "wardCode": cuWard?.id.toString(),
        },
        "birthPlace": {
          "countryName": permanentCountry?.name,
          "countryCode": permanentCountry?.iso2,
          "provinceName": permanentProvince?.name,
          "districtName": permanentDistrict?.name,
          "wardName": permanentWard?.name,
        },
        if (martialStatus.trim().isNotEmpty) "maritalStatus": martialStatus,
        if (bloodType.trim().isNotEmpty) "bloodGroup": bloodType,
        if (edu.trim().isNotEmpty) "academicLevel": edu,
        if (jobController.text.trim().isNotEmpty) "job": jobController.text,
        if (hobbyController.text.trim().isNotEmpty)
          "interest": hobbyController.text,
        if (talentController.text.trim().isNotEmpty)
          "talent": talentController.text,
        "sex": gender,
        if (birthS.length == 3)
          "birthday":
              '${birthS[2].trim()}-${birthS[1].trim()}-${birthS[0].trim()}',
        if (idNumberController.text.trim().isNotEmpty)
          "identityNumber": idNumberController.text,
        if (subS.length == 3) "supplyDate": '${subS[2]}-${subS[1]}-${subS[0]}',
        if (placeOfNumberController.text.trim().isNotEmpty)
          "supplyAddress": placeOfNumberController.text
      };

      context.read<UserProfileBloc>().add(SubmitDataNonePDone(data));
    } else {
      if (nickNameController.text.trim().isEmpty) {
        showToastMessage('Vui lòng nhập nickname', ToastMessageType.error);
        return;
      }
      context.read<UserProfileBloc>().add(SubmitDataPDone(
            UpdateNonePDoneProfilePayload(
              nickName: nickNameController.text,
              currentPlace: UpdatePlaceInformationPayload(
                countryName: cuCountry?.name,
                countryCode: cuCountry?.iso2,
                provinceName: cuProvince?.name,
                provinceCode: cuProvince?.stateCode.toString(),
                districtName: cuDistrict?.name,
                districtCode: cuDistrict?.code,
                wardName: cuWard?.name,
                wardCode: cuWard!.id.toString(),
              ),
              interest: hobbyController.text,
              talent: talentController.text,
              bloodGroup: bloodType,
              maritalStatus: martialStatus,
            ),
          ));
    }

    widget.onBack();
  }

  bool _updateEmailSuccess = false;

  void requestUpdateEmail() async {
    if (emailController.text == (userBloc.state.user?.email ?? '')) return;
    final ok = await showDialog(
      context: context,
      builder: (_) => const EmailVerifyConfirmDialog(),
    );

    if (ok) {
      if (!mounted) return;
      final success = await Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => EmailOtpVerify(email: emailController.text),
      ));
      if (success) {
        setState(() {
          _updateEmailSuccess = true;
        });
        userBloc.add(RefreshUser());
      }
    }
  }

  @override
  void initState() {
    fullNameController.text = "${userBloc.state.pDoneProfile?.firstName ?? ''} "
        "${userBloc.state.pDoneProfile?.middleName ?? ''} "
        "${userBloc.state.pDoneProfile?.lastName ?? ''}";
    nickNameController.text = userBloc.state.pDoneProfile?.nickName ?? '';
    final bd = userBloc.state.pDoneProfile?.birthday ??
        DateFormat('yyyy-MM-dd').format(DateTime.now());
    final bds = bd.split('-');
    birthDayController.text = '${bds[2]}/${bds[1]}/${bds[0]}';
    gender = userBloc.state.pDoneProfile?.sex ?? 1;
    emailController.text = '';
    idNumberController.text = userBloc.state.pDoneProfile?.identityNumber ?? '';
    final subs = userBloc.state.pDoneProfile?.supplyDate ??
        DateFormat('dd/MM/yyyy').format(DateTime.now());
    final subsX = subs.split('-');
    supplyDateX = '${subsX[2]}/${subsX[1]}/${subsX[0]}';
    placeOfNumberController.text = userBloc.state.pDoneProfile?.supplyAddress ??
        'Cục trưởng cục cảnh sát và quản lý hành chính';
    jobController.text = userBloc.state.pDoneProfile?.job ?? '';
    talentController.text = userBloc.state.pDoneProfile?.talent ?? '';
    hobbyController.text = userBloc.state.pDoneProfile?.interest ?? '';
    martialStatus = userBloc.state.pDoneProfile?.maritalStatus ?? '';
    bloodType = userBloc.state.pDoneProfile?.bloodGroup ?? '';
    emailController.text = userBloc.state.user?.email ?? '';
    super.initState();
  }

  DateTime get date {
    final bds = birthDayController.text.split('/');
    return DateTime(int.parse(bds[2]), int.parse(bds[1]), int.parse(bds[0]));
  }

  DateTime get subDate {
    final bds = supplyDateX.split('/');
    return DateTime(int.parse(bds[2]), int.parse(bds[1]), int.parse(bds[0]));
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PlaceInformationBloc>.value(
          value: placeInformationBloc,
        ),
        BlocProvider<PlaceInformationBloc2>.value(
          value: placeInformationBloc2,
        ),
        BlocProvider<GetListBanksBloc>.value(value: bankBloc),
        BlocProvider<UpgradePDoneBloc>.value(value: upgradePDoneBloc),
      ],
      child: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        behavior: HitTestBehavior.opaque,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 25.0,
              ),
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
                  if (widget.isPDone)
                    Row(
                      children: [
                        Expanded(
                          child: InformationFieldWidget(
                            required: widget.isPDone,
                            shouldEnabled: false,
                            hintText:
                                userBloc.state.pDoneProfile?.firstName ?? '',
                            type: UpdateInformationType.firstName,
                            onChanged: (value) {
                              onValidation();
                            },
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: InformationFieldWidget(
                            required: widget.isPDone,
                            shouldEnabled: false,
                            hintText:
                                userBloc.state.pDoneProfile?.middleName ?? '',
                            type: UpdateInformationType.middleName,
                            onChanged: (value) {
                              onValidation();
                            },
                          ),
                        ),
                      ],
                    ),
                  if (widget.isPDone)
                    InformationFieldWidget(
                      required: widget.isPDone,
                      shouldEnabled: false,
                      hintText: userBloc.state.pDoneProfile?.lastName ?? '',
                      type: UpdateInformationType.lastName,
                      onChanged: (value) {},
                    ),
                  if (!widget.isPDone)
                    InformationFieldWidget(
                      required: widget.isPDone,
                      shouldEnabled: true,
                      controller: fullNameController,
                      type: UpdateInformationType.fullName,
                      onChanged: (value) {
                        onValidation();
                      },
                    ),
                  InformationFieldWidget(
                    required: widget.isPDone,
                    shouldEnabled: true,
                    maxLength: 24,
                    controller: nickNameController,
                    onChanged: (String? value) {
                      onValidation();
                    },
                    type: UpdateInformationType.nickName,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: BlocBuilder<UpgradePDoneBloc, UpgradePDoneState>(
                          buildWhen: (old, state) =>
                              state is GetListMasterSuccess,
                          builder: (ctx, state) {
                            if (state is GetListMasterSuccess) {
                              final data = state.upgradeAccount.genders ?? [];
                              return GenderDropdown(
                                disable: widget.isPDone,
                                required: true,
                                genders: data,
                                onChange: (sex) {
                                  gender = sex;
                                },
                              );
                            }

                            return GenderDropdown(
                              disable: widget.isPDone,
                              required: true,
                              genders: genders,
                              onChange: (sex) {
                                gender = sex;
                              },
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: InformationLayoutFieldWidget(
                          required: true,
                          label: UpdateInformationType.birthDay.title(context),
                          child: InputDateTimeWidget(
                            controller: birthDayController,
                            hintText: 'Ngày sinh',
                            useHorizontalLayout: true,
                            enabled: !widget.isPDone,
                            radius: 17,
                            date: date,
                            formatText: (date) => S
                                .of(context)
                                .formatDateDDmmYYYYhhMM(date, date)
                                .split('|')
                                .first,
                            max: DateTime.now(),
                            onChange: (dateTime) {
                              onValidation();
                              birthDayController.text =
                                  DateFormat('dd/MM/yyyy').format(dateTime!);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Focus(
                    onFocusChange: (value) {
                      if (!value &&
                          context.validateEmailInfo(
                                emailController.text,
                                'Địa chỉ email không hợp lệ',
                              ) ==
                              null) {
                        Future.delayed(const Duration(seconds: 1), () {
                          if (!mounted) return;
                          requestUpdateEmail();
                        });
                      }
                    },
                    child: InformationFieldWidget(
                      required: true,
                      shouldEnabled: true,
                      controller: emailController,
                      onChanged: (String? value) {
                        onValidation();
                      },
                      type: UpdateInformationType.email,
                      validator: (value) => context.validateEmailInfo(
                        emailController.text,
                        'Địa chỉ email không hợp lệ',
                      ),
                    ),
                  ),
                  if (_updateEmailSuccess)
                    const Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Text(
                        'Cập nhật thành công',
                        style: TextStyle(fontSize: 12, color: Colors.green),
                      ),
                    ),
                ],
              ),
            ),
            Container(
              height: 12,
              width: double.infinity,
              color: const Color(0xffF3F8FF),
            ),
            _buildFieldIdentifierInformation(),
            Container(
              height: 12,
              width: double.infinity,
              color: const Color(0xffF3F8FF),
            ),
            IgnorePointer(
              ignoring: widget.isPDone,
              child: _buildBankInformation(),
            ),
            Container(
              height: 12,
              width: double.infinity,
              color: const Color(0xffF3F8FF),
            ),
            _buildMoreInformation(),
            _buildButtonUpdate(context),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonUpdate(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListenableBuilder(
        listenable: Listenable.merge([
          fullNameController,
        ]),
        builder: (_, __) {
          return PrimaryButton(
            disabled: false,
            onTap: () {
              validate();
            },
            height: 45,
            title: 'Cập nhật',
            width: MediaQuery.of(context).size.width,
          );
        },
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
          BlocBuilder<UpgradePDoneBloc, UpgradePDoneState>(
            bloc: upgradePDoneBloc,
            buildWhen: (old, state) => state is GetListMasterSuccess,
            builder: (ctx, state) {
              if (state is GetListMasterSuccess) {
                final data = state.upgradeAccount.academicLevels ?? [];
                edu = data.first.name ?? '';
                return EducationDropdown(
                  educations: data,
                  required: false,
                  onChange: (edu) {
                    this.edu = edu;
                  },
                );
              }

              return Container();
            },
          ),
          InformationFieldWidget(
            required: widget.isPDone,
            shouldEnabled: true,
            controller: jobController,
            onChanged: (String? value) {
              onValidation();
            },
            type: UpdateInformationType.career,
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: BlocBuilder<UpgradePDoneBloc, UpgradePDoneState>(
                  bloc: upgradePDoneBloc,
                  buildWhen: (old, state) => state is GetListMasterSuccess,
                  builder: (ctx, state) {
                    if (state is GetListMasterSuccess) {
                      final list = state.upgradeAccount.bloodGroups ?? [];
                      BloodGroup data = list.first;
                      if (bloodType.trim().isNotEmpty) {
                        data =
                            list.firstWhereOrNull((e) => e.name == bloodType) ??
                                data;
                      }
                      return BloodTypeDropDown(
                        value: data,
                        required: false,
                        bloodTypes: list,
                        onChange: (bloodType) {
                          this.bloodType = bloodType;
                        },
                      );
                    }

                    return Container();
                  },
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: BlocBuilder<UpgradePDoneBloc, UpgradePDoneState>(
                  buildWhen: (old, state) => state is GetListMasterSuccess,
                  builder: (ctx, state) {
                    if (state is GetListMasterSuccess) {
                      final list = state.upgradeAccount.maritalStatus ?? [];
                      MaritalStatus status = list.first;
                      if (martialStatus.trim().isNotEmpty) {
                        status = list.firstWhereOrNull(
                                (e) => e.name == martialStatus) ??
                            status;
                      }
                      return MaritalStatusDropDown(
                        value: status,
                        required: false,
                        maritals: list,
                        onChange: (marital) {
                          martialStatus = marital;
                        },
                      );
                    }

                    return Container();
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 7),
          InformationFieldWidget(
            required: widget.isPDone,
            shouldEnabled: true,
            controller: talentController,
            onChanged: (String? value) {
              onValidation();
            },
            type: UpdateInformationType.gifted,
          ),
          const SizedBox(height: 7),
          InformationFieldWidget(
            required: widget.isPDone,
            shouldEnabled: true,
            controller: hobbyController,
            onChanged: (String? value) {
              onValidation();
            },
            type: UpdateInformationType.hobby,
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
          BlocBuilder<GetListBanksBloc, GetListState>(
            buildWhen: (old, state) => state is GetListDataSuccess<Bank>,
            builder: (_, state) {
              if (state is GetListDataSuccess<Bank>) {
                return BankDropdown(
                  enable: !widget.isPDone,
                  required: widget.isPDone,
                  banks: (state).data,
                  onChange: (bank) {
                    this.bank = bank;
                  },
                );
              }
              return const SizedBox.shrink();
            },
          ),
          InformationFieldWidget(
            required: widget.isPDone,
            shouldEnabled: !widget.isPDone,
            controller: bankNumberController,
            onChanged: (String? value) {
              onValidation();
            },
            type: UpdateInformationType.bankNumber,
          ),
          InformationFieldWidget(
            required: widget.isPDone,
            shouldEnabled: !widget.isPDone,
            controller: bankAccountHolderController,
            onChanged: (String? value) {
              onValidation();
            },
            type: UpdateInformationType.bankAccountHolder,
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
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              children: [
                Expanded(
                  child: IgnorePointer(
                    ignoring: widget.isPDone,
                    child: const CountryBuild(),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(child: buildProvince()),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              children: [
                Expanded(
                  child: IgnorePointer(
                    ignoring: widget.isPDone,
                    child: buildDistrict(),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: IgnorePointer(
                    ignoring: widget.isPDone,
                    child: buildWard(),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "Địa chỉ hiện tại",
            style: TextStyle(
              color: AppColors.black,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              children: [
                Expanded(
                  child: buildCountry2(),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: buildProvince2(),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              children: [
                Expanded(child: buildDistrict2()),
                const SizedBox(width: 20),
                Expanded(child: buildWard2()),
              ],
            ),
          ),
          InformationFieldWidget(
            required: widget.isPDone,
            shouldEnabled: !widget.isPDone,
            controller: realAddress,
            type: UpdateInformationType.address,
            onChanged: (String? value) {
              address = value!;
              onValidation();
            },
          ),
          Row(
            children: [
              Expanded(
                child: InformationFieldWidget(
                  required: widget.isPDone,
                  shouldEnabled: !widget.isPDone,
                  hintText: 'Ex: 12345678909',
                  controller: idNumberController,
                  type: UpdateInformationType.idNumber,
                  onChanged: (String? value) {
                    idNumber = value!;
                  },
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: InformationLayoutFieldWidget(
                  required: true,
                  label: UpdateInformationType.dateOfIdNumber.title(context),
                  child: InputDateTimeWidget(
                    hintText: 'Ngày cấp',
                    useHorizontalLayout: true,
                    enabled: !widget.isPDone,
                    radius: 17,
                    date: subDate,
                    formatText: (date) => S
                        .of(context)
                        .formatDateDDmmYYYYhhMM(date, date)
                        .split('|')
                        .first,
                    max: DateTime.now(),
                    onChange: (dateTime) {
                      supplyDateX = DateFormat('dd/MM/yyyy').format(dateTime!);
                    },
                  ),
                ),
              ),
            ],
          ),

          //Nơi cấp
          InformationFieldWidget(
            required: widget.isPDone,
            shouldEnabled: !widget.isPDone,
            hintText: 'Cục trưởng cục cảnh sát và quản lý hành chính',
            controller: placeOfNumberController,
            type: UpdateInformationType.placeofIdNumber,
            onChanged: (String? value) {
              onValidation();
            },
          ),
        ],
      ),
    );
  }

  Widget buildCountry() {
    return BlocBuilder<PlaceInformationBloc, PlaceInformationState>(
      bloc: placeInformationBloc,
      buildWhen: (old, state) {
        return state is PlaceInformationInitial;
      },
      builder: (ctx, state) {
        final co = state.countries ?? countries;
        return CountriesDropdown(
          key: const Key('drop_down'),
          required: true,
          countries: co,
          onChange: (country) {
            permanentCountry = country;
            placeInformationBloc.add(GetListProvincesEvent(country.iso2!));
          },
        );
      },
    );
  }

  Widget buildProvince() {
    return BlocConsumer<PlaceInformationBloc, PlaceInformationState>(
      buildWhen: (old, state) => state is GetListProvincesSuccess,
      listener: (_, state) {
        if (state is GetListProvincesSuccess) {
          final pros = state.provinces ?? provinces;
          final proName = userBloc.state.pDoneProfile?.birthPlace.provinceName;
          if (proName != null) {
            permanentProvince =
                pros.firstWhereOrNull((e) => e.name!.contains(proName));
            permanentProvince ??= pros.first;
          } else {
            permanentProvince = pros.first;
          }
          placeInformationBloc.add(GetDistrictsByProvinceEvent(
              permanentCountry!.iso2!, permanentProvince!.stateCode!));
        }
      },
      builder: (ctx, state) {
        if (state is GetListProvincesSuccess) {
          final pros = state.provinces ?? provinces;
          return ProvinceDropDown(
            enable: !widget.isPDone,
            province: permanentProvince,
            required: true,
            provinces: pros,
            onChange: (province) {
              permanentProvince = province;
              placeInformationBloc.add(GetDistrictsByProvinceEvent(
                  permanentCountry!.iso2!, province.stateCode!));
            },
          );
        }

        return Container();
      },
    );
  }

  Widget buildDistrict() {
    return BlocConsumer<PlaceInformationBloc, PlaceInformationState>(
      buildWhen: (old, state) {
        return state is GetDistrictsSuccess;
      },
      listener: (ctx, state) {
        if (state is GetDistrictsSuccess) {
          final dis = state.districts ?? districts;
          final district = userBloc.state.pDoneProfile?.birthPlace.districtName;
          if (district != null) {
            permanentDistrict = dis
                .firstWhereOrNull((e) => e.name?.contains(district) ?? false);
            permanentDistrict ??= dis.first;
          } else {
            permanentDistrict = dis.first;
          }
          placeInformationBloc.add(GetWardsByDistrictEvent(
              permanentCountry!.iso2!,
              permanentProvince!.stateCode!,
              permanentDistrict!.code!));
        }
      },
      builder: (ctx, state) {
        if (state is GetDistrictsSuccess) {
          final dis = state.districts ?? districts;
          return DistrictDropDown(
            enable: !widget.isPDone,
            district: permanentDistrict,
            required: true,
            districts: dis,
            onChange: (district) {
              permanentDistrict = district;
              placeInformationBloc.add(GetWardsByDistrictEvent(
                  permanentCountry!.iso2!,
                  permanentProvince!.stateCode!,
                  district.code!));
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget buildWard() {
    return BlocConsumer<PlaceInformationBloc, PlaceInformationState>(
      buildWhen: (old, state) => state is GetWardsSuccess,
      listener: (ctx, state) {
        if (state is GetWardsSuccess) {
          final wa = state.wards ?? wards;
          final warName = userBloc.state.pDoneProfile?.birthPlace.wardName;
          if (warName != null) {
            permanentWard =
                wa.firstWhereOrNull((e) => e.name?.contains(warName) ?? false);
            permanentWard ??= wa.first;
          } else {
            permanentWard = wa.first;
          }
        }
      },
      builder: (ctx, state) {
        final wa = state.wards ?? wards;
        return WardDropDown(
          enable: !widget.isPDone,
          ward: permanentWard,
          required: true,
          wards: wa,
          onChange: (ward) {
            permanentWard = ward;
          },
        );
      },
    );
  }

  Widget buildCountry2() {
    return BlocConsumer<PlaceInformationBloc2, PlaceInformationState2>(
      bloc: placeInformationBloc2,
      buildWhen: (old, state) {
        return state is PlaceInformationInitial2;
      },
      listener: (ctx, state) {
        if (state is PlaceInformationInitial2) {
          cuCountry = countries.first;
          placeInformationBloc2.add(GetListProvincesEvent2(cuCountry!.iso2!));
        }
      },
      builder: (ctx, state) {
        final co = state.countries ?? countries;
        return CountriesDropdown(
          required: true,
          countries: co,
          onChange: (country) {
            cuCountry = country;
            placeInformationBloc2.add(GetListProvincesEvent2(country.iso2!));
          },
        );
      },
    );
  }

  Widget buildProvince2() {
    return BlocConsumer<PlaceInformationBloc2, PlaceInformationState2>(
      bloc: placeInformationBloc2,
      listener: (_, state) {
        if (state is GetListProvincesSuccess2) {
          final pros = state.provinces ?? provinces;
          final proName = userBloc.state.pDoneProfile?.birthPlace.provinceName;
          if (proName != null) {
            cuProvince =
                pros.firstWhereOrNull((e) => e.name!.contains(proName));
            cuProvince ??= pros.first;
          } else {
            cuProvince = pros.first;
          }
          placeInformationBloc2.add(GetDistrictsByProvinceEvent2(
              cuCountry!.iso2!, cuProvince!.stateCode!));
        }
      },
      buildWhen: (old, state) => state is GetListProvincesSuccess2,
      builder: (ctx, state) {
        if (state is GetListProvincesSuccess2) {
          final pros = state.provinces ?? provinces;
          return ProvinceDropDown(
            province: cuProvince,
            required: true,
            provinces: pros,
            onChange: (province) {
              cuProvince = province;
              placeInformationBloc2.add(GetDistrictsByProvinceEvent2(
                  cuCountry!.iso2!, province.stateCode!));
            },
          );
        }

        return Container();
      },
    );
  }

  Widget buildDistrict2() {
    return BlocConsumer<PlaceInformationBloc2, PlaceInformationState2>(
      bloc: placeInformationBloc2,
      buildWhen: (old, state) {
        return state is GetDistrictsSuccess2;
      },
      listener: (ctx, state) {
        if (state is GetDistrictsSuccess2) {
          final dis = state.districts ?? districts;
          final district = userBloc.state.pDoneProfile?.birthPlace.districtName;
          if (district != null) {
            cuDistrict = dis
                .firstWhereOrNull((e) => e.name?.contains(district) ?? false);
            cuDistrict ??= dis.first;
          } else {
            cuDistrict = dis.first;
          }
          cuDistrict = dis.first;
          placeInformationBloc2.add(GetWardsByDistrictEvent2(
              cuCountry!.iso2!, cuProvince!.stateCode!, cuDistrict!.code!));
        }
      },
      builder: (ctx, state) {
        if (state is GetDistrictsSuccess2) {
          final dis = state.districts ?? districts;
          return DistrictDropDown(
            district: cuDistrict,
            required: true,
            districts: dis,
            onChange: (district) {
              cuDistrict = district;
              placeInformationBloc2.add(GetWardsByDistrictEvent2(
                  cuCountry!.iso2!, cuProvince!.stateCode!, district.code!));
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget buildWard2() {
    return BlocConsumer<PlaceInformationBloc2, PlaceInformationState2>(
      bloc: placeInformationBloc2,
      buildWhen: (old, state) => state is GetWardsSuccess2,
      listener: (ctx, state) {
        if (state is GetWardsSuccess2) {
          final wa = state.wards ?? wards;
          final warName = userBloc.state.pDoneProfile?.birthPlace.wardName;
          if (warName != null) {
            cuWard =
                wa.firstWhereOrNull((e) => e.name?.contains(warName) ?? false);
            cuWard ??= wa.first;
          } else {
            cuWard = wa.first;
          }
        }
      },
      builder: (ctx, state) {
        final wa = state.wards ?? wards;
        return WardDropDown(
          ward: cuWard,
          required: true,
          wards: wa,
          onChange: (ward) {
            cuWard = ward;
          },
        );
      },
    );
  }
}

class CountryBuild extends StatelessWidget {
  const CountryBuild({super.key});

  @override
  Widget build(BuildContext context) {
    final s = context.findAncestorStateOfType<_EditProfileEmptyState>();
    final w = context.findAncestorWidgetOfExactType<EditProfileEmpty>();
    return BlocBuilder<PlaceInformationBloc, PlaceInformationState>(
      buildWhen: (old, state) {
        return state is PlaceInformationInitial;
      },
      builder: (ctx, state) {
        final co = state.countries ?? countries;
        return CountriesDropdown(
          enable: !(w?.isPDone ?? false),
          key: const Key('drop_down'),
          required: true,
          countries: co,
          onChange: (country) {
            s?.permanentCountry = country;
            context
                .read<PlaceInformationBloc>()
                .add(GetListProvincesEvent(country.iso2!));
          },
        );
      },
    );
  }
}
