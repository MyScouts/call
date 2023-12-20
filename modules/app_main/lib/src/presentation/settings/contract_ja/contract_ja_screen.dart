import 'package:app_core/app_core.dart';
import 'package:app_main/src/blocs/user/user_cubit.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/presentation/general_setting/contracts/bloc/contract_bloc_cubit.dart';
import 'package:app_main/src/presentation/general_setting/contracts/contract_constant.dart';
import 'package:flutter/material.dart';
import 'package:mobilehub_ui_core/mobilehub_ui_core.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:ui/ui.dart';
import 'widgets/contract_widget.dart';

import '../../general_setting/terms_conditions/widgets/text_static_content_widget.dart';

class ContractJAScreen extends StatefulWidget {
  static const String routeName = '/contract-ja';

  const ContractJAScreen({super.key});

  @override
  State<ContractJAScreen> createState() => _ContractJAScreenState();
}

class _ContractJAScreenState extends State<ContractJAScreen> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  final userCubit = injector.get<UserCubit>();
  final _storageService = injector.get<StorageService>();
  late final ContractBlocCubit _contractBloc = context.read();

  @override
  void initState() {
    userCubit.fetchUser();
    super.initState();
    _contractBloc.renderPDF(type: TypeContract.jA);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScaffoldHideKeyboard(
        appBar: AppBar(
          title: const Text('HỢP ĐỒNG CỘNG TÁC VIÊN JA'),
          centerTitle: true,
          titleSpacing: 0,
          elevation: 0,
          leading: IconButton(
            padding: const EdgeInsets.all(2),
            icon: const Icon(Icons.arrow_back),
            onPressed: Navigator.of(context).pop,
          ),
          actions: [
            BlocBuilder<ContractBlocCubit, ContractBlocState>(
              builder: (context, state) {
                if (state is RenderPDFSuccess) {
                  return IconButton(
                    onPressed: () async {
                      showLoading();
                      try {
                        await _storageService.savedApplicationFile(state.url);
                        hideLoading();
                        showToastMessage("Lưu hợp đồng thành công");
                      } catch (e) {
                        hideLoading();
                        showToastMessage("Lưu hợp đồng thất bại");
                      }
                    },
                    icon: const Icon(Icons.file_download_outlined),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
        body: Column(
          children: [
            BlocBuilder<UserCubit, UserState>(
              bloc: userCubit,
              buildWhen: (previous, current) =>
                  current is GetProfileSuccess || current is GetProfileError,
              builder: (context, state) {
                if (state is GetProfileSuccess) {
                  final user = state.currentUser;
                  return TextStaticContentWidget(
                    title: Center(
                      child: ContractWidget(
                        no: '${user?.pDoneId}JA',
                        created: user?.jaAt ?? DateTime.now(),
                        expire: (user?.jaAt ?? DateTime.now())
                            .add(const Duration(days: 365)),
                      ),
                    ),
                    contents: [],
                  );
                }
                return const SizedBox();
              },
            ),
            Expanded(
              child: BlocBuilder<ContractBlocCubit, ContractBlocState>(
                bloc: _contractBloc,
                builder: (context, state) {
                  if (state is RenderPDFSuccess) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SfPdfViewer.network(
                        state.url,
                        key: _pdfViewerKey,
                      ),
                    );
                  } else if (state is OnRenderPDF) {
                    return const LoadingWidget();
                  }
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
