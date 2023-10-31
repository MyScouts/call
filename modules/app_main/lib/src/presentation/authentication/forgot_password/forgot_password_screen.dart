import 'package:app_core/app_core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:localization/localization.dart';
import 'package:ui/ui.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const String routeName = "forgot-password";
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen>
    with ValidationMixin {
  final TextEditingController _phoneCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
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
                child: CustomBackButton(
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
              ),
              const SizedBox(height: 24),
              validationListenableBuilder(
                builder: (isValid) {
                  return PrimaryButton(
                    title: S.current.lbl_continue.capitalize(),
                    onTap: () {},
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
