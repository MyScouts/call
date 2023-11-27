import 'dart:async';

import 'package:design_system/design_system.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../ui.dart';
import 'otp_widget.dart';

enum OtpVerifyType {
  email;

  String get title {
    if (this == OtpVerifyType.email) {
      return 'Mã xác nhận đã được gửi về Email của bạn';
    }

    return 'Mã xác nhận đã được gửi về Email của bạn';
  }
}

class OtpScreen extends StatefulWidget {
  const OtpScreen({
    super.key,
    required this.onRequestVerify,
    required this.type,
    this.onResent,
  });

  final OtpVerifyType type;
  final Function(String otp) onRequestVerify;
  final Function()? onResent;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String _otpCode = '';
  bool _isActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: BackButton(),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Nhập mã xác minh',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.type.title,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 42, 0, 24),
                  child: OtpWidget(
                    onOtpChanged: (value) {
                      _otpCode = value;
                      if (value.length == 6 && _isActive == false) {
                        setState(() {
                          _isActive = true;
                        });
                      } else if (_isActive) {
                        setState(() {
                          _isActive = false;
                        });
                      }
                    },
                    selectedColor: AppColors.blue10,
                    textColor: AppColors.blue10,
                    activeColor: AppColors.purple10,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 44,
                  decoration: BoxDecoration(
                    gradient: Theme.of(context).themeDecoration.gradientPrimary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ElevatedButton(
                    onPressed: _isActive
                        ? () {
                            widget.onRequestVerify(_otpCode);
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Xác nhận',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge
                          ?.copyWith(color: AppColors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Center(
                  child: OtpCountDown(
                    start: 60,
                    builder: (ctx, time) {
                      return RichText(
                        text: TextSpan(
                          text: 'Gửi lại mã sau? ',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xff6E6E6E),
                          ),
                          children: [
                            if (time <= 0)
                              TextSpan(
                                text: 'Gửi lại',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff085CAF),
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = widget.onResent,
                              ),
                            if (time > 0)
                              TextSpan(
                                text: '${time.toString().padLeft(2, '0')}s',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff085CAF),
                                ),
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OtpCountDown extends StatefulWidget {
  const OtpCountDown({
    super.key,
    required this.start,
    required this.builder,
  });

  final int start;
  final Widget Function(BuildContext context, int time) builder;

  @override
  State<OtpCountDown> createState() => _OtpCountDownState();
}

class _OtpCountDownState extends State<OtpCountDown> {
  Timer? timer;
  late int _current = widget.start;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      start();
    });
  }

  @override
  void didUpdateWidget(covariant OtpCountDown oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.start != oldWidget.start) {
      start();
    }
  }

  void start() {
    if (timer != null) {
      timer?.cancel();
    }
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _current = _current - 1;
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _current);
  }
}
