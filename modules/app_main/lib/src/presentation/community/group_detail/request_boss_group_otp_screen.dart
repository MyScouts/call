import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/community/group_detail/bloc/group_detail_bloc.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mobilehub_bloc/mobilehub_bloc.dart';
import 'package:ui/ui.dart';
import 'package:wallet/core/core.dart';
import 'package:wallet/presentation/shared/widgets/toast_message/toast_message.dart';
import 'package:wallet/presentation/wallet_constant.dart';

import '../groups/group_listing_bloc.dart';

class RequestBossGroupOtpScreen extends StatefulWidget {
  static const String routeName = '/verify-otp-boss-group';

  const RequestBossGroupOtpScreen({super.key});

  @override
  State<RequestBossGroupOtpScreen> createState() =>
      _RequestBossGroupOtpScreenState();
}

class _RequestBossGroupOtpScreenState extends State<RequestBossGroupOtpScreen>
    with TimerMixin {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _groupDetailBloc.add(GetOtpEvent());
      startTimer();
    });

    super.initState();
  }

  String _otp = "";
  final ValueNotifier<bool> _errorCtr = ValueNotifier(false);
  bool _disabled = true;

  late final _groupDetailBloc = context.read<GroupDetailBloc>();
  late final _createOpenGroupBloc = context.read<CreateOpenGroupRequestBloc>();

  _onVerify(BuildContext context) {
    _createOpenGroupBloc.add(GetDetailDataParam1Event(_otp));
  }

  void _handleResendOTP() {
    showLoading();
    _groupDetailBloc.add(GetOtpEvent());
    showToastMessage('Gửi lại OTP thành công');
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GroupDetailBloc, GroupDetailState>(
      listener: (context, state) {
        if (state is GetOtpSuccess) {
          hideLoading();
          setState(() {});
        }
      },
      child: ScaffoldHideKeyboard(
        body: BlocListener<CreateOpenGroupRequestBloc, GetDetailState>(
          listener: (context, state) {
            if (state is GetDetailDataSuccess) {
              hideLoading();
              context.popNavigator(true);
            } else if (state is GetDetailDataLoading) {
              showLoading();
            } else if (state is GetDetailError) {
              hideLoading();
              final e = state.error;
              if (e is DioError) {
                final message = e.toMessage(context);
                context.showToastMessage(message, ToastMessageType.warning);
              } else {
                final message = 'Đã có lỗi xảy ra, vui lòng thử lại.'
                    ' ${kDebugMode ? state.error.toString() : ''}';
                context.showToastMessage(message, ToastMessageType.error);
              }
            }
          },
          child: SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: paddingHorizontal,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomBackButton(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nhập mã xác minh',
                        style: context.text.titleLarge!.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Mã xác nhận đã được gửi về số điện thoại của bạn',
                        style: context.text.titleSmall!.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 30),
                      VerifyOTPInputWidget(
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
                        title: 'Xác nhận',
                        onTap: () {
                          _onVerify(context);
                        },
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
                                text: '',
                                children: [
                                  if (value > 0)
                                    TextSpan(
                                        text: 'Gửi lại mã sau ',
                                        style:
                                            context.text.bodyMedium?.copyWith(
                                          color: const Color(0xFF6E6E6E),
                                        )),
                                  TextSpan(
                                    text: timerString,
                                    style: context.text.bodyMedium!.copyWith(
                                      color: const Color(0xFF085CAF),
                                    ),
                                  ),
                                  if (value <= 0)
                                    TextSpan(
                                      text: 'Gửi lại',
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = _handleResendOTP,
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
  int get timeInputLimit => WalletConstant.timeInputLimit;
}
