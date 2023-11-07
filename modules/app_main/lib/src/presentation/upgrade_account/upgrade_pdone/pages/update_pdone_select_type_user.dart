import 'dart:convert';
import 'dart:core';
import 'dart:developer';
import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:ui/ui.dart';
import '../../../marshop/widgets/gradiant_button.dart';
import '../../../shared/user/bloc/user_bloc.dart';
import '../bloc/upgrade_pdone/upgrade_pdone_bloc.dart';
import '../views/widgets/select_information_widget.dart';

class UpdatePdoneSelectTypeUser extends StatefulWidget {
  final VoidCallback onNextPage;

  const UpdatePdoneSelectTypeUser({
    super.key,
    required this.onNextPage,
  });

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _UpdatePdoneSelectTypeUserState();
  }
}

class _UpdatePdoneSelectTypeUserState extends State<UpdatePdoneSelectTypeUser> {
  late MethodChannel _channel;

  void _onListenerBloc(BuildContext context, UpgradePDoneState state) {
    if (state is ExtractedEKycIdCardSuccess) {
      // context.upgradePdoneSuccess();
      widget.onNextPage();
    }

    if (state is ExtractedEKycIdCardFailure) {
      // context.upgradePdoneSuccess();
      context.showToastMessage(state.errorMessage, ToastMessageType.error);
    }
  }

  bool get enableBtn => true;

  PDoneOptionAge _pDoneOptionAge = PDoneOptionAge.over18;
  PDoneOptionMethod _pDoneOptionMethod = PDoneOptionMethod.userIdentityCard;

  get ageOptions => PDoneOptionAge.values;
  final methodOptions = PDoneOptionMethod.values;

  get methodOptionUnder15 => PDoneOptionMethod.values;

  get methodOptionOver15AndUnder18 => [PDoneOptionMethod.userIdentityCard];

  get methodOptionOver18 => [PDoneOptionMethod.userIdentityCard];

  UpgradePDoneBloc get upgradePDoneBloc => context.read<UpgradePDoneBloc>();

  @override
  void initState() {
    super.initState();
    _channel = const MethodChannel('flutter.sdk.ekyc/integrate');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocListener<UpgradePDoneBloc, UpgradePDoneState>(
      listener: _onListenerBloc,
      child: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 14, right: 16, left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                children: [
                  _buildWidgetSelectAge(context),
                  // const SizedBox(
                  //   height: 8,
                  // ),
                  _buildWidgetSelectMethod(context),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 6, top: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: true,
                          activeColor: AppColors.blue30,
                          onChanged: (bool? value) {},
                        ),
                        Expanded(
                          child: Text(
                            'Sử dụng giấy tờ gốc và còn hiệu lực ',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    child: ImageWidget(ImageConstants.guidePdone),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 18, 20, 60),
                    child: GradiantButton(
                      onPressed: enableBtn ? _onTapVerify : null,
                      height: 45,
                      child: Text(
                        'Xác thực',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge
                            ?.copyWith(color: AppColors.white),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        );
      }),
    );
  }

  Future<void> _startEkycByNameMethod({required String methodName}) async {
    final json = await _channel.invokeMethod(methodName, {
      "access_token":
          "bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI4Yzk0OGJkNC03ZDhkLTExZWUtYTNlZC05ZjY5NzM1MjY1OWIiLCJhdWQiOlsicmVzdHNlcnZpY2UiXSwidXNlcl9uYW1lIjoiaGlAc2hvcGJhc2Uubm8iLCJzY29wZSI6WyJyZWFkIl0sImlzcyI6Imh0dHBzOi8vbG9jYWxob3N0IiwibmFtZSI6ImhpQHNob3BiYXNlLm5vIiwiZXhwIjoxNzAxOTY3NzM5LCJ1dWlkX2FjY291bnQiOiI4Yzk0OGJkNC03ZDhkLTExZWUtYTNlZC05ZjY5NzM1MjY1OWIiLCJhdXRob3JpdGllcyI6WyJVU0VSIl0sImp0aSI6IjAzZmY1NjA3LWI5M2ItNDFhNy05ZGRhLWIyNDY2MzFiNGI4YyIsImNsaWVudF9pZCI6ImNsaWVudGFwcCJ9.D4pFr4tLOqqRmZkIgDbhSNseF5jFF-ti-4ilLhfEfPbpXHYFngX9-cEwlV_bmGM_pMab4L-NGZ-APz-ZO_tFDKng2DhgfC4iHKsWopBw5eDN7fGaLxGxqhwwZqlbSHSeOfmwEzFjpxmE74PoKhMPN_-8phi3v-dJXyQbU8aR3-3s9m7MLmLhKOkfxjaQ35fS4ADP6clEULz3oiA8SP_vbA8-WTVY5_TUbxXgoqEok8hLKOXYhh0S1q9FlaAxkwLRQl5-ztAGsqmysrDDNZfNbvDC7K3YZzc0v40idQLG85Ov7icNd0ETVZOKqUDzq5x0-Gvd2v_61agc0kJhjSncXw",
      "token_id": "0993bf52-4164-1447-e063-63199f0a0aeb",
      "token_key":
          "MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBAJ5XSrrEiTYpNR49kxNYKBXnZtsV0CNGaP0xrDB1FRII/Goivh0MC7zXSUrSA5bM44+tLjh0g3e+h4pMPCTZj20CAwEAAQ==",
    });
    log(json);
    upgradePDoneBloc.add(
      ExtractingIdCardEvent(jsonDecode(json)),
    );
  }

  void _onTapVerify() {
    _startEkycByNameMethod(methodName: 'startEkycFull');
  }

  Widget _buildWidgetSelectAge(BuildContext ctx) {
    return SelectInformationWidget<PDoneOptionAge>(
      required: true,
      builder: (item) => DropdownItemWidget(text: item.title(ctx)),
      items: ageOptions,
      type: UpdateInformationType.ageRange,
      onChanged: (val) {
        if (val != null) {
          _pDoneOptionAge = val;
          setState(() {});
        }
      },
      currentValue: _pDoneOptionAge.title(ctx),
      validator: (value) {
        return null;
      },
    );
  }

  Widget _buildWidgetSelectMethod(BuildContext ctx) {
    return SelectInformationWidget<PDoneOptionMethod>(
      required: true,
      builder: (item) => DropdownItemWidget(text: item.title(ctx)),
      items: methodOptions,
      type: UpdateInformationType.pDoneMethod,
      onChanged: (val) {
        if (val != null) {
          _pDoneOptionMethod = val;
          setState(() {});
        }
      },
      currentValue: _pDoneOptionMethod.title(ctx),
      validator: (value) {
        return null;
      },
    );
  }
}
