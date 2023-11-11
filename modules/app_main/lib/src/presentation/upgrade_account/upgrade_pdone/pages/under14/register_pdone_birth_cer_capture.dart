import 'dart:convert';
import 'dart:developer';

import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/presentation/upgrade_account/upgrade_account_coordinator.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imagewidget/imagewidget.dart';

import '../../../../marshop/widgets/gradiant_button.dart';
import '../../bloc/upgrade_pdone/upgrade_pdone_bloc.dart';

class RegisterPdoneBirthCerCapture extends StatefulWidget {
  final VoidCallback onNextPage;

  const RegisterPdoneBirthCerCapture({
    super.key,
    required this.onNextPage,
  });

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RegisterPdoneBirthCerCaptureState();
  }
}

class _RegisterPdoneBirthCerCaptureState
    extends State<RegisterPdoneBirthCerCapture> {
  late MethodChannel _channel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _channel = const MethodChannel('flutter.sdk.ekyc/integrate');
  }

  UpgradePDoneBloc get upgradePDoneBloc => context.read<UpgradePDoneBloc>();

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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocListener<UpgradePDoneBloc, UpgradePDoneState>(
      listener: _onListenerBloc,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTitle(context),
                  _buildMainContent(context),
                  _buildGuide(context),
                ],
              ),
            ),
          ),
          _buildNextBtn(context),
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        'Chọn 1 trong 2 phương thức\nchụp ảnh hoặc tải ảnh lên từ thư viện',
        style: Theme.of(context).textTheme.headlineSmall,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildMainContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 13, 16, 21),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Chụp / tải ảnh giấy khai sinh',
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontSize: 18),
          ),
          const SizedBox(
            height: 12,
          ),
          Stack(
            children: [
              ImageWidget(ImageConstants.birthCerCapture),
              Positioned.fill(
                top: 272,
                left: 80,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    child: Column(
                      children: [
                        ImageWidget(
                          IconAppConstants.icCameraRound,
                          width: 48,
                          height: 48,
                        ),
                        Text(
                          'Chụp ảnh',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color: const Color(0xFF4B84F7),
                                  fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                top: 272,
                right: 80,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    child: Column(
                      children: [
                        ImageWidget(
                          IconAppConstants.icUploadImage,
                          width: 48,
                          height: 48,
                        ),
                        Text(
                          'Tải lên',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color: const Color(0xFF4B84F7),
                                  fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _startEKycByNameMethod({required String methodName}) async {
    final json = await _channel.invokeMethod(methodName, {
      "access_token":
          "bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI0YTIyNmUyZC04MDMwLTExZWUtYWU4Zi01YjgwYmEwYTYzMzEiLCJhdWQiOlsicmVzdHNlcnZpY2UiXSwidXNlcl9uYW1lIjoibWF6YWRhdDIwMjJAZ21haWwuY29tIiwic2NvcGUiOlsicmVhZCJdLCJpc3MiOiJodHRwczovL2xvY2FsaG9zdCIsIm5hbWUiOiJtYXphZGF0MjAyMkBnbWFpbC5jb20iLCJleHAiOjE3MDIyNTc1MzgsInV1aWRfYWNjb3VudCI6IjRhMjI2ZTJkLTgwMzAtMTFlZS1hZThmLTViODBiYTBhNjMzMSIsImF1dGhvcml0aWVzIjpbIlVTRVIiXSwianRpIjoiNjdjZDczNGQtMjM0NC00ZWNhLWE0MzktOGUxNjA5NDhlMDk3IiwiY2xpZW50X2lkIjoiY2xpZW50YXBwIn0.5NYSRtdwJOLGybxWtO0E1oLFo7-_om2GDU19j6G4IEumfut2hBXxzLCTSOlCHQcPHQKN6tysKkJPsj9pdNANZiPcIDCiGV6dkeiQeznGc4IjKMhT6jTNPZ02DczLjclo4_5bPrvvBo_sTNnDTTnZcyxp2HA3CGsnLhI-PzX9-1jiOzuS6tlgSWDXDWVClWQdyKhADO31yoJUlDG6Tzjitk5OyH0zCZsAG5UxNnMpuuubXuU6Rtikhcd3kDF27MGMWxZwqS2DUXn9H56a6yci9OipgbwiIXk5IHmIGcW3FuoBbCSl-7Rzbmr37NAd6686k3Q0_oxCfUq1Ddhz53FhCw",
      "token_id": "09d738ae-7ff0-592d-e063-62199f0a4bf3",
      "token_key":
          "MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBAMls304BphTl2gdcP8jsQbLEqyi235ncVCzGFm349ggV8P3M+LUGr1Bh45XzEdhlHj5ugfWOxLdJBVfILtlWXbECAwEAAQ==",
    });
    log(json);
    upgradePDoneBloc.add(
      ExtractingIdCardEvent(jsonDecode(json)),
    );
  }

  Widget _buildGuide(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: context.buildGuide(),
      ),
    );
  }

  Widget _buildNextBtn(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 26),
      child: GradiantButton(
        onPressed: () {
          _startEKycByNameMethod(methodName: 'startEkycFace');
          // widget.onNextPage.call();
        },
        height: 45,
        child: Text(
          'Xác thực',
          style: Theme.of(context)
              .textTheme
              .labelLarge
              ?.copyWith(color: AppColors.white),
        ),
      ),
    );
  }
}
