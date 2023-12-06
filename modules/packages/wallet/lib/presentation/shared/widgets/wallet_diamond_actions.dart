import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:wallet/presentation/shared/bloc/wallet_bloc.dart';
import '../../../core/core.dart';
import '../../presentation.dart';
import '../../wallet_constant.dart';
import '../../wallet_diamond/wallet_diamond_constant.dart';

class WalletDiamondActions extends StatefulWidget {
  const WalletDiamondActions({super.key, required this.walletBloc});

  final WalletBloc walletBloc;

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
              onTap: () {
                onTap(type).then((value) {
                  widget.walletBloc.add(const WalletEvent.getWalletInfo());
                });
              },
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

  Future<void> onTap(WalletDiamondActionType type) {
    switch (type) {
      case WalletDiamondActionType.chargeDiamondToVnd:
        return context.navigateCharDiamondToVND();
      case WalletDiamondActionType.transactionHistory:
        return context.startTransactionHistory(walletType: WalletType.diamond);
    }
  }
}
