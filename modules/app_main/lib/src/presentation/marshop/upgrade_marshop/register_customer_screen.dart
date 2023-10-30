import 'package:app_core/app_core.dart';
import 'package:app_main/src/blocs/marshop/marshop_cubit.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/data/models/payloads/marshop/marshop_payload.dart';
import 'package:app_main/src/presentation/authentication/widget/custom_text_field.dart';
import 'package:app_main/src/presentation/marshop/upgrade_marshop/upgrade_marshop_coordintor.dart';
import 'package:app_main/src/presentation/qr_code/qr_code_coordinator.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:ui/ui.dart';

import '../widgets/accept_term_with_checkbox_widget.dart';
import '../widgets/read_more_policy.dart';

class RegisterCustomerScreen extends StatefulWidget {
  static const String routeName = "upgrade-marshop";
  const RegisterCustomerScreen({super.key});

  @override
  State<RegisterCustomerScreen> createState() => _RegisterCustomerScreenState();
}

class _RegisterCustomerScreenState extends State<RegisterCustomerScreen>
    with ValidationMixin {
  final TextEditingController _marshopIdCtrl = TextEditingController();
  final _acceptTerm = ValueNotifier(false);

  bool get isValid => _acceptTerm.value && isValidForm;

  @override
  Widget build(BuildContext context) {
    return BlocListener<MarshopCubit, MarshopState>(
      listener: (context, state) {
        if (state is RegisterCustomerSuccess) {
          hideLoading();
          context.congratulationRegisterCustomer();
        }

        if (state is RegisterCustomerFailed) {
          hideLoading();
          showToastMessage(state.message, ToastMessageType.error);
        }
      },
      child: ScaffoldHideKeyboard(
        appBar: const BaseAppBar(title: "Đăng ký V-Shop"),
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(children: [
              const ReadMorePolicy(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: AcceptTermWithCheckboxWidget(acceptTerm: _acceptTerm),
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
                builder: (value) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: paddingHorizontal,
                    ),
                    child: PrimaryButton(
                      title: S.current.register,
                      // onTap: () => context.startDialogVerifyPhoneOTP(),
                      onTap: () => context
                          .read<MarshopCubit>()
                          .registerCustomer(RegisterCustomerPayload(
                            marshopId: int.parse(
                              _marshopIdCtrl.text.trim(),
                            ),
                          )),
                      disabled: !isValid,
                    ),
                  );
                },
              ),
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
