import 'dart:io';

import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/presentation/upgrade_account/upgrade_ja/ui_model/ja_contract_content_ui_model.dart';
import 'package:app_main/src/presentation/upgrade_account/upgrade_ja/widgets/ja_contract_pdf_page.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

import '../../../blocs/user/user_cubit.dart';
import '../upgrade_pdone/bloc/pdone_information/pdone_information_bloc.dart';

class UpgradeJAPdfPreviewScreen extends StatelessWidget {
  static const String routeName = '/upgrade-ja-pdf-preview';

  const UpgradeJAPdfPreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PDoneInformationBloc>(
      create: (_) => injector.get(),
      child: const _UpgradeJAPdfPreviewScreenBody(),
    );
  }
}

class _UpgradeJAPdfPreviewScreenBody extends StatefulWidget {
  const _UpgradeJAPdfPreviewScreenBody();

  @override
  State<_UpgradeJAPdfPreviewScreenBody> createState() =>
      _UpgradeJAPdfPreviewScreenBodyState();
}

class _UpgradeJAPdfPreviewScreenBodyState
    extends State<_UpgradeJAPdfPreviewScreenBody> {
  late final userCubit = context.read<UserCubit>();

  late final pDoneInformationBloc = context.read<PDoneInformationBloc>();

  String get pDoneId => userCubit.currentUser?.pDoneId ?? '';

  @override
  void initState() {
    super.initState();
    pDoneInformationBloc.add(PDoneGetInformationEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Text('Hợp đồng'),
            ),
          ],
        ),
        centerTitle: true,
        titleSpacing: 0,
        elevation: 0,
        leading: IconButton(
          padding: const EdgeInsets.all(2),
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: BlocBuilder<PDoneInformationBloc, PDoneInformationState>(
        builder: (context, state) {
          if (state is PDoneLoadingInformation) {
            return const CircularProgressIndicator();
          }

          final pDoneInformationData = switch (pDoneInformationBloc.state) {
            (PDoneLoadedSuccessInformation state) => state.data,
            _ => null,
          };

          return PdfPreview(
            maxPageWidth: 700,
            initialPageFormat: PdfPageFormat.a4,
            build: (format) => JAContractPdfPage(
              JAContractContentUIModel(
                jaContractNumber: '${pDoneId}JA',
                user: userCubit.currentUser,
                pDoneInformationData: pDoneInformationData,
              ),
            ).buildPdf(format),
            actions: [
              PdfPreviewAction(
                icon: const Icon(Icons.save),
                onPressed: _saveAsFile,
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> _saveAsFile(
    BuildContext context,
    LayoutCallback build,
    PdfPageFormat pageFormat,
  ) async {
    try {
      final bytes = await build(pageFormat);

      Directory? appDocDir;

      if (Platform.isAndroid) {
        appDocDir = await getExternalStorageDirectory();
      }

      if (Platform.isIOS) {
        appDocDir = await getApplicationDocumentsDirectory();
      }

      final appDocPath = appDocDir?.path;
      final file = File('$appDocPath/hop_dong_${pDoneId}JA.pdf');
      await file.writeAsBytes(bytes);

      showToastMessage('Lưu hợp đồng thành công');
    } catch (e) {
      showToastMessage(e.toString());
    }
  }
}
