import 'package:app_core/app_core.dart';
import 'package:app_main/src/blocs/user/user_cubit.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';
import '../../general_setting/terms_conditions/widgets/text_static_content_widget.dart';
import 'widgets/contract_ja_content.dart';
import 'widgets/contract_widget.dart';

class ContractJAScreen extends StatefulWidget {
  static const String routeName = '/contract-ja';

  const ContractJAScreen({super.key});

  @override
  State<ContractJAScreen> createState() => _ContractJAScreenState();
}

class _ContractJAScreenState extends State<ContractJAScreen> {
  final userCubit = injector.get<UserCubit>();

  @override
  void initState() {
    userCubit.fetchUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldHideKeyboard(
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
      ),
      body: BlocBuilder<UserCubit, UserState>(
        bloc: userCubit,
        buildWhen: (previous, current) => current is GetProfileSuccess || current is GetProfileError,
        builder: (context, state) {
          if (state is GetProfileSuccess) {
            final user = state.currentUser;
            return AutoHideKeyboard(
              child: TextStaticContentWidget(
                title: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: ContractWidget(
                      no: '${user?.pDoneId}JA',
                      created: user?.jaAt ?? DateTime.now(),
                      expire: (user?.jaAt ?? DateTime.now())
                          .add(const Duration(days: 365)),
                    ),
                  ),
                ),
                contents: contractJAContents,
              ),
            );
          } else if (state is GetProfileError){
            hideLoading();
            showToastMessage(state.message, ToastMessageType.error);
          }
          return const SizedBox();
        },
      ),
    );
  }
}
