import 'package:app_core/app_core.dart';
import 'package:app_main/src/blocs/user/user_cubit.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/presentation/authentication/authentication_constants.dart';
import 'package:app_main/src/presentation/authentication/authentication_coordinator.dart';
import 'package:app_main/src/presentation/general_setting/general_coordinator.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:localization/localization.dart';
import 'package:ui/ui.dart';

import '../../widget/custom_text_field.dart';

class RegisterWidget extends StatefulWidget {
  final EdgeInsets viewInsets;
  const RegisterWidget({
    super.key,
    required this.viewInsets,
  });

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  final ValueNotifier<bool> _formValidCtrl = ValueNotifier(false);
  final ValueNotifier<bool> _phoneValidCtrl = ValueNotifier(false);
  final ValueNotifier<bool> _confirmPasswordValidCtrl = ValueNotifier(false);

  final ValueNotifier<String?> _birthDateError = ValueNotifier(null);
  final ValueNotifier<List<PasswordRules>> _passwordRuleCtrl =
      ValueNotifier([]);
  final _phoneCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _rePasswordCtrl = TextEditingController();
  final genderCtrl = TextEditingController();
  DateTime? birthDay;
  int? _gender;
  String _phoneCode = "+84";

  @override
  void initState() {
    super.initState();
    _phoneValidCtrl.addListener(() => _onValidate());
    _passwordRuleCtrl.addListener(() => _onValidate());
    _confirmPasswordValidCtrl.addListener(() => _onValidate());
    _birthDateError.addListener(() => _onValidate());
    _passwordCtrl.addListener(() {
      List<PasswordRules> rules = [];
      final password = _passwordCtrl.text;
      _passwordRuleCtrl.value = [];
      if (password.length >= 8) {
        rules.add(PasswordRules.min8Character);
      } else {
        rules.removeWhere((element) => element == PasswordRules.min8Character);
      }

      if (password.hasNumber) {
        rules.add(PasswordRules.hasOneNumber);
      } else {
        rules.removeWhere((element) => element == PasswordRules.hasOneNumber);
      }

      if (password.hasUppercase) {
        rules.add(PasswordRules.hasOneCapital);
      } else {
        rules.removeWhere((element) => element == PasswordRules.hasOneCapital);
      }

      _passwordRuleCtrl.value = rules;
    });
  }

