import 'package:app_core/app_core.dart';
import 'package:app_main/src/blocs/user/user_cubit.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/data/models/payloads/marshop/marshop_payload.dart';
import 'package:app_main/src/data/models/responses/marshop_response.dart';
import 'package:app_main/src/presentation/app_coordinator.dart';
import 'package:app_main/src/presentation/marshop/marshop_constant.dart';
import 'package:app_main/src/presentation/marshop/marshop_coordinator.dart';
import 'package:app_main/src/presentation/marshop/register_marshop/register_marshop_coordinator.dart';
import 'package:app_main/src/presentation/qr_code/qr_code_constants.dart';
import 'package:app_main/src/presentation/qr_code/qr_code_coordinator.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:mobilehub_bloc/mobilehub_bloc.dart';
import 'package:ui/ui.dart';

import '../../../blocs/auth/auth_cubit.dart';
import '../../../blocs/marshop/marshop_cubit.dart';
import '../../authentication/widget/custom_text_field.dart';
import '../marshop_bloc.dart';
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

class _RegisterMarshopScreenState extends State<RegisterMarshopScreen> {
  late final userCubit = context.read<UserCubit>();
  MarshopDetailBloc get _marshopDetailBloc => context.read();
  final TextEditingController _marshopIdCtrl = TextEditingController();
  final _formCtrl = ValueNotifier(false);
  final _acceptTerm = ValueNotifier(false);
  final ValueNotifier<List<RegisterMarshopRule>> _rulesCtrl = ValueNotifier([]);
  final _marshopIdValidCtrl = ValueNotifier(false);
  MarshopResponse? marshop;
  late User _authInfo;

  @override
  void initState() {
    super.initState();
    _authInfo = userCubit.currentUser!;
    context.read<MarshopCubit>().getMarShopInfo(userId: _authInfo.id!);
    userCubit.onboarding();
    if (widget.marshopId != null) {
      _marshopIdCtrl.text = widget.marshopId!;
    }

    _marshopIdCtrl.addListener(() => _handleCheckMarshop());
    _acceptTerm.addListener(() {
      onValidation();
    });
  }

