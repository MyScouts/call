import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/presentation/marshop/register_marshop/register_marshop_coordinator.dart';
import 'package:app_main/src/presentation/qr_code/qr_code_coordinator.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:ui/ui.dart';

import '../../../blocs/auth/auth_cubit.dart';
import '../../../blocs/marshop/marshop_cubit.dart';
import '../../authentication/widget/custom_text_field.dart';
import '../widgets/accept_term_with_checkbox_widget.dart';
import '../widgets/read_more_policy.dart';

class RegisterMarshopScreen extends StatefulWidget {
  static const String routeName = "register-marshop";
  const RegisterMarshopScreen({super.key});

  @override
  State<RegisterMarshopScreen> createState() => _RegisterMarshopScreenState();
}

class _RegisterMarshopScreenState extends State<RegisterMarshopScreen>
    with ValidationMixin {
  final TextEditingController _marshopIdCtrl = TextEditingController();
  final TextEditingController _marshopName = TextEditingController();
  final _acceptTerm = ValueNotifier(false);

  @override
  bool get conditionValidator => _acceptTerm.value;

  @override
  void initState() {
    super.initState();
    _acceptTerm.addListener(() {
      onValidation();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<MarshopCubit, MarshopState>(
          listener: (context, state) {
            if (state is RegisterMarshopSuccess) {
              hideLoading();
              context.congratulationRegisterMarshop();
            }

            if (state is RegisterMarshopFail) {
              hideLoading();
              showToastMessage(state.message, ToastMessageType.error);
            }
          },
        ),
        BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is SendOTPSuccess) {
              hideLoading();
              context.startDialogVerifyRegisterMarshop(
                marshopId: int.parse(_marshopIdCtrl.text.trim()),
                name: _marshopName.text.trim(),
              );
            }

            if (state is SendOTPFail) {
              hideLoading();
              showToastMessage(
                  "Gởi OTP không thành công", ToastMessageType.error);
            }
          },
        ),
      ],
      child: ScaffoldHideKeyboard(
        appBar: const BaseAppBar(title: "Đăng ký V-SHOP"),
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(children: [
              const ReadMorePolicy(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: AcceptTermWithCheckboxWidget(
                  acceptTerm: _acceptTerm,
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: paddingHorizontal),
                child: CustomTextField(
                  label: "Tên shop",
                  controller: _marshopName,
                  onChange: (value) => onValidation(),
                  hintText: "",
                  validator: (value) =>
                      ValidationHelper.requiredValid(value, "Tên shop"),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: paddingHorizontal),
                child: CustomTextField(
                  label: "Mã marshop",
                  controller: _marshopIdCtrl,
                  onChange: (value) => onValidation(),
                  hintText: "",
                  textInputType: TextInputType.number,
                  validator: (value) =>
                      ValidationHelper.requiredValid(value, "MarshopId"),
                  prefixIcon: GestureDetector(
                    onTap: _startQrCodeScan,
                    child: const Icon(Icons.qr_code),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              validationListenableBuilder(
                builder: (isValid) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: paddingHorizontal,
                    ),
                    child: PrimaryButton(
                      title: S.current.register,
                      onTap: () {
                        showLoading();
                        context.read<AuthCubit>().sendOTP();
                      },
                      disabled: !isValid,
                      width: MediaQuery.of(context).size.width,
                    ),
                  );
                },
              )
            ]),
          ),
        ),
      ),
    );
  }

  void _startQrCodeScan() async {
    String? results = await context.startScanQrCode();
    if (results != null) {
      if (!results.isNumber()) {
        showToastMessage("Mã Marshop không hợp lệ!");
        return;
      }
      _marshopIdCtrl.text = results;
      setState(() {});
      onValidation();
    }
  }
}
