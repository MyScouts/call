import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/extensions/list_extension.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/domain/entities/change_password_payload.dart';
import 'package:app_main/src/domain/usecases/authentication_usecase.dart';
import 'package:app_main/src/presentation/authentication/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:ui/ui.dart';

class ChangePassword extends StatefulWidget {
  static const String routerName = '/change-password';

  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> with ValidationMixin {
  final TextEditingController oldPass = TextEditingController();
  final TextEditingController newPass = TextEditingController();
  final TextEditingController reConfirmPass = TextEditingController();
  final ChangePasswordController controller = getIt<ChangePasswordController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text(
          'Cài đặt bảo mật',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: const [
          CloseButton(),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Text(
                'Mật khẩu cũ',
                style: TextStyle(fontSize: 12, color: Colors.black),
              ),
              CustomTextField(
                controller: oldPass,
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
              const Text(
                'Mật khẩu mới',
                style: TextStyle(fontSize: 12, color: Colors.black),
              ),
              CustomTextField(
                controller: newPass,
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
              const Text(
                'Nhập lại mật khẩu mới',
                style: TextStyle(fontSize: 12, color: Colors.black),
              ),
              CustomTextField(
                controller: reConfirmPass,
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
              PrimaryButton(
                title: 'Đổi mật khẩu',
                onTap: () async {
                  if(newPass.text.trim().isEmpty) {
                    showToastMessage(
                      "Không được để trống",
                      ToastMessageType.error,
                    );
                    return;
                  }
                  if (newPass.text != reConfirmPass.text) {
                    showToastMessage(
                      "Mật khẩu không khớp",
                      ToastMessageType.error,
                    );
                    return;
                  }
                  showLoading();
                  final ok = await controller.changePassword(
                    oldPass.text,
                    newPass.text,
                  );
                  hideLoading();
                  if (ok) {
                    showToastMessage("Yêu cầu đã được gửi thành công");
                  } else {
                    showToastMessage(
                      "Mật khẩu không đúng",
                      ToastMessageType.error,
                    );
                  }
                },
                color: Colors.white,
                disabled: false,
                width: MediaQuery.of(context).size.width,
              ),
            ].separated(const SizedBox(height: 10)),
          ),
        ),
      ),
    );
  }
}

@injectable
class ChangePasswordController extends ChangeNotifier {
  final AuthenticationUsecase useCase;

  ChangePasswordController(this.useCase);

  Future<bool> changePassword(String current, String pass) async {
    try {
      await useCase.changePassword(ChangePasswordPayload(
        currentPassword: current,
        newPassword: pass,
        confirmPassword: pass,
      ));
      return true;
    } catch (e) {
      return false;
    }
  }
}