  onValidation() {
    _formCtrl.value = _acceptTerm.value &&
        _rulesCtrl.value.length == 2 &&
        _marshopIdValidCtrl.value;
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
        BlocListener<MarshopCubit, MarshopState>(
          listener: marshopCubitListener,
        ),
        BlocListener<UserCubit, UserState>(
          listener: _userCubitListener,
        ),
        BlocListener<AuthCubit, AuthState>(
          listener: _authCubitListener,
        ),
        BlocListener<MarshopDetailBloc, GetDetailState>(
          listener: _marshopDetailListener,
        ),
      ],
      child: ScaffoldHideKeyboard(
        appBar: const BaseAppBar(title: "Đăng ký tài khoản MarShop"),
        body: Form(
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
              ValueListenableBuilder(
                  valueListenable: _formCtrl,
                  builder: (_, valid, child) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: paddingHorizontal,
                      ),
                      child: PrimaryButton(
                        title: S.current.register,
                        onTap: () => context.tartRegisterPackScreen(
                          authInfo: _authInfo,
                          marshop: marshop!,
                        ),
                        disabled: !valid,
                        width: MediaQuery.of(context).size.width,
                      ),
                    );
                  })
            ]),
          ),
        ),
      ),
    );
  }

  _buildForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: paddingHorizontal),
      child: Column(
        children: [
          _buildRules(),
          const SizedBox(height: 15),
          ValueListenableBuilder(
              valueListenable: _marshopIdValidCtrl,
              builder: (_, valid, child) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onDoubleTap: _startQrCodeScan,
                      child: Assets.icons_ic_qrcode_png.image(width: 50),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextField(
                            controller: _marshopIdCtrl,
                            hintText: "Nhập ID Marshop giới thiệu",
                            suffixIcon: Icon(
                              valid ? Icons.check : Icons.error,
                              color: valid
                                  ? context.theme.primaryColor
                                  : Colors.red,
                            ),
                          ),
                          const SizedBox(height: 5),
                          if (!valid && _marshopIdCtrl.text.isNotEmpty)
                            Text(
                              "ID MarShop không tồn tại!",
                              style: context.textTheme.titleSmall!.copyWith(
                                color: Colors.red,
                              ),
                            )
                        ],
                      ),
                    ),
                  ],
                );
              }),
          const SizedBox(height: 5),
          GestureDetector(
            onTap: () => context.startMarshopReferralScreen().then((value) {
              if (value != null && value is String) {
                _marshopIdCtrl.text = value;
              }
            }),
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
      children: RegisterMarshopRule.values.map((e) {
        return ValueListenableBuilder(
          valueListenable: _rulesCtrl,
          builder: (context, rules, child) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                children: [
                  if (rules.contains(e))
                    Assets.icons_shape_check_success.image(
                      width: 25,
                      fit: BoxFit.cover,
                    ),
                  if (!rules.contains(e))
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
            );
          },
        );
      }).toList(),
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

  void marshopCubitListener(BuildContext context, MarshopState state) {
    if (state is RegisterMarshopSuccess) {
      hideLoading();
      context.congratulationRegisterMarshop();
    }

    if (state is RegisterMarshopFail) {
      hideLoading();
      showToastMessage(state.message, ToastMessageType.error);
    }

    if (state is OnGetMarShopInfo) {
      showLoading();
    }

    if (state is GetMarShopInfoSuccess) {
      hideLoading();
      context.pop();
      showToastMessage("Bạn đã là MarShop");
    }

    if (state is GetMarShopInfoFail) {
      hideLoading();
      switch (state.code) {
        case "MARSHOP_NOT_APPROVED":
          context.pop();
          showToastMessage("Yêu cầu đăng ký MarShop đang được chờ duyệt.");
          break;
        case "MARSHOP_NOT_FOUND":
          break;
        default:
          context.pop();
          showToastMessage("Lỗi hệ thống.");
      }
    }
  }

  void _userCubitListener(BuildContext context, UserState state) {
    if (state is OnboardingSuccess) {
      final onboarding = state.onboarding;
      List<RegisterMarshopRule> rules = [];
      if (onboarding.isJA) {
        rules.add(RegisterMarshopRule.isJA);
      }

      if (onboarding.marshopCustomerId != null) {
        rules.add(RegisterMarshopRule.isRefIdMarshop);
        _marshopDetailBloc.add(
          GetDetailDataParam1Event(
            GetMarshopInfoPayload(
              marshopId: onboarding.marshopCustomerId,
              userId: _authInfo.id,
            ),
          ),
        );
      }
      _rulesCtrl.value = rules;
    }
  }

  void _authCubitListener(BuildContext context, AuthState state) {
    if (state is SendOTPSuccess) {
      hideLoading();
      context.startDialogVerifyRegisterMarshop(
        userId: _authInfo.id!,
        marshopId: _marshopIdCtrl.text.trim().isNotEmpty
            ? _marshopIdCtrl.text.trim()
            : null,
        name: "",
        phone: _authInfo.phone ?? '',
      );
      return;
    }

    if (state is SendOTPFail) {
      hideLoading();
      showToastMessage(
        "Gởi OTP không thành công",
        ToastMessageType.error,
      );
    }
  }

  void _marshopDetailListener(BuildContext context, GetDetailState state) {
    final rules = _rulesCtrl.value;
    if (state is GetDetailDataSuccess<MarshopResponse>) {
      onValidation();
      if (_marshopIdCtrl.text.isEmpty) {
        _marshopIdCtrl.text = state.data.code;
      }
      _marshopIdValidCtrl.value = true;
      if (!_rulesCtrl.value.contains(RegisterMarshopRule.isRefIdMarshop)) {
        rules.add(RegisterMarshopRule.isRefIdMarshop);
      }
      marshop = state.data;
      onValidation();
    }

    if (state is GetDetailError<MarshopResponse>) {
      _marshopIdValidCtrl.value = false;
      rules.remove(RegisterMarshopRule.isRefIdMarshop);
      onValidation();
    }
    _rulesCtrl.value = [];
    _rulesCtrl.value = rules;
  }
}
