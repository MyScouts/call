import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:wallet/presentation/shared/widgets/toast_message/toast_message.dart';
import 'package:wallet/presentation/wallet_diamond/wallet_diamond_coodinator.dart';

import '../../../core/core.dart';
import '../../presentation.dart';
import '../../wallet_constant.dart';
import '../../wallet_diamond/wallet_diamond_constant.dart';

class WalletDiamondActions extends StatefulWidget {
  const WalletDiamondActions({super.key});

  @override
  State<WalletDiamondActions> createState() => _WalletDiamondActionsState();
}

class _WalletDiamondActionsState extends State<WalletDiamondActions> {
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
        ...WalletDiamondActionType.values.map(
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

  void onTap(WalletDiamondActionType type) {
    switch (type) {
      case WalletDiamondActionType.chargeDiamondToVnd:
        // if (context.userType == UserType.isPDone) {
        //   context.showRegisterJaDialog(
        //     walletType: WalletType.diamond,
        //     content: WalletConstant.registerJADialogText,
        //   );
        // } else {
        //   //TODO: navigate to charge screen
        // }

        showToastMessage(
          'Tính năng này đang được phát triển',
          ToastMessageType.warning,
        );
        break;
      case WalletDiamondActionType.transactionHistory:
        showToastMessage(
          'Tính năng này đang được phát triển',
          ToastMessageType.warning,
        );
        // context.diamondTransactionHistory();
        break;
    }
  }
}
