import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:wallet/data/datasources/models/response/wallet_info_response.dart';
import 'package:wallet/presentation/wallet_coodinator.dart';
import 'package:wallet/presentation/wallet_point/wallet_point_constant.dart';
import 'package:wallet/presentation/wallet_point/wallet_point_coodinator.dart';

import '../../../core/core.dart';
import '../../wallet_constant.dart';
import '../bloc/wallet_bloc.dart';

class WalletCoinActions extends StatefulWidget {
  const WalletCoinActions(
      {super.key, required this.walletBloc});

  final WalletBloc walletBloc;

  @override
  State<WalletCoinActions> createState() => _WalletCoinActionsState();
}

class _WalletCoinActionsState extends State<WalletCoinActions> {
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
        ...WalletPointActionType.values.map(
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

  Future<void> onTap(WalletPointActionType type) {
    switch (type) {
      case WalletPointActionType.pointAgency:
        return context.pointAllAgency();
      case WalletPointActionType.transactionHistory:
        return context.startTransactionHistory(walletType: WalletType.coin);
    }
  }
}
