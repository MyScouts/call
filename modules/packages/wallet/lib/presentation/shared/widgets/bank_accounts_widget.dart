import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobilehub_ui_core/mobilehub_ui_core.dart';

import '../../../core/core.dart';
import '../../wallet_coodinator.dart';
import '../../wallet_vnd/bank_account/bloc/bank_account_bloc.dart';
import '../../wallet_vnd/widgets/add_bank_account_widget.dart';
import '../../wallet_vnd/widgets/bank_account_detail_widget.dart';

class BankAccountWidget extends StatefulWidget {
  const BankAccountWidget({Key? key}) : super(key: key);

  @override
  State<BankAccountWidget> createState() => _BankAccountWidgetState();
}

class _BankAccountWidgetState extends State<BankAccountWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<BankAccountBloc, BankAccountState>(
      buildWhen: (previous, current) =>
          current.whenOrNull(
            getBankAccountsSuccess: (bankAccounts) => true,
            getBankAccountsError: (err) => true,
          ) ??
          false,
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => const LoadingWidget(),
          getBankAccountsError: Text.new,
          getBankAccountsSuccess: (bankAccounts) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.horizontal,
                    vertical: 10,
                  ),
                  child: Text(
                    'Tài khoản ngân hàng',
                    style: context.text.titleMedium?.copyWith(
                        color: WalletTheme.grey72, fontWeight: FontWeight.w500),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      ...bankAccounts
                          .map(
                            (bankAccount) => Padding(
                              padding: EdgeInsets.only(
                                bottom: 10,
                                top: 5,
                                right: context.horizontal,
                                left: context.horizontal,
                              ),
                              child: BankAccountDetailWidget(
                                bankAccount: bankAccount,
                                onTap: () {
                                  context.bankAccountDetails(
                                    bankAccount: bankAccount,
                                    bankAccountBloc:
                                        context.read<BankAccountBloc>(),
                                  );
                                },
                              ),
                            ),
                          )
                          .toList(),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: context.horizontal),
                        child: const AddBankAccountWidget(),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
