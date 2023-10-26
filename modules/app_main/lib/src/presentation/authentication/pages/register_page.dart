import 'package:app_core/app_core.dart';
import 'package:app_main/src/blocs/user/user_cubit.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/presentation/authentication/authentication_coordinator.dart';
import 'package:app_main/src/presentation/authentication/components/custom_submit_button.dart';
import 'package:app_main/src/presentation/authentication/components/custom_text_field.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({super.key});

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> with ValidationMixin {
  final _phoneCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _rePasswordCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit, UserState>(
      listener: (context, state) {
        if (state is PhoneRegisterSuccess) {
          hideLoading();
          context.startVerifyOtp(
            phoneCode: "84",
            phoneNumber: _phoneCtrl.text.trim(),
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
              const Text(
                "Số điện thoại",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF212121),
                    height: 20 / 14,
                    leadingDistribution: TextLeadingDistribution.even),
              ),
              const SizedBox(
                height: 4,
              ),
              CustomTextField(
                controller: _phoneCtrl,
                prefixIcon: IntrinsicHeight(
                  child: Row(
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
                                leadingDistribution:
                                    TextLeadingDistribution.even,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                hintText: "Nhập số điện thoại",
                hintStyle: const TextStyle(
                  color: Color(0xFF8C8C8C),
                  fontSize: 14,
                  height: 20 / 14,
                  leadingDistribution: TextLeadingDistribution.even,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Mật khẩu",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF212121),
                    height: 20 / 14,
                    leadingDistribution: TextLeadingDistribution.even),
              ),
              const SizedBox(height: 4),
              CustomTextField(
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
              const Text(
                "Nhập lại mật khẩu",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF212121),
                    height: 20 / 14,
                    leadingDistribution: TextLeadingDistribution.even),
              ),
              const SizedBox(height: 4),
              CustomTextField(
                controller: _rePasswordCtrl,
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
                  const Text(
                    "Lưu ý về mật khẩu:",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        height: 20 / 14,
                        leadingDistribution: TextLeadingDistribution.even,
                        color: Color(0xFF6E6E6E)),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      ImageWidget(
                        IconAppConstants.icUncheckCircle,
                        width: 16,
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        "Tối thiểu 8 ký tự",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            height: 20 / 14,
                            leadingDistribution: TextLeadingDistribution.even,
                            color: Color(0xFF6E6E6E)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      SvgPicture.asset(
                        IconAppConstants.icUncheckCircle,
                        width: 16,
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        "Có ít nhất một ký tự viết hoa",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            height: 20 / 14,
                            leadingDistribution: TextLeadingDistribution.even,
                            color: Color(0xFF6E6E6E)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      SvgPicture.asset(
                        IconAppConstants.icUncheckCircle,
                        width: 16,
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        "Có ít nhất 1 chữ số",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            height: 20 / 14,
                            leadingDistribution: TextLeadingDistribution.even,
                            color: Color(0xFF6E6E6E)),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),
              CustomSubmitButton(
                title: "Đăng ký",
                onTap: _onRegister,
                color: Colors.white,
                gradientBackgroundColor: const LinearGradient(
                  colors: [
                    Color(0xFF015CB5),
                    Color(0xFF0E86FC),
                  ],
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(1.0, 0.0),
                ),
              ),
              const SizedBox(height: 24),
              const Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 12,
                  ),
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
          phoneCode: "84",
        );
  }
}
