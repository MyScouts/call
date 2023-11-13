import 'package:app_core/app_core.dart';
import 'package:app_main/src/blocs/user/user_cubit.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/data/models/payloads/user/user_action_payload.dart';
import 'package:app_main/src/domain/entities/bank.dart';
import 'package:app_main/src/domain/entities/update_account/place/country.dart';
import 'package:app_main/src/domain/entities/update_account/place/district.dart';
import 'package:app_main/src/domain/entities/update_account/place/province.dart';
import 'package:app_main/src/domain/entities/update_account/place/ward.dart';
import 'package:app_main/src/domain/entities/update_account/upgrade_account.dart';
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
import 'package:localization/generated/l10n.dart';
import 'package:mobilehub_bloc/mobilehub_bloc.dart';
import 'package:ui/ui.dart';

class BodyUpdateInformationProfile extends StatefulWidget {
  final UserCubit userCubit;
  final User authInfo;
  const BodyUpdateInformationProfile({super.key, required this.userCubit, required this.authInfo});

  @override
  State<BodyUpdateInformationProfile> createState() => _BodyUpdateInformationProfileState();
}

class _BodyUpdateInformationProfileState extends State<BodyUpdateInformationProfile>
    with ValidationMixin, UpdateInformationProfileMixin, AutomaticKeepAliveClientMixin {
  final _phoneCtrl = TextEditingController();

  late final upgradePDoneBloc = context.read<UpgradePDoneBloc>();
  late final getListBankBloc = context.read<GetListBanksBloc>();
  late final placeInformationBloc = context.read<PlaceInformationBloc>();

  @override
  bool get wantKeepAlive => true;

  String _phoneCode = "+84";
  int _genderParam = 1;
  int _protectorID = 1;
  String _bankParam = "";
  String _eduParam = "";
  String _jobParam = "";
  String _bloodTypeParam = "";
  String _hobbyParam = "";
  String _talentParam = "";
  String _martialStatusParam = "";

  List<Protector> protectors = [];
  List<Gender> genders = [];
  List<MaritalStatus> maritals = [];
  List<Job> jobs = [];
  List<BloodGroup> bloodTypes = [];
  List<AcademicLevel> educations = [];
  List<Interest> hobbies = [];
  List<Talent> talents = [];
  ValueNotifier<List<Bank>> banksChanged = ValueNotifier([]);

  PDoneOptionMethod pDoneOptionMethod = PDoneOptionMethod.userIdentityCard;

  PDoneOptionRangeAge rangeAge = PDoneOptionRangeAge.over18;

  bool isShowProtector() {
    return rangeAge == PDoneOptionRangeAge.under18AndOver15 || pDoneOptionMethod == PDoneOptionMethod.userBirthCer;
  }

  void _listenerInformations(BuildContext context, UpgradePDoneState state) {
    if (state is GetListMasterLoading) {
      showLoading();
    }

    if (state is GetListMasterSuccess) {
      hideLoading();
      protectors = state.upgradeAccount.protectors ?? [];
      genders = state.upgradeAccount.genders ?? [];
      maritals = state.upgradeAccount.maritalStatus ?? [];
      jobs = state.upgradeAccount.jobs ?? [];
      bloodTypes = state.upgradeAccount.bloodGroups ?? [];
      educations = state.upgradeAccount.academicLevels ?? [];
      hobbies = state.upgradeAccount.interests ?? [];
      talents = state.upgradeAccount.talents ?? [];
    }

    if (state is GetListMasterFailure) {
      hideLoading();
    }
  }

  Country? currentCountry;
  Province? currentProvince;
  District? currentDistrict;
  Ward? currentWard;

  ValueNotifier<List<Country>?> countriesChanged = ValueNotifier([]);
  ValueNotifier<List<Province>?> provincesChanged = ValueNotifier([]);
  ValueNotifier<List<District>?> districtsChanged = ValueNotifier([]);
  ValueNotifier<List<Ward>?> wardsChanged = ValueNotifier([]);

  ValueNotifier<List<Country>?> countries2Changed = ValueNotifier([]);
  ValueNotifier<List<Province>?> provinces2Changed = ValueNotifier([]);
  ValueNotifier<List<District>?> districts2Changed = ValueNotifier([]);
  ValueNotifier<List<Ward>?> wards2Changed = ValueNotifier([]);

  void _listenerPlaces(BuildContext context, PlaceInformationState state) {
    if (state is PlaceInformationInitial) {
      countriesChanged.value = state.countries;
      countries2Changed.value = state.countries;
    }

    if (state is GetListProvincesSuccess) {
      provincesChanged.value = state.provinces;
      provinces2Changed.value = state.provinces;
    }

    if (state is GetDistrictsSuccess) {
      districtsChanged.value = state.districts;
      districts2Changed.value = state.districts;
    }

    if (state is GetWardsSuccess) {
      wardsChanged.value = state.wards;
      wards2Changed.value = state.wards;
    }
  }

  @override
  void initState() {
    upgradePDoneBloc.add(GetListMasterEvent());
    getListBankBloc.add(GetListDataEvent());
    placeInformationBloc.add(UserClearCountryEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: validationFormBuilder(
        child: AutoHideKeyboard(
          child: BlocConsumer<UpgradePDoneBloc, UpgradePDoneState>(
            listener: _listenerInformations,
            builder: (context, state) {
              return BlocListener<GetListBanksBloc, GetListState>(
                listener: (context, state) {
                  if (state is GetListDataSuccess<Bank>) {
                    banksChanged.value = state.data;
                    LoggerService.print("Banks: $banksChanged");
                  }
                },
                child: BlocListener<PlaceInformationBloc, PlaceInformationState>(
                  listener: _listenerPlaces,
                  child: ListView(
                    shrinkWrap: true,
                    addAutomaticKeepAlives: true,
                    children: [
                      _buildToolbar(),
                      const SizedBox(height: 20),
                      Container(height: 20, color: AppColors.bgColor),
                      _buildFieldInformation(),
                      Container(height: 20, color: AppColors.bgColor),
                      _buildFieldIdentifierInformation(),
                      Container(height: 20, color: AppColors.bgColor),
                      isShowProtector() ? _buildProtectorInformation() : Container(),
                      Container(height: 20, color: AppColors.bgColor),
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
        ),
      ),
    );
  }

  Padding _buildButtonUpdate(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
      child: GradiantButton(
        onPressed: () => widget.userCubit.updatePDoneProfile(
          updatePDoneProfilePayload: UpdatePDoneProfilePayload.fromJson(json)
        ),
        child: Text(
          "Cập nhật",
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: AppColors.white,
              ),
        ),
      ),
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

          /// Họ và tên
          InformationFieldWidget(
            required: true,
            shouldEnabled: true,
            controller: fullNameTxtController,
            type: UpdateInformationType.fullName,
            validator: (value) => context.validateEmptyInfo(
              fullNameTxtController.text,
              'Vui lòng nhập họ và tên',
            ),
            onChanged: (String? value) {},
          ),

          //Nick name
          InformationFieldWidget(
            required: true,
            shouldEnabled: true,
            maxLength: 24,
            controller: nickNameTxtController,
            onChanged: (String? value) {},
            type: UpdateInformationType.nickName,
            validator: (value) => context.validateNicknameInfo(
              nickNameTxtController.text,
              'Nickname không được vượt quá 24 ký tự',
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: GenderDropdown(
                  required: true,
                  genders: genders,
                  onChange: (sex) {
                    _genderParam = sex;
                  },
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: InformationLayoutFieldWidget(
                  required: true,
                  label: UpdateInformationType.birthDay.title(context),
                  child: InputDateTimeWidget(
                    hintText: 'Ngày sinh',
                    useHorizontalLayout: true,
                    enabled: true,
                    radius: 17,
                    date: birthDay,
                    formatText: (date) => S.of(context).formatDateDDmmYYYYhhMM(date, date).split('|').first,
                    max: DateTime.now(),
                    onChange: (dateTime) {
                      birthDay = dateTime;
                    },
                  ),
                ),
              ),
            ],
          ),

          //Email
          InformationFieldWidget(
            required: true,
            shouldEnabled: true,
            controller: emailAddressTxtController,
            onChanged: (String? value) {},
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
          ProtectorDropdown(
            required: true,
            protectors: protectors,
            onChange: (protector) {
              _protectorID = protector;
            },
          ),

          /// ID Pdone
          InformationFieldWidget(
            required: true,
            shouldEnabled: true,
            controller: idPDoneProtectorTxtController,
            onChanged: (String? value) {},
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
                _phoneCode = value.dialCode!;
                debugPrint("$value");
              }
            },
          ),
          //CCCD
          InformationFieldWidget(
            required: true,
            shouldEnabled: true,
            controller: idNumberProtectorTxtController,
            onChanged: (String? value) {},
            type: UpdateInformationType.idNumber,
            validator: (value) => checkIsUnder15ShouldEnableField()
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
                    _bankParam = bank;
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
            onChanged: (String? value) {},
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
            onChanged: (String? value) {},
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
          EducationDropdown(
            educations: educations,
            required: false,
            onChange: (edu) {
              _eduParam = edu;
            },
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
          Autocomplete<String>(
            optionsBuilder: (TextEditingValue textEditingValue) {
              if (textEditingValue.text.isEmpty) {
                return const Iterable<String>.empty();
              }

              var filteredAndSortedJobs = jobs
                  .where((element) => element.name!.contains(textEditingValue.text.toLowerCase()))
                  .map((job) => job.name!) // Extract job names
                  .toList();

              // Sort the job names
              filteredAndSortedJobs.sort((a, b) => a.compareTo(b));

              return filteredAndSortedJobs;
            },
            onSelected: (String itemSelected) {
              _jobParam = itemSelected;
            },
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: BloodTypeDropDown(
                  required: false,
                  bloodTypes: bloodTypes,
                  onChange: (bloodType) {
                    _bloodTypeParam = bloodType;
                  },
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: MaritalStatusDropDown(
                  required: false,
                  maritals: maritals,
                  onChange: (martialStatus) {
                    _martialStatusParam = martialStatus;
                  },
                ),
              ),
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
          Autocomplete<String>(
            optionsBuilder: (TextEditingValue textEditingValue) {
              if (textEditingValue.text.isEmpty) {
                return const Iterable<String>.empty();
              }

              var filteredAndSortedJobs = talents
                  .where((element) => element.name!.contains(textEditingValue.text.toLowerCase()))
                  .map((job) => job.name!)
                  .toList();

              filteredAndSortedJobs.sort((a, b) => a.compareTo(b));

              return filteredAndSortedJobs;
            },
            onSelected: (String itemSelected) {
              _jobParam = itemSelected;
            },
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
          Autocomplete<String>(
            optionsBuilder: (TextEditingValue textEditingValue) {
              if (textEditingValue.text.isEmpty) {
                return const Iterable<String>.empty();
              }

              var filteredAndSortedJobs = hobbies
                  .where((element) => element.name!.contains(textEditingValue.text.toLowerCase()))
                  .map((job) => job.name!)
                  .toList();

              filteredAndSortedJobs.sort((a, b) => a.compareTo(b));

              return filteredAndSortedJobs;
            },
            onSelected: (String itemSelected) {
              _jobParam = itemSelected;
            },
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
                    valueListenable: wards2Changed,
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
            onChanged: (String? value) {},
            type: UpdateInformationType.address,
            validator: (value) => context.validateEmptyInfo(
              addressTxtController.text,
              'Vui lòng nhập địa chỉ cụ thể',
            ),
          ),
          Row(
            children: [
              Expanded(
                child: InformationFieldWidget(
                  required: true,
                  shouldEnabled: true,
                  controller: idNumberTxtController,
                  onChanged: (String? value) {},
                  type: UpdateInformationType.idNumber,
                  validator: (value) => context.validateEmptyInfo(
                    idNumberTxtController.text,
                    'Vui lòng nhập số ID/CCCD/HC',
                  ),
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
                    enabled: true,
                    radius: 17,
                    date: birthDay,
                    formatText: (date) => S.of(context).formatDateDDmmYYYYhhMM(date, date).split('|').first,
                    max: DateTime.now(),
                    onChange: (dateTime) {
                      birthDay = dateTime;
                    },
                  ),
                ),
              ),
            ],
          ),

          //Nơi cấp
          InformationFieldWidget(
            required: true,
            shouldEnabled: true,
            controller: placeOfNumberTxtController,
            onChanged: (String? value) {},
            type: UpdateInformationType.placeofIdNumber,
            validator: (value) => context.validateEmptyInfo(
              placeOfNumberTxtController.text,
              'Vui lòng nhập nơi cấp',
            ),
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
          bottom: 25,
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
                      borderRadius: BorderRadius.circular(90),
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
                    right: 0,
                    child: ImageWidget(
                      ImageConstants.imageCamera,
                      width: 30,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
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
                    widget.authInfo.isJA!
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
              const SizedBox(height: 8),
              Text(
                "ID: ${widget.authInfo.pDoneId}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: AppColors.grey15,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  void onUpdatePayload(UpdatePDoneProfilePayload val) {
    EasyDebounce.debounce('onUpdateInfomationPayload', const Duration(milliseconds: 200), () {
      onValidation();
    });
  }
}
