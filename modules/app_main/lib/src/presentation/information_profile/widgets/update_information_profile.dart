import 'package:app_core/app_core.dart';
import 'package:app_main/src/domain/entities/update_account/update_profile_payload.dart';
import 'package:app_main/src/presentation/information_profile/widgets/education_dropdown.dart';
import 'package:app_main/src/presentation/information_profile/widgets/bank_dropdown.dart';
import 'package:app_main/src/presentation/information_profile/widgets/bloodtype_dropdown.dart';
import 'package:app_main/src/presentation/information_profile/widgets/city_dropdown.dart';
import 'package:app_main/src/presentation/information_profile/widgets/district_dropdown.dart';
import 'package:app_main/src/presentation/information_profile/widgets/marital_status_dropdown.dart';
import 'package:app_main/src/presentation/information_profile/widgets/national_dropdown.dart';
import 'package:app_main/src/presentation/information_profile/widgets/update_information_profile_mixin.dart';
import 'package:app_main/src/presentation/information_profile/widgets/ward_dropdown.dart';
import 'package:app_main/src/presentation/marshop/widgets/gradiant_button.dart';
import 'package:app_main/src/presentation/shared/extensions/validation_extension.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:localization/generated/l10n.dart';
import 'package:ui/ui.dart';

class UpdateInformationProfileScreen extends StatefulWidget {
  final User authInfo;

  const UpdateInformationProfileScreen({
    super.key,
    required this.authInfo,
  });

  @override
  State<UpdateInformationProfileScreen> createState() => _UpdateInformationProfileScreenState();
}

