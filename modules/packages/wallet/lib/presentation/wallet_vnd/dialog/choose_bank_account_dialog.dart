import 'package:app_core/app_core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:mobilehub_ui_core/mobilehub_ui_core.dart';
import 'package:wallet/core/core.dart';
import 'package:wallet/presentation/presentation.dart';

import '../../../../../wallet.dart';
import '../../../core/theme/wallet_theme.dart';
import '../../../domain/entities/wallet/bank_account.dart';
import '../../shared/model/bank_account_and_bloc_params.dart';
import '../../shared/widgets/gradiant_button.dart';
import '../../wallet_constant.dart';
import '../bank_account/bloc/bank_account_bloc.dart';
import '../widgets/add_bank_account_widget.dart';
import '../widgets/bank_account_detail_widget.dart';

class ChooseBankAccountDialog extends StatefulWidget {
  const ChooseBankAccountDialog({Key? key}) : super(key: key);

  @override
  State<ChooseBankAccountDialog> createState() =>
      _ChooseBankAccountDialogState();
}

class _ChooseBankAccountDialogState extends State<ChooseBankAccountDialog> {
  late final _bloc = context.read<BankAccountBloc>();

  bool showAllBankAccount = false;
  BankAccount? _selectedBankAccount;

  @override
  void initState() {
    _bloc.add(const BankAccountEvent.getBankAccounts());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const maxHeightBankAccountWidgets = 300.0;
    return Dialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: WalletConstant.borderRadius10,
      ),
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  context.horizontal12,
                  10,
                  context.horizontal12,
                  10,
                ),
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.close, color: AppColors.black10),
                ),
              ),
            ),
            Text(
              'Tài khoản đặt lệnh',
              style: context.text.titleMedium?.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            BlocConsumer<BankAccountBloc, BankAccountState>(
              listener: (context, state) {
                state.whenOrNull(
                  getBankAccountsSuccess: (bankAccounts) {
                    if (bankAccounts.isNotEmpty) {
                      _selectedBankAccount = bankAccounts.firstWhere(
                          (acc) => acc.isDefault == true,
                          orElse: () => bankAccounts.first);
                    }
                  },
                );
              },
              buildWhen: (previous, current) =>
                  current.whenOrNull(
                    getBankAccountsSuccess: (bankAccount) => true,
                  ) ??
                  false,
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () => const LoadingWidget(),
                  getBankAccountsError: Text.new,
                  getBankAccountsSuccess: (bankAccounts) {
                    return Column(
                      children: [
                        if (_selectedBankAccount != null)
                          BankAccountDetailWidget(
                            bankAccount: _selectedBankAccount!,
                            trailingIcon: RotatedBox(
                              quarterTurns: showAllBankAccount ? 2 : 0,
                              child: ImageWidget(IconAppConstants.icArrowLeft),
                            ),
                            onTap: () {
                              showAllBankAccount = !showAllBankAccount;
                              setState(() {});
                            },
                          ),
                        if (_selectedBankAccount != null)
                          Visibility(
                            visible: showAllBankAccount,
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              constraints: const BoxConstraints(
                                maxHeight: maxHeightBankAccountWidgets,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: WalletConstant.borderRadius10,
                              ),
                              child: Scrollbar(
                                child: ListView(
                                  shrinkWrap: true,
                                  children: [
                                    ...bankAccounts
                                        .where((account) =>
                                            account.id !=
                                            _selectedBankAccount!.id)
                                        .map(
                                          (bankAccount) =>
                                              BankAccountDetailWidget(
                                            bankAccount: bankAccount,
                                            trailingIcon: const SizedBox(),
                                            decoration: const BoxDecoration(
                                              color: WalletTheme
                                                  .greyBackgroundColor,
                                            ),
                                            onTap: () {
                                              _selectedBankAccount =
                                                  bankAccount;
                                              showAllBankAccount =
                                                  !showAllBankAccount;
                                              setState(() {});
                                            },
                                          ),
                                        )
                                        .toList(),
                                  ],
                                ),
                              ),
                            ),
                          )
                      ],
                    );
                  },
                );
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.horizontal,
                vertical: 10,
              ),
              child: const AddBankAccountWidget(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.horizontal,
                vertical: 30,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: WalletConstant.borderRadius8,
                          side: const BorderSide(
                            color: AppColors.blue10,
                            width: 1,
                          ),
                        ),
                      ),
                      onPressed: () => context.popNavigator(),
                      child: Text(
                        'HUỶ BỎ',
                        style: context.text.titleLarge?.copyWith(
                          fontSize: 18,
                          color: AppColors.blue10,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: GradiantButton(
                      onPressed: () {
                        if (_selectedBankAccount != null) {
                          context.popNavigator();
                          context.createWithdrawOrder(
                            bankAccountParams: BankAccountParams(
                              bankAccount: _selectedBankAccount!,
                              bankAccountBloc: _bloc,
                            ),
                          );
                        }
                      },
                      child: const Text('XÁC NHẬN'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
