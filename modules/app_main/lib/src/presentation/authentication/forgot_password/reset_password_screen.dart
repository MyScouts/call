import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/data/models/payloads/auth/authentication_payload.dart';
import 'package:app_main/src/presentation/dashboard/dashboard_coordinator.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:localization/localization.dart';
import 'package:ui/ui.dart';

import '../../../blocs/user/user_cubit.dart';
import '../authentication_constants.dart';
import '../widget/custom_text_field.dart';

class ResetPasswordScreen extends StatefulWidget {
  static const String routerName = "reset-password";
  final String phoneNumber;
  final String phoneCode;
  final String ott;
  const ResetPasswordScreen({
    super.key,
    required this.ott,
    required this.phoneCode,
    required this.phoneNumber,
  });

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen>
    with ValidationMixin {
  final List<PasswordRules> _rules = [];
  bool _passwordValid = false;
  bool _formValid = false;
  final _passwordCtrl = TextEditingController();
  final _rePasswordCtrl = TextEditingController();
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
        if (state is ResetPasswordSuccess) {
          hideLoading();
          showToastMessage(
            "Đặt lại mật khẩu thành công",
            ToastMessageType.success,
          );
          context.startDashboardUtil();
        }

        if (state is ResetPasswordFail) {
          hideLoading();
          showToastMessage(state.message, ToastMessageType.error);
        }
      },
      child: ScaffoldHideKeyboard(
        body: Column(
          children: [
            Stack(
              children: [
                ImageWidget(
                  ImageConstants.defaultAuthBg,
                  fit: BoxFit.fitWidth,
                ),
                Positioned(
                  left: paddingHorizontal,
                  top: MediaQuery.of(context).padding.top,
                  child: const CustomBackButton(
                    color: AppColors.white,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      ImageWidget(
                        ImageConstants.defaultAppLogo,
                        width: 100,
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 24),
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Đặt lại mật khẩu",
                          style: context.text.titleLarge!
                              .copyWith(fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          S.current.lbl_password,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF212121),
                              height: 20 / 14,
                              leadingDistribution:
                                  TextLeadingDistribution.even),
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
                                  leadingDistribution:
                                      TextLeadingDistribution.even,
                                  color: Color(0xFF6E6E6E)),
                            ),
                            const SizedBox(height: 8),
                            Column(
                              children: PasswordRules.values
                                  .map((e) => Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 5),
                                        child: Row(
                                          children: [
                                            ImageWidget(
                                              _rules.contains(e)
                                                  ? IconAppConstants
                                                      .icCheckCircle
                                                  : IconAppConstants
                                                      .icErrorCircle,
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
                                                      TextLeadingDistribution
                                                          .even,
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
                          title: S.current.confirm.capitalize(),
                          onTap: _onResetPassword,
                          color: Colors.white,
                          disabled: !_formValid || !_passwordValid,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _onResetPassword() {
    showLoading();
    context.read<UserCubit>().resetPassword(
          ResetPasswordPayload(password: _passwordCtrl.text, ott: widget.ott),
        );
  }
}
