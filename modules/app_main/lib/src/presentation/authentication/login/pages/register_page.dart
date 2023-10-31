import 'package:app_core/app_core.dart';
import 'package:app_main/src/blocs/user/user_cubit.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/presentation/authentication/authentication_constants.dart';
import 'package:app_main/src/presentation/authentication/authentication_coordinator.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:localization/localization.dart';
import 'package:ui/ui.dart';

import '../../widget/custom_text_field.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({super.key});

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> with ValidationMixin {
  bool _passwordValid = false;
  bool _formValid = false;
  final List<PasswordRules> _rules = [];
  final _phoneCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _rePasswordCtrl = TextEditingController();
  String _phoneCode = "+84";

  @override
  void initState() {
    super.initState();
    _passwordCtrl.addListener(() {
      final password = _passwordCtrl.text;
      if (password.length >= 8) {
        _rules.add(PasswordRules.min8Character);
      } else {
        _rules.removeWhere((element) => element == PasswordRules.min8Character);
      }

      if (password.hasNumber) {
        _rules.add(PasswordRules.hasOneNumber);
      } else {
        _rules.removeWhere((element) => element == PasswordRules.hasOneNumber);
      }

      if (password.hasUppercase) {
        _rules.add(PasswordRules.hasOneCapital);
      } else {
        _rules.removeWhere((element) => element == PasswordRules.hasOneCapital);
      }

      if (_rules.length == PasswordRules.values.length) {
        _passwordValid = true;
      }
      setState(() {});
    });

    validationListener.addListener(() {
      _formValid = isValidForm;
      setState(() {});
    });
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
          );
        }

        if (state is PhoneRegisterFail) {
          hideLoading();
          showToastMessage(state.message, ToastMessageType.error);
        }
      },
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
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
                onChange: (value) => onValidation(),
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
                onChange: (value) => onValidation(),
                controller: _passwordCtrl,
                hintText: "**************",
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
                onChange: (value) => onValidation(),
                controller: _rePasswordCtrl,
                validator: (value) => ValidationHelper.match(
                  value,
                  _passwordCtrl.text,
                ),
                hintText: "**************",
                hintStyle: const TextStyle(
                  color: Color(0xFF8C8C8C),
                  fontSize: 14,
                  height: 20 / 14,
                  leadingDistribution: TextLeadingDistribution.even,
                ),
                isPassword: true,
              ),
              const SizedBox(height: 24),
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
                  Column(
                    children: PasswordRules.values
                        .map((e) => Container(
                              margin: const EdgeInsets.only(bottom: 5),
                              child: Row(
                                children: [
                                  ImageWidget(
                                    _rules.contains(e)
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
                  )
                ],
              ),
              const SizedBox(height: 24),
              PrimaryButton(
                title: S.current.register.capitalize(),
                onTap: _onRegister,
                color: Colors.white,
                disabled: !_formValid || !_passwordValid,
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
            ],
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
        );
  }
}
