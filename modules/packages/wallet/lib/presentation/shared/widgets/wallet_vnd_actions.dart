import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:wallet/presentation/shared/widgets/toast_message/toast_message.dart';
import 'package:wallet/presentation/wallet_coodinator.dart';

import '../../../core/core.dart';
import '../../../di/wallet_micro.dart';
import '../../wallet_constant.dart';
import '../../wallet_vnd/bank_account/bloc/bank_account_bloc.dart';

class WalletVNDActions extends StatefulWidget {
  const WalletVNDActions({super.key});

  @override
  State<WalletVNDActions> createState() => _WalletVNDActionsState();
}

class _WalletVNDActionsState extends State<WalletVNDActions> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 10),
          child: Text(
            'Quản lý của bạn',
            style: context.text.titleMedium?.copyWith(
              color: const Color(0xFF212121),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        ...WalletVNDActionType.values.map(
          (type) {
            return ListTile(
              onTap: () => onTap(type),
              leading: type.icon,
              title: Text(
                type.text,
                style: context.text.titleMedium?.copyWith(
                    color: WalletTheme.textBoldColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
              subtitle: Text(
                type.desc,
                style: context.text.titleMedium?.copyWith(
                    color: WalletTheme.subtitleColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
              trailing: const Icon(
                Icons.keyboard_arrow_right_outlined,
                color: Color(0xFF838383),
              ),
            );
          },
        ),
        SizedBox(height: MediaQuery.of(context).padding.bottom)
      ],
    );
  }

  void onTap(WalletVNDActionType type) {
    switch (type) {
      case WalletVNDActionType.bankAccountInfo:
        if (WalletInjectedData.user.pDoneId != null &&
            WalletInjectedData.user.pDoneId!.isNotEmpty) {
          context.bankAccounts();
        } else {
          context.showNotificationDialog(
            content: 'Bạn cần phải là PDone để thực hiện thao tác này',
          );
        }
        break;
      case WalletVNDActionType.withdrawalOrder:
        // if (WalletInjectedData.user.jaAt is DateTime) {
        //   context.startWithdraw();
        // } else {
        //   context.showNotificationDialog(
        //     content: 'Bạn cần phải là JA để thực hiện thao tác này',
        //   );
        // }
        showToastMessage(
          'Tính năng này đang được phát triển',
          ToastMessageType.warning,
        );

        break;
      case WalletVNDActionType.transactionHistory:
        context.startTransactionHistory(walletType: WalletType.vnd);
        break;
    }
  }
}
