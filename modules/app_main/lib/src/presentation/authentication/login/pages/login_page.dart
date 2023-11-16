import 'dart:math';

import 'package:app_core/app_core.dart';
import 'package:app_main/src/blocs/user/user_cubit.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/data/models/payloads/auth/authentication_phone_payload.dart';
import 'package:app_main/src/presentation/authentication/authentication_coordinator.dart';
import 'package:app_main/src/presentation/authentication/widget/custom_text_field.dart';
import 'package:app_main/src/presentation/dashboard/dashboard_coordinator.dart';
import 'package:app_main/src/presentation/general_setting/general_coordinator.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:localization/localization.dart';
import 'package:ui/ui.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  String _phoneCode = "+84";
  final _phoneCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _phoneValidCtrl = ValueNotifier(false);
  final _passwordValidCtrl = ValueNotifier(false);
  final _formCtrl = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    _passwordValidCtrl.addListener(() {
      _formCtrl.value = _passwordValidCtrl.value && _phoneValidCtrl.value;
    });
    _phoneValidCtrl.addListener(() {
      _formCtrl.value = _passwordValidCtrl.value && _phoneValidCtrl.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit, UserState>(
      listener: (context, state) {
        if (state is PhoneLoginSuccess) {
          hideLoading();
          context.startDashboardUtil();
        }

        if (state is PhoneLoginFail) {
          hideLoading();
          showToastMessage(
            state.message,
            ToastMessageType.error,
          );
        }
      },
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Form(
            autovalidateMode: AutovalidateMode.disabled,
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
                      leadingDistribution: TextLeadingDistribution.even,
                    ),
                  ),
                  const SizedBox(height: 4),
                  AppPhoneInput(
                    controller: _phoneCtrl,
                    onError: (error) {
                      _phoneValidCtrl.value = error == null;
                    },
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
                    S.current.lbl_password.capitalize(),
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF212121),
                        height: 20 / 14,
                        leadingDistribution: TextLeadingDistribution.even),
                  ),
                  const SizedBox(height: 4),
                  CustomTextField(
                    controller: _passwordCtrl,
                    validator: ValidationHelper.password,
                    onError: (error) {
                      _passwordValidCtrl.value = error == null;
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
                  const SizedBox(height: 16),
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
                                text:
                                    "${S.current.registration_is_consent_to}\n",
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
                  const SizedBox(height: 12),
                  ValueListenableBuilder(
                    valueListenable: _formCtrl,
                    builder: (context, isValid, child) {
                      return PrimaryButton(
                        title: S.current.login,
                        onTap: _onLogin,
                        color: Colors.white,
                        disabled: !isValid,
                        width: MediaQuery.of(context).size.width,
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: InkWell(
                      onTap: () => context.startForgotPassword(),
                      child: Text(
                        S.current.forgot_password,
                        style: context.text.titleMedium!.copyWith(
                          color: AppColors.grey20,
                          fontWeight: FontWeight.w700,
                        ),
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
      ),
    );
  }

  _onLogin() {
    showLoading();
    context.read<UserCubit>().phoneLogin(
          AuthenticationPhonePayload(
            phoneNumber: _phoneCtrl.text.trim(),
            password: _passwordCtrl.text,
            phoneCode: _phoneCode.replaceAll("+", ""),
          ),
        );
    return;
  }
}
