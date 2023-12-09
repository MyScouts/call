import 'package:app_core/app_core.dart';
import 'package:app_main/src/blocs/auth/auth_cubit.dart';
import 'package:app_main/src/blocs/marshop/marshop_cubit.dart';
import 'package:app_main/src/blocs/user/user_cubit.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/data/models/payloads/marshop/marshop_payload.dart';
import 'package:app_main/src/data/models/responses/marshop_response.dart';
import 'package:app_main/src/presentation/app_coordinator.dart';
import 'package:app_main/src/presentation/authentication/widget/custom_text_field.dart';
import 'package:app_main/src/presentation/marshop/marshop_bloc.dart';
import 'package:app_main/src/presentation/marshop/register_customer/register_customer_coordinator.dart';
import 'package:app_main/src/presentation/qr_code/qr_code_constants.dart';
import 'package:app_main/src/presentation/qr_code/qr_code_coordinator.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:mobilehub_bloc/mobilehub_bloc.dart';
import 'package:mobilehub_ui_core/mobilehub_ui_core.dart';
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
  MarshopDetailBloc get _marshopDetailBloc => context.read();
  final _acceptTerm = ValueNotifier(false);
  late final userCubit = context.read<UserCubit>();
  final _marshopIdValidCtrl = ValueNotifier<MarshopResponse?>(null);

  @override
  bool get conditionValidator =>
      _acceptTerm.value && _marshopIdValidCtrl.value != null;
  late User _authInfo;

  @override
  void initState() {
    super.initState();
    _authInfo = userCubit.currentUser!;
    userCubit.onboarding();
    if (widget.marshopId != null) {
      _marshopIdCtrl.text = widget.marshopId!;
    }
    _acceptTerm.addListener(() {
      onValidation();
    });

    _marshopIdCtrl.addListener(() => _handleCheckMarshop());
  }

  _handleCheckMarshop() {
    EasyDebounce.debounce(
        "CheckMarshopExits",
        const Duration(seconds: 1),
        () => _marshopDetailBloc.add(
              GetDetailDataParam1Event(
                GetMarshopInfoPayload(
                  pdoneId: _marshopIdCtrl.text.trim().toUpperCase(),
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<UserCubit, UserState>(
          listener: (context, state) {
            if (state is OnGetOnboarding) {
              showLoading();
            }

            if (state is OnboardingFail) {
              hideLoading();
              showToastMessage("Lỗi hệ thống vui lòng thử lại sau");
            }

            if (state is OnboardingSuccess) {
              hideLoading();
              if (state.onboarding.isMarshopCustomer) {
                context.showToastMessage("Bạn đã là khách hàng thường xuyên.");
                context.pop();
                return;
              }
            }
          },
        ),
        BlocListener<MarshopDetailBloc, GetDetailState>(
          listener: _marshopDetailListener,
        ),
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
                marshopId: _marshopIdValidCtrl.value!.id,
                phone: _authInfo.phone ?? '',
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
              _buildMarshopInput(),
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
    context
        .startScanQrCode(
      showMyQr: false,
      type: QrCodeScanType.registerCustomer,
    )
        .then((results) {
      if (results != null && results is String) {
        _marshopIdCtrl.text = results;
        _handleCheckMarshop();
      }
    });
  }

  void _marshopDetailListener(BuildContext context, GetDetailState state) {
    _marshopIdValidCtrl.value = null;
    if (state is GetDetailDataSuccess<MarshopResponse>) {
      if (_marshopIdCtrl.text.isEmpty) {
        _marshopIdCtrl.text = state.data.code;
      }
      _marshopIdValidCtrl.value = state.data;
      onValidation();
    }

    if (state is GetDetailError<MarshopResponse>) {
      onValidation();
    }
    setState(() {});
  }

  _buildMarshopInput() {
    return BlocBuilder<MarshopDetailBloc, GetDetailState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: paddingHorizontal),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  CustomTextField(
                    label: "ID MarShop",
                    controller: _marshopIdCtrl,
                    onChange: (value) => onValidation(),
                    hintText: "",
                    prefixIcon: GestureDetector(
                      onTap: _startQrCodeScan,
                      child: const Icon(Icons.qr_code),
                    ),
                  ),
                  if (state is GetDetailDataLoading)
                    const Positioned(
                      top: 20,
                      bottom: 0,
                      right: 10,
                      child: LoadingWidget(),
                    )
                ],
              ),
              if (state is GetDetailError || _marshopIdCtrl.text.trim().isEmpty)
                const SizedBox(height: 5),
              if (state is GetDetailError || _marshopIdCtrl.text.trim().isEmpty)
                Text(
                  _marshopIdCtrl.text.trim().isEmpty
                      ? "Vui lòng nhập ID MarShop"
                      : "ID MarShop không tồn tại!",
                  style: context.textTheme.titleSmall!.copyWith(
                    color: Colors.red,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
