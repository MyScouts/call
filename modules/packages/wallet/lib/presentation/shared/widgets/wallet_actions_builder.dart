import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/core.dart';
import '../../../di/wallet_micro.dart';
import '../../../domain/domain.dart';
import '../../presentation.dart';
import '../../wallet_constant.dart';
import '../../wallet_vnd/bank_account/bloc/bank_account_bloc.dart';
import '../bloc/wallet_bloc.dart';

class WalletVNDActions extends StatefulWidget {
  const WalletVNDActions({super.key});

  @override
  State<WalletVNDActions> createState() => _WalletVNDActionsState();
}

class _WalletVNDActionsState extends State<WalletVNDActions> {
  bool isOpeningTransactionHistory = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding:
          EdgeInsets.symmetric(horizontal: context.horizontal, vertical: 20),
      children: WalletVNDActionType.values
          .map(
            (type) => Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: WalletTheme.black.withOpacity(0.2),
                      spreadRadius: 0,
                      blurRadius: 7,
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
                child: OutlinedButton(
                  onPressed: () => onTap(type),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: AppColors.white,
                    foregroundColor: AppColors.blue10,
                    shape: RoundedRectangleBorder(
                      borderRadius: WalletConstant.borderRadius8,
                    ),
                    side: const BorderSide(color: WalletTheme.transparent),
                  ),
                  child: Builder(builder: (context) {
                    final icon = Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: type == WalletVNDActionType.transactionHistory &&
                              isOpeningTransactionHistory
                          ? WalletTheme.blueCheckedColor
                          : WalletTheme.black,
                      size: 20,
                    );

                    final child = ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 20,
                      ),
                      title: Text(
                        type.text,
                        style: context.text.titleMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color:
                              type == WalletVNDActionType.transactionHistory &&
                                      isOpeningTransactionHistory
                                  ? WalletTheme.blueCheckedColor
                                  : AppColors.black10,
                        ),
                      ),
                      trailing: icon,
                    );

                    switch (type) {
                      case WalletVNDActionType.bankAccountInfo:
                      case WalletVNDActionType.withdrawalOrder:
                        return child;
                      case WalletVNDActionType.transactionHistory:
                        return PopupMenuButton(
                          onOpened: () {
                            setState(() {
                              isOpeningTransactionHistory = true;
                            });
                          },
                          onCanceled: () {
                            setState(() {
                              isOpeningTransactionHistory = false;
                            });
                          },
                          position: PopupMenuPosition.under,
                          offset: const Offset(1, 0),
                          onSelected: (vendor) {
                            context.transactionHistory(vendor);
                            setState(() {
                              isOpeningTransactionHistory = false;
                            });
                          },
                          itemBuilder: (context) => [
                            ...TransactionHistoryVendor.values.map(
                              (e) => PopupMenuItem(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 4,
                                ),
                                value: e,
                                child: ListTile(
                                  title: Text(
                                    e.title,
                                    style: context.text.titleMedium?.copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: AppColors.black10,
                                    ),
                                  ),
                                  trailing: icon,
                                ),
                              ),
                            )
                          ],
                          child: child,
                        );
                    }
                  }),
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  void onTap(WalletVNDActionType type) {
    switch (type) {
      case WalletVNDActionType.bankAccountInfo:
        context.bankAccounts(
          vndWalletInfo: context.read<WalletBloc>().vndWalletInfo,
        );
        break;
      case WalletVNDActionType.withdrawalOrder:
        context.showChooseBankAccountDialog(
          bankAccountBloc: BankAccountBloc(injector()),
        );
        break;
      case WalletVNDActionType.transactionHistory:
        break;
    }
  }
}
