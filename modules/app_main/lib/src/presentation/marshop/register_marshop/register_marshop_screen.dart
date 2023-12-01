import 'package:app_core/app_core.dart';
import 'package:app_main/src/blocs/user/user_cubit.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/presentation/marshop/marshop_constant.dart';
import 'package:app_main/src/presentation/marshop/marshop_coordinator.dart';
import 'package:app_main/src/presentation/marshop/register_marshop/register_marshop_coordinator.dart';
import 'package:app_main/src/presentation/qr_code/qr_code_constants.dart';
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
  final String? marshopId;
  const RegisterMarshopScreen({
    super.key,
    this.marshopId,
  });

  @override
  State<RegisterMarshopScreen> createState() => _RegisterMarshopScreenState();
}

class _RegisterMarshopScreenState extends State<RegisterMarshopScreen>
    with ValidationMixin {
  late final userCubit = context.read<UserCubit>();
  final TextEditingController _marshopIdCtrl = TextEditingController();
  final TextEditingController _marshopName = TextEditingController();
  final _acceptTerm = ValueNotifier(false);
  late User _authInfo;

  @override
  bool get conditionValidator => _acceptTerm.value;

  @override
  void initState() {
    super.initState();
    _authInfo = userCubit.currentUser!;
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
                userId: _authInfo.id!,
                marshopId: _marshopIdCtrl.text.trim().isNotEmpty
                    ? _marshopIdCtrl.text.trim()
                    : null,
                name: _marshopName.text.trim(),
                phone: _authInfo.phone ?? '',
              );
              return;
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
        appBar: const BaseAppBar(title: "Đăng ký tài khoản MarShop"),
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(children: [
              _buildForm(),
              const ReadMorePolicy(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: AcceptTermWithCheckboxWidget(
                  acceptTerm: _acceptTerm,
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
    context
        .startScanQrCode(
      showMyQr: false,
      type: QrCodeScanType.registerMarshop,
    )
        .then((results) {
      if (results != null && results is String) {
        _marshopIdCtrl.text = results;
        setState(() {});
        onValidation();
      }
    });
  }

  _buildForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: paddingHorizontal),
      child: Column(
        children: [
          _buildRules(),
          const SizedBox(height: 15),
          Row(
            children: [
              Assets.icons_ic_qrcode_png.image(width: 50),
              const SizedBox(width: 15),
              Expanded(
                child: CustomTextField(
                  controller: _marshopIdCtrl,
                  hintText: "Nhập ID Marshop giới thiệu",
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () => context.startMarshopReferralScreen(),
            child: Text(
              "Bạn chưa có MarShop giới thiệu ?",
              style: context.text.bodyMedium!.copyWith(
                color: context.theme.primaryColor,
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  _buildRules() {
    return Column(
      children: RegisterMarshopRule.values.reversed
          .map((e) => Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: [
                    Assets.icons_shape_check_fail.image(
                      width: 25,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      e.getText(),
                      style: context.textTheme.titleMedium,
                    ),
                  ],
                ),
              ))
          .toList(),
    );
  }
}
