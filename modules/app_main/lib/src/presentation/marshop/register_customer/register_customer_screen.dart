import 'package:app_core/app_core.dart';
import 'package:app_main/src/blocs/auth/auth_cubit.dart';
import 'package:app_main/src/blocs/marshop/marshop_cubit.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/presentation/app_coordinator.dart';
import 'package:app_main/src/presentation/authentication/widget/custom_text_field.dart';
import 'package:app_main/src/presentation/marshop/register_customer/register_customer_coordinator.dart';
import 'package:app_main/src/presentation/qr_code/qr_code_coordinator.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:ui/ui.dart';

import '../widgets/accept_term_with_checkbox_widget.dart';
import '../widgets/read_more_policy.dart';

class RegisterCustomerScreen extends StatefulWidget {
  static const String routeName = "upgrade-marshop";
  final String? marshopId;
  const RegisterCustomerScreen({
    super.key,
    this.marshopId,
  });

  @override
  State<RegisterCustomerScreen> createState() => _RegisterCustomerScreenState();
}

class _RegisterCustomerScreenState extends State<RegisterCustomerScreen>
    with ValidationMixin {
  final TextEditingController _marshopIdCtrl = TextEditingController();
  final _acceptTerm = ValueNotifier(false);

  @override
  bool get conditionValidator => _acceptTerm.value;

  @override
  void initState() {
    super.initState();
    if (widget.marshopId != null) {
      _marshopIdCtrl.text = widget.marshopId!;
    }
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
            if (state is RegisterCustomerSuccess) {
              hideLoading();
              context.congratulationRegisterCustomer();
            }

            if (state is RegisterCustomerFailed) {
              hideLoading();
              showToastMessage(state.message, ToastMessageType.error);
            }
          },
        ),
        BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is SendOTPSuccess) {
              hideLoading();
              context.startDialogVerifyPhoneOTP(
                marshopId: int.parse(_marshopIdCtrl.text.trim()),
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
        appBar: const BaseAppBar(title: "Nâng cấp khách hàng thường xuyên"),
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
                      width: MediaQuery.of(context).size.width,
                      title: S.current.register,
                      onTap: () {
                        showLoading();
                        context.read<AuthCubit>().sendOTP();
                      },
                      disabled: !isValid,
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
    context.startScanQrCode(showMyQr: false).then((results) {
      if (results != null && results is String) {
        if (!results.isNumber()) {
          showToastMessage("Mã Marshop không hợp lệ!", ToastMessageType.error);
          return;
        }
        _marshopIdCtrl.text = results;
        setState(() {});
        onValidation();
      }
    });
  }
}
