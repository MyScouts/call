import 'package:app_core/app_core.dart';
import 'package:app_main/src/blocs/user/user_cubit.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/data/models/payloads/auth/authentication_phone_payload.dart';
import 'package:app_main/src/presentation/authentication/components/custom_text_field.dart';
import 'package:app_main/src/presentation/dashboard/dashboard_coordinator.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:localization/localization.dart';
import 'package:ui/ui.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> with ValidationMixin {
  bool _buttonDisabled = true;
  final _phoneCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();

    validationListener.addListener(() {
      _buttonDisabled = !isValidForm;
      setState(() {});
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
                  leadingDistribution: TextLeadingDistribution.even,
                ),
              ),
              const SizedBox(height: 4),
              CustomTextField(
                key: const ValueKey("phone"),
                onChange: (value) => onValidation(),
                controller: _phoneCtrl,
                validator: ValidationHelper.phone,
                textInputType: TextInputType.number,
                prefixIcon: IntrinsicHeight(
                  child: _buildVgFlag(),
                ),
                hintText: S.current.phone_placeholder.capitalize(),
                hintStyle: const TextStyle(
                  color: Color(0xFF8C8C8C),
                  fontSize: 14,
                  height: 20 / 14,
                  leadingDistribution: TextLeadingDistribution.even,
                ),
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
              const SizedBox(
                height: 4,
              ),
              CustomTextField(
                controller: _passwordCtrl,
                validator: ValidationHelper.password,
                hintText: "**************",
                onChange: (value) => onValidation(),
                hintStyle: const TextStyle(
                  color: Color(0xFF8C8C8C),
                  fontSize: 14,
                  height: 20 / 14,
                  leadingDistribution: TextLeadingDistribution.even,
                ),
                isPassword: true,
              ),
              const SizedBox(
                height: 16,
              ),
              const Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Text.rich(
                    TextSpan(
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF8C8C8C),
                          height: 20 / 14,
                          leadingDistribution: TextLeadingDistribution.even,
                        ),
                        children: [
                          TextSpan(text: "Bằng việc đăng ký là đồng ý với\n"),
                          TextSpan(
                              text: "Điều khoản dịch vụ và Chính sách",
                              style: TextStyle(color: Color(0xFF085CAF))),
                          TextSpan(text: " của VDONE"),
                        ]),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              PrimaryButton(
                title: "Đăng nhập",
                onTap: _onLogin,
                color: Colors.white,
                disabled: _buttonDisabled,
              ),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                  child: InkWell(
                    onTap: () {},
                    child: const Text(
                      "Quên mật khẩu?",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        height: 20 / 14,
                        leadingDistribution: TextLeadingDistribution.even,
                        color: Color(0xFF8C8C8C),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _onLogin() {
    if (formKey.currentState!.validate()) {
      showLoading();
      context.read<UserCubit>().phoneLogin(
            AuthenticationPhonePayload(
              phoneNumber: _phoneCtrl.text.trim(),
              password: _passwordCtrl.text,
              phoneCode: "84",
            ),
          );
      return;
    }
  }

  _buildVgFlag() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          child: ImageWidget(
            IconAppConstants.icPhone,
            width: 24,
            fit: BoxFit.cover,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: VerticalDivider(
            color: Color(0xFFD9D9D9),
            thickness: 1,
            width: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            children: [
              ImageWidget(
                IconAppConstants.icVnFlag,
                width: 22,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                width: 4,
              ),
              const Text(
                "+84",
                style: TextStyle(
                  color: Color(0xFF212121),
                  height: 20 / 14,
                  leadingDistribution: TextLeadingDistribution.even,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
