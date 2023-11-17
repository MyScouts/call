import 'dart:convert';

import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/domain/entities/update_account/upgrade_account.dart';
import 'package:design_system/design_system.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:localization/generated/l10n.dart';
import 'package:ui/ui.dart';

import '../../../../../data/models/payloads/upgrade_account/upgrade_pdone/pdone_verify_protector.dart';
import '../../../../../data/models/responses/pdone/pdone_my_protector_information_response.dart';
import '../../bloc/upgrade_pdone/upgrade_pdone_bloc.dart';
import 'information_field_guardian_widget.dart';

class VerifyProtectorWidget extends StatefulWidget {
  final ValueChanged<PDoneVerifyProtectorRequest> onUpdatePlaceInformation;

  final ValueChanged<bool> updateProtectorStatus;

  const VerifyProtectorWidget(
      {super.key,
      required this.onUpdatePlaceInformation,
      required this.updateProtectorStatus});

  @override
  State<StatefulWidget> createState() {
    return _VerifyProtectorWidgetState();
  }
}

class _VerifyProtectorWidgetState extends State<VerifyProtectorWidget> {
  final _phoneCtl = TextEditingController();
  final _pDoneIDOfProtectorCtl = TextEditingController();
  final _idNumberOfProtectorCtl = TextEditingController();
  List<Protector> protectors = [];
  PDoneVerifyProtectorRequest protectorRequest =
      PDoneVerifyProtectorRequest(phoneCode: '84', protector: 0);

  UpgradePDoneBloc get upgradePDoneBloc => context.read();

  bool get protectorApprove =>
      (upgradePDoneBloc.state is ApproveProtectorState);

  bool get protectorReject => (upgradePDoneBloc.state is RejectProtectorState);

  void _listenerBloc(BuildContext context, UpgradePDoneState state) {
    if (state is GetListMasterLoading || state is VerifyingProtectorState) {
      showLoading();
    }

    if (state is GetListMasterSuccess) {
      hideLoading();
    }

    if (state is VerifyProtectorSuccessState) {
      hideLoading();
      // showToastMessage('Người bảo hộ tồn tại!', ToastMessageType.success);
      _requestProtector();
    }

    if (state is ApproveProtectorState) {
      widget.updateProtectorStatus(true);
    }

    if (state is RejectProtectorState) {
      widget.updateProtectorStatus(false);
    }

    if (state is GetListMasterFailure) {
      hideLoading();
    }
    if (state is VerifyProtectorFailureState) {
      hideLoading();
      showToastMessage(state.errorMessage, ToastMessageType.error);
    }
    if (state is RequestedFailureProtectorState) {
      hideLoading();
      showToastMessage(state.errorMessage, ToastMessageType.error);
    }
    if (state is RequestedSuccessProtectorState) {
      showToastMessage(
          'Đã gửi thông báo đến người bảo hộ!', ToastMessageType.success);
      hideLoading();
      FirebaseMessaging.onMessage.listen((message) {
        final data = message.data;
        final dataRes = jsonDecode(data['data']);
        if (data['type'] == 'PROTECTOR_REQUEST_REPLY') {
          if (dataRes['isApproved']) {
            upgradePDoneBloc.add(ProtectorApprovedEvent());
          } else {
            upgradePDoneBloc.add(ProtectorRejectedEvent());
          }
        }
      });
    }
  }

  void _requestProtector() {
    upgradePDoneBloc.add(RequestProtectorEvent(req: protectorRequest));
  }

  @override
  void initState() {
    super.initState();
    upgradePDoneBloc.add(GetListMasterEvent());
  }

  SummaryProtectorRequestedResponse? protectorRequested;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpgradePDoneBloc, UpgradePDoneState>(
      listener: _listenerBloc,
      builder: (BuildContext context, UpgradePDoneState state) {
        if (state is GetListMasterSuccess) {
          final state = upgradePDoneBloc.state as GetListMasterSuccess;
          protectors = state.upgradeAccount.protectors ?? [];
          protectorRequested = state.protector;
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
    Protector? protector;

    if (protectors.isNotEmpty) {
      protector = protectors[0];
    }

    if (protectorRequested != null) {
      protector = protectors
          .where((element) => element.id == protectorRequested!.relation)
          .first;
      _pDoneIDOfProtectorCtl.text = protectorRequested?.protector.pDoneId ?? '';
      _phoneCtl.text = protectorRequested?.protector.phoneNumber ?? '';
      _idNumberOfProtectorCtl.text =
          protectorRequested?.protector.identityNumber ?? '';
      widget.updateProtectorStatus(true);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchInputInformationWidget<Protector>(
          type: UpdateInformationType.protector,
          initialValue: protector != null
              ? SuggestionsField<Protector>(
                  name: protector.name ?? '', data: protector)
              : null,
          suggestions: protectors
              .map(
                (e) => SuggestionsField<Protector>(name: e.name ?? '', data: e),
              )
              .toList(),
          onSelected: (protector) {
            protectorRequest.protector = protector?.id;
            widget.onUpdatePlaceInformation(protectorRequest);
          },
        ),
        InformationFieldGuardianWidget(
          type: UpdateInformationType.pDoneIDOfProtector,
          required: false,
          controller: _pDoneIDOfProtectorCtl,
          onChanged: (String? value) {
            protectorRequest.pDoneId = value;
            widget.onUpdatePlaceInformation(protectorRequest);
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
            widget.onUpdatePlaceInformation(protectorRequest);
          },
          onPhoneCodeChange: (val) {
            // _phoneCode.text = val.code.toString();
            protectorRequest.phoneCode = val.code;
            widget.onUpdatePlaceInformation(protectorRequest);
          },
        ),
        InformationFieldGuardianWidget(
          type: UpdateInformationType.idNumberOfProtector,
          controller: _idNumberOfProtectorCtl,
          required: false,
          onChanged: (String? value) {
            protectorRequest.identityNumber = value;
            widget.onUpdatePlaceInformation(protectorRequest);
          },
        ),
        _buildStatusProtectorRequest(context),
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

  Widget _buildStatusProtectorRequest(BuildContext context) {
    if (upgradePDoneBloc.state is ApproveProtectorState) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 18),
        child: Row(
          children: [
            ImageWidget(
              IconAppConstants.icApproved,
              width: 16,
              height: 16,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              'Xác thực thông tin người bảo hộ thành công',
              style: context.text.titleMedium!.copyWith(
                color: Colors.green,
              ),
            ),
          ],
        ),
      );
    }
    if (upgradePDoneBloc.state is RejectProtectorState) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 18),
        child: Row(
          children: [
            ImageWidget(
              IconAppConstants.icRejectProtector,
              width: 16,
              height: 16,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              'Người bảo hộ từ chối. Vui lòng điền thông tin khác',
              style: context.text.titleMedium!.copyWith(
                color: Colors.red,
              ),
            ),
          ],
        ),
      );
    }
    return Container();
  }
}
