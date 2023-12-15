import 'package:app_core/app_core.dart';
import 'package:app_main/src/blocs/auth/auth_cubit.dart';
import 'package:app_main/src/blocs/marshop/marshop_cubit.dart';
import 'package:app_main/src/blocs/user/user_cubit.dart' as user;
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/data/models/payloads/marshop/marshop_payload.dart';
import 'package:app_main/src/data/models/responses/marshop_response.dart';
import 'package:app_main/src/domain/entities/update_account/update_place_information_payload.dart';
import 'package:app_main/src/presentation/authentication/authentication_constants.dart';
import 'package:app_main/src/presentation/marshop/marshop_coordinator.dart';
import 'package:app_main/src/presentation/marshop/register_marshop/confirm_infomation_screen.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:ui/ui.dart';

class RegisterMarShopOTPScreen extends StatefulWidget {
  static const String routeName = 'register-marshop-otp';
  final RegisterMarshopPayload payload;
  final MarshopRegisterPackResponse pack;
  final User authInfo;
  final MarshopResponse marshop;
  final UpdatePlaceInformationPayload address;
  final int totalPrice;
  final List<RegisterPackProductInfo> productResult;

  const RegisterMarShopOTPScreen({
    super.key,
    required this.payload,
    required this.pack,
    required this.address,
    required this.marshop,
    required this.authInfo,
    required this.productResult,
    required this.totalPrice,
  });

  @override
  State<RegisterMarShopOTPScreen> createState() =>
      _RegisterMarShopOTPScreenState();
}

class _RegisterMarShopOTPScreenState extends State<RegisterMarShopOTPScreen>
    with TimerMixin {
  final AuthCubit _bloc = injector.get();
  late final userCubit = context.read<user.UserCubit>();
  final ValueNotifier<bool> _errorCtr = ValueNotifier(false);
  final _marshopCubit = injector.get<MarshopCubit>();
  late User _authInfo;
  bool _disabled = true;
  String _otp = "";

  @override
  void initState() {
    _bloc.sendOTP();
    _authInfo = userCubit.currentUser!;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) => startTimer());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => _bloc),
        BlocProvider(create: (context) => _marshopCubit),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is ResendOTPSuccess) {
                debugPrint("$state");
                restartTimer();
                hideLoading();
                setState(() {});
                showToastMessage(
                  S.current.messages_resend_otp_success.capitalize(),
                );
              }
            },
          ),
          BlocListener<MarshopCubit, MarshopState>(listener: (context, state) {
            if (state is OnRegisterMarshop) {
              showLoading();
            }

            if (state is RegisterMarshopFail) {
              hideLoading();
              showToastMessage(state.message, ToastMessageType.error);
            }

            if (state is RegisterMarshopSuccess) {
              hideLoading();
              context.startTransactionDetail(
                pack: widget.pack,
                authInfo: widget.authInfo,
                marshop: widget.marshop,
                address: widget.address,
                productResult: widget.productResult,
                totalPrice: widget.totalPrice,
              );
            }
          }),
        ],
        child: ScaffoldHideKeyboard(
          body: SafeArea(
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: paddingHorizontal),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomBackButton(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.current.enter_the_verification_code,
                        style: context.text.titleLarge!
                            .copyWith(fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 5),
                      Text.rich(
                        TextSpan(
                          style: context.text.bodySmall,
                          text: S.current.confirmation_code_has_been_sent,
                          children: [
                            TextSpan(
                              text:
                                  "(+${_authInfo.phoneCode}) ${_authInfo.phone}",
                              style: context.text.titleSmall!.copyWith(
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      OTPInputWidget(
                        onCompleted: (value) {
                          _disabled = false;
                          setState(() {});
                          debugPrint(value);
                          _otp = value;
                        },
                        onChange: () {
                          _disabled = true;
                          _errorCtr.value = false;
                          setState(() {});
                        },
                        errorCtr: _errorCtr,
                      ),
                      const SizedBox(height: 30),
                      PrimaryButton(
                        title: S.current.confirm,
                        onTap: _onConfirm,
                        color: Colors.white,
                        disabled: _disabled,
                        width: MediaQuery.of(context).size.width,
                      ),
                      const SizedBox(height: 20),
                      ValueListenableBuilder(
                        valueListenable: timeCtr,
                        builder: (context, value, child) {
                          final timerString =
                              value > 0 ? '(${value.toString()}s)' : '';
                          return Center(
                            child: Text.rich(
                              TextSpan(
                                text: S.current.resend_the_code_later,
                                children: [
                                  const TextSpan(text: " "),
                                  if (value > 0) TextSpan(text: timerString),
                                  if (value <= 0)
                                    TextSpan(
                                      text: S.current.resend,
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () => _bloc.resendOTP(),
                                      style: context.text.bodyMedium!.copyWith(
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.blue10,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get isCountDown => true;

  @override
  void onCompleteTimer() {}

  @override
  int get timeInputLimit => AuthenticationConstants.otpTimer;

  _onConfirm() {
    _marshopCubit.registerMarshop(
      _authInfo.id!,
      RegisterMarshopPayload(
        otp: _otp,
        packId: widget.payload.packId,
        referralId: widget.payload.referralId,
        billInfo: widget.payload.billInfo,
      ),
    );
  }
}
