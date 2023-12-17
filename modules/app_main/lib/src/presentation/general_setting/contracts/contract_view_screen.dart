import 'dart:async';
import 'dart:io';

import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/presentation/general_setting/contracts/bloc/contract_bloc_cubit.dart';
import 'package:app_main/src/presentation/general_setting/contracts/contract_constant.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobilehub_ui_core/mobilehub_ui_core.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ContractViewScreen extends StatefulWidget {
  static const String routeName = 'contract-view';
  final TypeContract type;
  const ContractViewScreen({
    super.key,
    required this.type,
  });

  @override
  State<ContractViewScreen> createState() => _ContractViewScreenState();
}

class _ContractViewScreenState extends State<ContractViewScreen> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  ContractBlocCubit get _bloc => context.read();

  Future<File> createFileOfPdfUrl(String url) async {
    Completer<File> completer = Completer();
    showLoading();
    try {
      final filename = url.substring(url.lastIndexOf("/") + 1);
      var request = await HttpClient().getUrl(Uri.parse(url));
      var response = await request.close();
      var bytes = await consolidateHttpClientResponseBytes(response);
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/$filename");
      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }
    showToastMessage("Tải xuống hợp đồng thành công");
    hideLoading();
    return completer.future;
  }

  @override
  void initState() {
    super.initState();
    _bloc.renderPDF(type: widget.type);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          BlocBuilder<ContractBlocCubit, ContractBlocState>(
            builder: (context, state) {
              if (state is RenderPDFSuccess) {
                return IconButton(
                  onPressed: () => createFileOfPdfUrl(state.url),
                  icon: const Icon(Icons.file_download_outlined),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
      body: BlocBuilder<ContractBlocCubit, ContractBlocState>(
        builder: (context, state) {
          if (state is OnRenderPDF) return const LoadingWidget();
          if (state is RenderPDFSuccess) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SfPdfViewer.network(
                state.url,
                key: _pdfViewerKey,
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
