import 'package:app_core/app_core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';
import '../../../app_constants.dart';
import '../../../general_setting/general_coordinator.dart';
import '../../upgrade_account_constants.dart';
import '../../upgrade_ja/widgets/gradiant_button.dart';
import '../mixin/handle_error_message_mixin.dart';

class RegisterPDoneAccountPage extends StatefulWidget {
  final VoidCallback onNextPage;

  const RegisterPDoneAccountPage({
    super.key,
    required this.onNextPage,
  });

  @override
  State<RegisterPDoneAccountPage> createState() =>
      _RegisterPDoneAccountPageState();
}

class _RegisterPDoneAccountPageState extends State<RegisterPDoneAccountPage>
    with ValidationMixin, HandleErrorMessageMixin {
  bool acceptedPolicy = false;
  final _emailCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();

  // User? get currentUser => context.read<UserBloc>().state.currentUser;

  // bool get enableBtnNext =>
  //     context.validationEmail(_emailCtrl.text) == null &&
  //     context.validationPhone(_phoneCtrl.text) == null &&
  //     acceptedPolicy;
  bool get enableBtnNext => true;

  // UpgradePDoneBloc get upgradePDoneBloc => context.read();

  @override
  void initState() {
    super.initState();

    // if (currentUser != null && currentUser?.email != null) {
    //   _emailCtrl.text = currentUser?.email ?? '';
    // }
    //
    // if (currentUser != null && currentUser?.phone != null) {
    //   _phoneCtrl.text = currentUser?.phone ?? '';
    // }
  }

  // void _onListenerBloc(BuildContext context, UpgradePDoneState state) {
  //   if (state is RegisterPDoneAccountSuccess) {
  //     hideLoading();
  //     _startDialogVerifyPhone(state.response);
  //   } else if (state is RegisterPDoneAccountFailure) {
  //     hideLoading();
  //     if (!showErrorMessage(state.error)) {
  //       showToastMessage(state.errorMessage, ToastMessageType.error);
  //     }
  //   }
  // }

  @override
  void dispose() {
    _emailCtrl.dispose();
    _phoneCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AutoHideKeyboard(
      child: Column(
        children: [
          validationFormBuilder(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _labelTextField('Email'),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: UpgradeAccountConstants.horizontalScreen,
                  ),
                  child: TextInputUpdateInformationWidget(
                    type: UpdateInformationType.email,
                    controller: _emailCtrl,
                    onChanged: (val) => setState(() {}),
                    // shouldEnabled: currentUser?.email == null,
                    hintText: 'Email',
                    textInputType: TextInputType.emailAddress,
                  ),
                ),
                _labelTextField('Số điện thoại'),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: UpgradeAccountConstants.horizontalScreen,
                  ),
                  child: TextInputUpdateInformationWidget(
                    type: UpdateInformationType.phone,
                    maxLength: AppConstants.inputPhoneLenght,
                    controller: _phoneCtrl,
                    // shouldEnabled: currentUser?.phone == null,
                    onChanged: (val) => setState(() {}),
                    hintText: 'Phone',
                    textInputType: TextInputType.phone,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 6, top: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: acceptedPolicy,
                        activeColor: AppColors.green11,
                        onChanged: _onChangedCheckbox,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 12, right: 12),
                          child: RichText(
                            text: TextSpan(
                              text: 'Tôi đồng ý với ',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(color: AppColors.grey10),
                              children: [
                                TextSpan(
                                  text: 'Điều khoản dịch vụ và Chính sách ',
                                  style: const TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: AppColors.blue31,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = _onTapPolicy,
                                ),
                                const TextSpan(text: 'của VDONE')
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                      UpgradeAccountConstants.horizontalScreen,
                      30,
                      UpgradeAccountConstants.horizontalScreen,
                      0),
                  child: GradiantButton(
                    // onPressed: showLoading,
                    onPressed: enableBtnNext ? _registerAccount : null,
                    child: Text(
                      'TIẾP THEO',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge
                          ?.copyWith(color: AppColors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    // return BlocListener<UpgradePDoneBloc, UpgradePDoneState>(
    //   listener: _onListenerBloc,
    //   child: AutoHideKeyboard(
    //     child: Column(
    //       children: [
    //         validationFormBuilder(
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               _labelTextField('Email'),
    //               Padding(
    //                 padding: const EdgeInsets.symmetric(
    //                   horizontal: UpgradeAccountConstants.horizontalScreen,
    //                 ),
    //                 child: TextInputUpdateInformationWidget(
    //                   type: UpdateInformationType.email,
    //                   controller: _emailCtrl,
    //                   onChanged: (val) => setState(() {}),
    //                   shouldEnabled: currentUser?.email == null,
    //                   hintText: 'Email',
    //                   textInputType: TextInputType.emailAddress,
    //                 ),
    //               ),
    //               _labelTextField('Số điện thoại'),
    //               Padding(
    //                 padding: const EdgeInsets.symmetric(
    //                   horizontal: UpgradeAccountConstants.horizontalScreen,
    //                 ),
    //                 child: TextInputUpdateInformationWidget(
    //                   type: UpdateInformationType.phone,
    //                   maxLength: AppConstants.inputPhoneLenght,
    //                   controller: _phoneCtrl,
    //                   shouldEnabled: currentUser?.phone == null,
    //                   onChanged: (val) => setState(() {}),
    //                   hintText: 'Phone',
    //                   textInputType: TextInputType.phone,
    //                 ),
    //               ),
    //               Padding(
    //                 padding: const EdgeInsets.only(left: 6, top: 8),
    //                 child: Row(
    //                   mainAxisAlignment: MainAxisAlignment.start,
    //                   crossAxisAlignment: CrossAxisAlignment.center,
    //                   children: [
    //                     Checkbox(
    //                       value: acceptedPolicy,
    //                       activeColor: AppColors.green11,
    //                       onChanged: _onChangedCheckbox,
    //                     ),
    //                     Expanded(
    //                       child: Padding(
    //                         padding: const EdgeInsets.only(top: 12, right: 12),
    //                         child: RichText(
    //                           text: TextSpan(
    //                             text: 'Tôi đồng ý với ',
    //                             style: Theme.of(context)
    //                                 .textTheme
    //                                 .headlineSmall!
    //                                 .copyWith(color: AppColors.grey10),
    //                             children: [
    //                               TextSpan(
    //                                 text: 'Điều khoản dịch vụ và Chính sách ',
    //                                 style: const TextStyle(
    //                                   decoration: TextDecoration.underline,
    //                                   color: AppColors.blue31,
    //                                 ),
    //                                 recognizer: TapGestureRecognizer()
    //                                   ..onTap = _onTapPolicy,
    //                               ),
    //                               const TextSpan(text: 'của VDONE')
    //                             ],
    //                           ),
    //                         ),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //               Padding(
    //                 padding: const EdgeInsets.fromLTRB(
    //                     UpgradeAccountConstants.horizontalScreen,
    //                     30,
    //                     UpgradeAccountConstants.horizontalScreen,
    //                     0),
    //                 child: GradiantButton(
    //                   // onPressed: showLoading,
    //                   onPressed: enableBtnNext ? _registerAccount : null,
    //                   child: Text(
    //                     'TIẾP THEO',
    //                     style: Theme.of(context)
    //                         .textTheme
    //                         .labelLarge
    //                         ?.copyWith(color: AppColors.white),
    //                   ),
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }

  Widget _labelTextField(String text) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 12,
        top: 20,
        left: UpgradeAccountConstants.horizontalScreen,
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }

  void _onTapPolicy() {
    context.startTermsAndCondition();
  }

  void _onChangedCheckbox(bool? value) {
    if (value != null) {
      setState(() {
        acceptedPolicy = value;
      });
    }
  }

  void _registerAccount() {
    // final text = currentUser?.email == null ? _emailCtrl.text : _phoneCtrl.text;
    //
    // // user register with email
    // if (currentUser?.email == null) {
    //   upgradePDoneBloc.add(RegisterPDoneAccountEvent(email: text));
    //   showLoading();
    //   return;
    // }
    //
    // const countryId = 240;
    // const phoneCode = '84';
    //
    // upgradePDoneBloc.add(
    //   RegisterPDoneAccountEvent(
    //     phoneNumber: text,
    //     countryId: countryId,
    //     phoneCode: phoneCode,
    //   ),
    // );
    // showLoading();
  }

  // void _startDialogVerifyPhone(RegisterPDoneResponse response) {
  //   hideLoading();
  //
  //   context.startDialogVerifyOTP(response).then((value) {
  //     if (value != null && value) {
  //       widget.onNextPage.call();
  //     }
  //   });
  // }
}