class _UpdateInformationProfileScreenState extends State<UpdateInformationProfileScreen>
    with ValidationMixin, UpdateInformationProfileMixin {
  int _gender = 1;
  String _national = "";
  String _city = "";
  String _district = "";
  String _ward = "";
  final _phoneCtrl = TextEditingController();
  String _phoneCode = "+84";
  String _bank = "";
  String _edu = "";
  String _bloodType = "";
  String _martialStatus = "";

  @override
  Widget build(BuildContext context) {
    return ScaffoldHideKeyboard(
      appBar: const BaseAppBar(
        title: "Thông tin tài khoản",
        hideActionButtons: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: validationFormBuilder(
          child: AutoHideKeyboard(
            child: ListView(
              children: [
                _buildToolbar(),
                const SizedBox(height: 20),
                Container(height: 20, color: AppColors.bgColor),
                _buildFieldInformation(),
                Container(height: 20, color: AppColors.bgColor),
                _buildFieldIdentifierInformation(),
                Container(height: 20, color: AppColors.bgColor),
                _buildProtectedInformation(),
                Container(height: 20, color: AppColors.bgColor),
                _buildBankInformation(),
                Container(height: 20, color: AppColors.bgColor),
                _buildMoreInformation(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
                  child: GradiantButton(
                    onPressed: () {},
                    child: Text(
                      "Cập nhật",
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: AppColors.white,
                          ),
                    ),
                  ),
                ),
              ],
            ),
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
            onChanged: (value) => onUpdatePayload(payload.copyWith(firstName: value)),
            type: UpdateInformationType.fullName,
            validator: (value) => context.validateEmptyInfo(
              fullNameTxtController.text,
              'Vui lòng nhập họ và tên',
            ),
          ),

          //Nick name
          InformationFieldWidget(
            required: true,
            shouldEnabled: true,
            maxLength: 24,
            controller: nickNameTxtController,
            onChanged: (value) => onUpdatePayload(payload.copyWith(firstName: value)),
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
                child: GenderInput(
                  required: true,
                  onChange: (sex) {
                    _gender = sex;
                    setState(() {});
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
            onChanged: (value) => onUpdatePayload(payload.copyWith(firstName: value)),
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

  Widget _buildProtectedInformation() {
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

          /// ID Pdone
          InformationFieldWidget(
            required: true,
            shouldEnabled: true,
            controller: idPDoneProtectorTxtController,
            onChanged: (value) => onUpdatePayload(payload.copyWith(firstName: value)),
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
                setState(() {});
                debugPrint("$value");
              }
            },
          ),
          //CCCD
          InformationFieldWidget(
            required: true,
            shouldEnabled: true,
            controller: idNumberProtectorTxtController,
            onChanged: (value) => onUpdatePayload(payload.copyWith(firstName: value)),
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
          BankDropdown(
            required: true,
            onChange: (bank) {
              _bank = bank;
              setState(() {});
            },
          ),
          InformationFieldWidget(
            required: true,
            shouldEnabled: true,
            controller: bankNumberTxtController,
            onChanged: (value) => onUpdatePayload(payload.copyWith(firstName: value)),
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
            onChanged: (value) => onUpdatePayload(payload.copyWith(firstName: value)),
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
            required: false,
            onChange: (edu) {
              _edu = edu;
              setState(() {});
            },
          ),
          InformationFieldWidget(
            required: false,
            shouldEnabled: true,
            controller: careerTxtController,
            onChanged: (value) => onUpdatePayload(payload.copyWith(firstName: value)),
            type: UpdateInformationType.career,
            validator: (_) {},
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: BloodTypeDropDown(
                  required: false,
                  onChange: (bloodType) {
                    _bloodType = bloodType;
                  },
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: MaritalStatusDropDown(
                  required: false,
                  onChange: (martialStatus) {
                    _martialStatus = martialStatus;
                  },
                ),
              ),
            ],
          ),
          InformationFieldWidget(
            required: false,
            shouldEnabled: true,
            controller: giftedTxtController,
            onChanged: (value) => onUpdatePayload(payload.copyWith(firstName: value)),
            type: UpdateInformationType.gifted,
            validator: (_) {},
          ),
          InformationFieldWidget(
            required: false,
            shouldEnabled: true,
            controller: giftedTxtController,
            onChanged: (value) => onUpdatePayload(payload.copyWith(firstName: value)),
            type: UpdateInformationType.hobby,
            validator: (_) {},
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
                  child: NationalDropdown(
                    required: true,
                    onChange: (national) {
                      _national = national;
                    },
                  ),
                ),
                const SizedBox(width: 20),
                //Tỉnh/thành
                Expanded(
                  child: CityDropDown(
                    required: true,
                    onChange: (city) {
                      _city = city;
                    },
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
                  child: DistrictDropDown(
                    required: true,
                    onChange: (district) {
                      _district = district;
                    },
                  ),
                ),
                const SizedBox(width: 20),
                //Phường/xã
                Expanded(
                  child: WardDropDown(
                    required: true,
                    onChange: (ward) {
                      _district = ward;
                    },
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
                  child: NationalDropdown(
                    required: true,
                    onChange: (national) {
                      _national = national;
                      setState(() {});
                    },
                  ),
                ),
                const SizedBox(width: 20),
                //Tỉnh/thành
                Expanded(
                  child: CityDropDown(
                    required: true,
                    onChange: (city) {
                      _national = city;
                      setState(() {});
                    },
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
                  child: DistrictDropDown(
                    required: true,
                    onChange: (district) {
                      _district = district;
                      setState(() {});
                    },
                  ),
                ),
                const SizedBox(width: 20),
                //Phường/xã
                Expanded(
                  child: WardDropDown(
                    required: true,
                    onChange: (ward) {
                      _district = ward;
                      setState(() {});
                    },
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
            onChanged: (value) => onUpdatePayload(payload.copyWith(firstName: value)),
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
                  onChanged: (value) => onUpdatePayload(payload.copyWith(firstName: value)),
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
            onChanged: (value) => onUpdatePayload(payload.copyWith(firstName: value)),
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

  void onUpdatePayload(UpdateProfilePayload val) {
    EasyDebounce.debounce('onUpdateInfomationPayload', const Duration(milliseconds: 200), () {
      onValidation();
      payload = val;
    });
  }
}
