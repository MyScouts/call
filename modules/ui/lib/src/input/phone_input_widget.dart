import 'package:app_core/app_core.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:localization/localization.dart';

import 'custom_text_field.dart';

class AppPhoneInput extends StatefulWidget {
  final TextEditingController controller;
  final Function(String)? onChange;
  final Function(String?)? onError;
  final Function(CountryCode)? onPhoneCodeChange;

  const AppPhoneInput({
    super.key,
    required this.controller,
    this.onChange,
    this.onPhoneCodeChange,
    this.onError,
  });

  @override
  State<AppPhoneInput> createState() => _AppPhoneInputState();
}

class _AppPhoneInputState extends State<AppPhoneInput> {
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      onChange: widget.onChange,
      controller: widget.controller,
      validator: (phone) {
        final String? error = ValidationHelper.phone(phone);
        if (widget.onError != null) {
          widget.onError!(error);
        }
        return error;
      },
      textInputType: TextInputType.number,
      prefixIcon: IntrinsicHeight(
        child: buildVgFlag(),
      ),
      hintText: S.current.phone_placeholder.capitalize(),
      hintStyle: const TextStyle(
        color: Color(0xFF8C8C8C),
        fontSize: 14,
        height: 20 / 14,
        leadingDistribution: TextLeadingDistribution.even,
      ),
    );
  }

  Row buildVgFlag() {
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
            onChanged: widget.onPhoneCodeChange,
            initialSelection: "+84",
            showCountryOnly: false,
            countryList: const [
              {
                "name": "Việt Nam",
                "code": "VN",
                "dial_code": "+84",
              }
            ],
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
                          ? 'assets/${country.flagUri!}'
                          : IconAppConstants.icVnFlag,
                      width: 22,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      country?.dialCode ?? "",
                      style: const TextStyle(
                        color: Color(0xFF212121),
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
