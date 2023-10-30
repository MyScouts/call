import 'package:app_core/app_core.dart';
import 'package:app_main/src/blocs/user/user_cubit.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/data/models/payloads/auth/authentication_phone_payload.dart';
import 'package:app_main/src/presentation/authentication/widget/custom_text_field.dart';
import 'package:app_main/src/presentation/dashboard/dashboard_coordinator.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:localization/localization.dart';
import 'package:ui/ui.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> with ValidationMixin {
  bool _buttonDisabled = true;
  String _phoneCode = "+84";
  final _phoneCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();

    validationListener.addListener(() {
      _buttonDisabled = !isValidForm;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit, UserState>(
      listener: (context, state) {
        if (state is PhoneLoginSuccess) {
          hideLoading();
          context.startDashboardUtil();
        }

        if (state is PhoneLoginFail) {
          hideLoading();
          showToastMessage(
            state.message,
            ToastMessageType.error,
          );
        }
      },
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.current.lbl_Phone.capitalize(),
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF212121),
                  height: 20 / 14,
                  leadingDistribution: TextLeadingDistribution.even,
                ),
              ),
              const SizedBox(height: 4),
              CustomTextField(
                key: const ValueKey("phone"),
                onChange: (value) => onValidation(),
                controller: _phoneCtrl,
                validator: ValidationHelper.phone,
                textInputType: TextInputType.number,
                prefixIcon: IntrinsicHeight(
                  child: _buildVgFlag(),
                ),
                hintText: S.current.phone_placeholder.capitalize(),
                hintStyle: const TextStyle(
                  color: Color(0xFF8C8C8C),
                  fontSize: 14,
                  height: 20 / 14,
                  leadingDistribution: TextLeadingDistribution.even,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                S.current.lbl_password.capitalize(),
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF212121),
                    height: 20 / 14,
                    leadingDistribution: TextLeadingDistribution.even),
              ),
              const SizedBox(
                height: 4,
              ),
              CustomTextField(
                controller: _passwordCtrl,
                validator: ValidationHelper.password,
                hintText: "**************",
                onChange: (value) => onValidation(),
                hintStyle: const TextStyle(
                  color: Color(0xFF8C8C8C),
                  fontSize: 14,
                  height: 20 / 14,
                  leadingDistribution: TextLeadingDistribution.even,
                ),
                isPassword: true,
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text.rich(
                    TextSpan(
                        style: context.text.bodyMedium!.copyWith(
                          color: context.theme.hintColor,
                        ),
                        children: [
                          TextSpan(
                            text: "${S.current.registration_is_consent_to}\n",
                          ),
                          TextSpan(
                            text: S.current.terms_of_service_and_policies,
                            style: context.text.titleMedium!.copyWith(
                              color: context.theme.primaryColor,
                            ),
                          ),
                          const TextSpan(text: " "),
                          TextSpan(text: S.current.by_vdone),
                        ]),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              PrimaryButton(
                title: S.current.login,
                onTap: _onLogin,
                color: Colors.white,
                disabled: _buttonDisabled,
              ),
              const SizedBox(height: 20),
              Center(
                child: InkWell(
                  onTap: () {},
                  child: Text(
                    S.current.forgot_password,
                    style: context.text.titleMedium!.copyWith(
                      color: AppColors.grey20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _onLogin() {
    if (formKey.currentState!.validate()) {
      showLoading();
      context.read<UserCubit>().phoneLogin(
            AuthenticationPhonePayload(
              phoneNumber: _phoneCtrl.text.trim(),
              password: _passwordCtrl.text,
              phoneCode: _phoneCode.replaceAll("+", ""),
            ),
          );
      return;
    }
  }

  _buildVgFlag() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          child: ImageWidget(
            IconAppConstants.icPhone,
            width: 24,
            fit: BoxFit.cover,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: VerticalDivider(
            color: Color(0xFFD9D9D9),
            thickness: 1,
            width: 1,
          ),
        ),
        SizedBox(
          // width: 100,
          height: double.infinity,
          child: CountryCodePicker(
            hideSearch: true,
            onChanged: (value) {
              if (value.dialCode != null) {
                _phoneCode = value.dialCode!;
                debugPrint("$value");
                setState(() {});
              }
            },
            initialSelection: _phoneCode,
            showCountryOnly: false,
            showOnlyCountryWhenClosed: false,
            alignLeft: false,
            hideMainText: true,
            dialogSize: Size.fromHeight(
              MediaQuery.of(context).size.height * .7,
            ),
            barrierColor: Colors.transparent,
            builder: (country) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  children: [
                    ImageWidget(
                      country != null
                          ? "assets/${country.flagUri!}"
                          : IconAppConstants.icVnFlag,
                      width: 22,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      country?.dialCode ?? "",
                      style: const TextStyle(
                        color: Color(0xFF212121),
                        height: 20 / 14,
                        leadingDistribution: TextLeadingDistribution.even,
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
