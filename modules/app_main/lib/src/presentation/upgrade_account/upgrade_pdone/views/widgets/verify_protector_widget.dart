import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/domain/entities/update_account/upgrade_account.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:localization/generated/l10n.dart';
import 'package:ui/ui.dart';

import '../../../../../data/models/payloads/upgrade_account/upgrade_pdone/pdone_verify_protector.dart';
import '../../../../marshop/widgets/gradiant_button.dart';
import '../../bloc/upgrade_pdone/upgrade_pdone_bloc.dart';
import 'information_field_guardian_widget.dart';

class VerifyProtectorWidget extends StatefulWidget {
  final ValueChanged<PDoneVerifyProtectorRequest> onUpdatePDoneVerifyProtector;

  const VerifyProtectorWidget(
      {super.key, required this.onUpdatePDoneVerifyProtector});

  @override
  State<StatefulWidget> createState() {
    return _VerifyProtectorWidgetState();
  }
}

class _VerifyProtectorWidgetState extends State<VerifyProtectorWidget> {
  final _protectorCtl = TextEditingController();
  final _pDoneIDOfProtector = TextEditingController();
  final _phoneCtl = TextEditingController();
  final _idNumberOfProtector = TextEditingController();
  List<Protector> protectors = [];
  PDoneVerifyProtectorRequest protectorRequest = PDoneVerifyProtectorRequest(phoneCode: '84');

  UpgradePDoneBloc get upgradePDoneBloc => context.read();

  void _listenerBloc(BuildContext context, UpgradePDoneState state) {
    if (state is GetListMasterLoading || state is VerifyingProtectorState) {
      showLoading();
    }

    if (state is GetListMasterSuccess || state is VerifyProtectorSuccessState) {
      hideLoading();
    }

    if (state is GetListMasterFailure) {
      hideLoading();
    }
    if (state is VerifyProtectorFailureState) {
      hideLoading();
      showToastMessage(state.errorMessage, ToastMessageType.error);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    upgradePDoneBloc.add(GetListMasterEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpgradePDoneBloc, UpgradePDoneState>(
      listener: _listenerBloc,
      builder: (BuildContext context, UpgradePDoneState state) {
        if (state is GetListMasterSuccess) {
          protectors = (upgradePDoneBloc.state as GetListMasterSuccess)
                  .upgradeAccount
                  .protectors ??
              [];
        }

        if (state is! GetListMasterLoading) {
          return Container(
            margin: const EdgeInsets.fromLTRB(0, 16, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTitle(context),
                _buildForm(context),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      'Thông tin người bảo hộ',
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }

  Widget _buildForm(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchInputInformationWidget<Protector>(
          type: UpdateInformationType.protector,
          suggestions: protectors
              .map(
                (e) => SuggestionsField<Protector>(name: e.name ?? '', data: e),
              )
              .toList(),
          onSelected: (protector) {
            protectorRequest.protector = protector?.id;
          },
        ),
        InformationFieldGuardianWidget(
          type: UpdateInformationType.pDoneIDOfProtector,
          required: true,
          onChanged: (String? value) {
            protectorRequest.pDoneId = value;
          },
        ),
        const SizedBox(height: 12),
        Text(
          S.current.lbl_Phone.capitalize(),
          style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Color(0xFF212121),
              height: 20 / 14,
              leadingDistribution: TextLeadingDistribution.even),
        ),
        const SizedBox(height: 4),
        AppPhoneInput(
          controller: _phoneCtl,
          onChange: (val) {
            // print(val.toPhone);
            protectorRequest.phoneNumber = val.toPhone;
          },
          onPhoneCodeChange: (val) {
            // _phoneCode.text = val.code.toString();
            protectorRequest.phoneCode = val.code;
          },
        ),
        InformationFieldGuardianWidget(
          type: UpdateInformationType.idNumberOfProtector,
          required: true,
          onChanged: (String? value) {
            protectorRequest.identityNumber = value;
          },
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: GestureDetector(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8F0FE),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'Kiểm tra thông tin',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: const Color(0xFF4B84F7),
                          fontWeight: FontWeight.w700,
                          fontSize: 17),
                    ),
                  ),
                ),
              ],
            ),
            onTap: () {
              upgradePDoneBloc.add(VerifyProtectorEvent(req: protectorRequest));
            },
          ),
        ),
      ],
    );
  }
}