  _onValidate() {
    _formValidCtrl.value = _phoneValidCtrl.value &&
        _passwordRuleCtrl.value.length == PasswordRules.values.length &&
        _confirmPasswordValidCtrl.value &&
        _birthDateError.value == null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit, UserState>(
      listener: (context, state) {
        if (state is PhoneRegisterSuccess) {
          hideLoading();
          context.startVerifyOtp(
            phoneCode: _phoneCode,
            phoneNumber: _phoneCtrl.text.trim(),
            password: _passwordCtrl.text,
            birthDay: birthDay?.toYYYYmmdd ?? '1999-01-01',
            sex: _gender ?? 0,
          );
        }

        if (state is PhoneRegisterFail) {
          hideLoading();
          showToastMessage(state.message, ToastMessageType.error);
        }
      },
      child: SingleChildScrollView(
        padding: EdgeInsets.only(
          bottom: widget.viewInsets.bottom,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.current.lbl_Phone.capitalize(),
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF212121),
                      height: 20 / 14,
                      leadingDistribution: TextLeadingDistribution.even),
                ),
                const SizedBox(height: 4),
                AppPhoneInput(
                  controller: _phoneCtrl,
                  onError: (error) => _phoneValidCtrl.value = error == null,
                  onPhoneCodeChange: (value) {
                    if (value.dialCode != null) {
                      _phoneCode = value.dialCode!;
                      setState(() {});
                      debugPrint("$value");
                    }
                  },
                ),
                const SizedBox(height: 16),
                Text(
                  S.current.lbl_password,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF212121),
                      height: 20 / 14,
                      leadingDistribution: TextLeadingDistribution.even),
                ),
                const SizedBox(height: 4),
                CustomTextField(
                  controller: _passwordCtrl,
                  hintText: "**************",
                  // onError: (error) => _passwordValidCtrl.value = error == null,
                  hintStyle: const TextStyle(
                    color: Color(0xFF8C8C8C),
                    fontSize: 14,
                    height: 20 / 14,
                    leadingDistribution: TextLeadingDistribution.even,
                  ),
                  isPassword: true,
                ),
                const SizedBox(height: 16),
                Text(
                  S.current.lbl_password_confirm,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF212121),
                    height: 20 / 14,
                    leadingDistribution: TextLeadingDistribution.even,
                  ),
                ),
                const SizedBox(height: 4),
                CustomTextField(
                  controller: _rePasswordCtrl,
                  validator: (value) => ValidationHelper.match(
                    value,
                    _passwordCtrl.text,
                  ),
                  onError: (error) {
                    _confirmPasswordValidCtrl.value = error == null;
                  },
                  hintText: "**************",
                  hintStyle: const TextStyle(
                    color: Color(0xFF8C8C8C),
                    fontSize: 14,
                    height: 20 / 14,
                    leadingDistribution: TextLeadingDistribution.even,
                  ),
                  isPassword: true,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                        child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        InformationLayoutFieldWidget(
                          required: false,
                          label: "Ngày sinh",
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
                              if (birthDay != null) {
                                if (birthDay!.isUnder18yearsAgo()) {
                                  _birthDateError.value =
                                      "Yêu cầu trên 18 tuổi.";
                                } else {
                                  _birthDateError.value = null;
                                }
                              } else {
                                _birthDateError.value = "Nhập ngày sinh.";
                              }
                            },
                          ),
                        ),
                        Positioned(
                            bottom: -18,
                            child: ValueListenableBuilder(
                              valueListenable: _birthDateError,
                              builder: (context, value, child) {
                                return value != null
                                    ? Text(
                                        value,
                                        style: context.textTheme.bodySmall!
                                            .copyWith(
                                          color: AppColors.red10,
                                        ),
                                      )
                                    : const SizedBox();
                              },
                            ))
                      ],
                    )),
                    const SizedBox(width: 10),
                    Expanded(
                      child: GenderInput(
                        onChange: (sex) {
                          _gender = sex;
                          setState(() {});
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${S.current.note_about_passwords}:",
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          height: 20 / 14,
                          leadingDistribution: TextLeadingDistribution.even,
                          color: Color(0xFF6E6E6E)),
                    ),
                    const SizedBox(height: 8),
                    ValueListenableBuilder(
                      valueListenable: _passwordRuleCtrl,
                      builder: (context, rules, child) {
                        return Column(
                          children: PasswordRules.values
                              .map((e) => Container(
                                    margin: const EdgeInsets.only(bottom: 5),
                                    child: Row(
                                      children: [
                                        ImageWidget(
                                          rules.contains(e)
                                              ? IconAppConstants.icCheckCircle
                                              : IconAppConstants.icErrorCircle,
                                          width: 16,
                                          fit: BoxFit.cover,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          e.getText(),
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              height: 20 / 14,
                                              leadingDistribution:
                                                  TextLeadingDistribution.even,
                                              color: Color(0xFF6E6E6E)),
                                        ),
                                      ],
                                    ),
                                  ))
                              .toList(),
                        );
                      },
                    )
                  ],
                ),
                const SizedBox(height: 24),
                ValueListenableBuilder(
                  valueListenable: _formValidCtrl,
                  builder: (context, isValid, child) {
                    return PrimaryButton(
                      title: S.current.register.capitalize(),
                      onTap: _onRegister,
                      color: Colors.white,
                      disabled: !isValid,
                      width: MediaQuery.of(context).size.width,
                    );
                  },
                ),
                const SizedBox(height: 24),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Text.rich(
                      TextSpan(
                          style: context.text.bodyMedium!.copyWith(
                            color: context.theme.hintColor,
                          ),
                          children: [
                            TextSpan(
                              text: "${S.current.registration_is_consent_to}\n",
                            ),
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = context.startTermsAndCondition,
                              text: S.current.terms_of_service_and_policies,
                              style: context.text.titleMedium!.copyWith(
                                color: context.theme.primaryColor,
                              ),
                            ),
                            const TextSpan(text: " "),
                            TextSpan(text: S.current.by_vdone),
                          ]),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                KeyboardVisibilityBuilder(
                    builder: (context, isKeyboardVisible) {
                  return SizedBox(height: isKeyboardVisible ? 400 : 0);
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _onRegister() {
    showLoading();
    context.read<UserCubit>().phoneRegister(
          phone: _phoneCtrl.text.trim(),
          password: _passwordCtrl.text,
          phoneCode: _phoneCode.replaceAll("+", ""),
          birthday: birthDay?.toYYYYmmdd ?? '1999-01-01',
          sex: _gender ?? 0,
        );
  }
}
