import 'package:app_core/app_core.dart';
import 'package:app_main/src/blocs/user/user_cubit.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/data/models/payloads/auth/authentication_payload.dart';
import 'package:app_main/src/presentation/authentication/authentication_coordinator.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:localization/localization.dart';
import 'package:ui/ui.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const String routeName = "forgot-password";
  const ForgotPasswordScreen({
    super.key,
  });

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen>
    with ValidationMixin {
  final TextEditingController _phoneCtrl = TextEditingController();
  String _phoneCode = "+84";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocListener<UserCubit, UserState>(
      listener: (context, state) {
        if (state is ForgotPasswordSuccess) {
          hideLoading();
          context.startResetPasswordToken(
            phoneNumber: _phoneCtrl.text.trim(),
            phoneCode: _phoneCode,
          );
        }

        if (state is ForgotPasswordFail) {
          hideLoading();
          showToastMessage(state.message, ToastMessageType.error);
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  width: size.width,
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
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: paddingHorizontal,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
                    Text(
                      "Quên mật khẩu",
                      style: context.text.titleLarge!
                          .copyWith(fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "Nhập số điện thoại đã đăng ký tài khoản",
                      style: context.text.bodySmall,
                    ),
                    const SizedBox(height: 24),
                    buildForm(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  buildForm() {
    return Expanded(
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppPhoneInput(
                controller: _phoneCtrl,
                onChange: (value) => onValidation(),
                onPhoneCodeChange: (p0) {
                  if (p0.dialCode != null) {
                    _phoneCode = p0.dialCode!;
                  }
                },
              ),
              const SizedBox(height: 24),
              validationListenableBuilder(
                builder: (isValid) {
                  return PrimaryButton(
                    title: S.current.lbl_continue.capitalize(),
                    onTap: () {
                      showLoading();
                      context.read<UserCubit>().forgotPassword(
                            ForgotPasswordPayload(
                              phoneNumber: _phoneCtrl.text.trim(),
                              phoneCode: _phoneCode.replaceAll("+", ""),
                            ),
                          );
                    },
                    disabled: !isValid,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
