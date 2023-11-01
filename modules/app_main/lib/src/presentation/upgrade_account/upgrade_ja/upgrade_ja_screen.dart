import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/domain/entities/update_account/bank_acount/bank_account.dart';
import 'package:app_main/src/presentation/upgrade_account/upgrade_ja/widgets/accept_term_with_checkbox_widget.dart';
import 'package:app_main/src/presentation/upgrade_account/upgrade_ja/widgets/read_more_policy.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:mobilehub_bloc/mobilehub_bloc.dart';
import 'package:ui/ui.dart';

import '../../../data/models/responses/upgrade_account_response.dart';
import '../../../domain/entities/bank.dart';
import 'upgrade_agree_policy.bloc.dart';

class UpgradeJAScreen extends StatefulWidget {
  static const String routeName = '/upgrade-ja';
  final Team? team;

  const UpgradeJAScreen({super.key, this.team});

  @override
  State<UpgradeJAScreen> createState() => _UpgradeJAScreenState();
}

class _UpgradeJAScreenState extends State<UpgradeJAScreen> with ValidationMixin {
  String _getTitleAppBar() {
    if (widget.team != null) {
      return "Đăng ký tham gia ${widget.team?.name ?? ''}";
    }
    return 'HỢP ĐỒNG CỘNG TÁC VIÊN JA';
  }

  final _acceptTerm = ValueNotifier(false);

  @override
  void dispose() {
    _acceptTerm.dispose();
    super.dispose();
  }

  late final BankAccount defaultBank;

  @override
  void initState() {
    defaultBank = BankAccount(
      id: 108,
      userId: 301,
      bankNumber: "23232323",
      bankHolder: "SFSFSDF",
      qrImage: null,
      isDefault: true,
      createdAt: DateTime.now(),
      bank: const Bank(
        id: 3,
        name: "Ngân hàng TMCP Bắc Á",
        logo: "https://api.vietqr.io/img/BAB.png",
        shortName: 'BacABank',
      ),
    );
    super.initState();
  }

  UpgradeAccountBloc get upgradeAccountBloc => context.read();

  void _onListenUpgradeAgreePolicyBloc(BuildContext context, state) {
    if (state is GetDetailDataLoading) {
      showLoading();
    } else if (state is GetDetailDataSuccess<UpgradeAccountResponse>) {
      hideLoading();
    } else if (state is GetDetailError) {
      hideLoading();
      final e = state.error;
      if (e is DioError) {
        final message = e.toMessage(context);
        showToastMessage(message, ToastMessageType.warning);
      } else {
        final message = 'Lỗi đăng ký, Vui lòng thử lại.'
            ' ${kDebugMode ? state.error.toString() : ''}';
        showToastMessage(message, ToastMessageType.error);
      }
    }
  }

  Future<void> delayAndPopScreen(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 500));

    if (!mounted) {
      return;
    }
    Navigator.of(context).pop();
    //TODO: fetch user again
    // context.read<UserBloc>().add(FetchUserInfoEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(_getTitleAppBar()),
            ),
            Text(
              'Số: VN2A32345678JA',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: const Color(0xff828282)),
            ),
          ],
        ),
        centerTitle: true,
        titleSpacing: 0,
        elevation: 0,
        leading: IconButton(
          padding: const EdgeInsets.all(2),
          icon: const Icon(Icons.arrow_back),
          onPressed: Navigator.of(context).pop,
        ),
      ),
      body: BlocConsumer<UpgradeAccountBloc, GetDetailState>(
        listener: _onListenUpgradeAgreePolicyBloc,
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    const ReadMorePolicy(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Thông tin tài khoản ngân hàng',
                            style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 10),
                          ..._bankAccountField(
                            title: 'Tên ngân hàng',
                            leading: Container(
                              height: 35,
                              width: 60,
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(2),
                                border: Border.all(color: AppColors.greyBorder),
                              ),
                              child: Image.network('${defaultBank.bank?.logo}', fit: BoxFit.fill),
                            ),
                            content: defaultBank.bank?.shortName ?? '',
                          ),
                          const SizedBox(height: 15),
                          ..._bankAccountField(
                            title: 'Số tài khoản',
                            content: defaultBank.bankNumber ?? '',
                          ),
                          const SizedBox(height: 15),
                          ..._bankAccountField(
                            title: 'Tên chủ tài khoản',
                            content: defaultBank.bankHolder ?? '',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: AcceptTermWithCheckboxWidget(acceptTerm: _acceptTerm),
              ),
              ValueListenableBuilder(
                valueListenable: _acceptTerm,
                builder: (_, __, ___) {
                  return Padding(
                    padding:
                        EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom, right: 20, left: 20, top: 10),
                    child: PrimaryButton(
                      title: S.current.register,
                      onTap: () {},
                      disabled: !_acceptTerm.value,
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }

  List<Widget> _bankAccountField({
    required String title,
    Widget? leading,
    required String content,
  }) {
    return [
      Text(
        '$title:',
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w400),
      ),
      const SizedBox(height: 10),
      Container(
        decoration: BoxDecoration(
          color: AppColors.grey12,
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListTile(
          leading: leading,
          title: Text(
            content,
            style: context.text.titleSmall?.copyWith(fontSize: 14),
          ),
        ),
      )
    ];
  }
}

enum BankAccountField {
  name,
  bankNumber,
  bankAccountHolder,
}
