import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import '../../../../wallet.dart';
import '../../../core/theme/wallet_theme.dart';
import '../../../domain/entities/wallet/bank_account.dart';
import '../../wallet_constant.dart';

class BankAccountDetailWidget extends StatelessWidget {
  final BankAccount bankAccount;
  final VoidCallback onTap;
  final BoxDecoration? decoration;
  final Widget? trailingIcon;

  const BankAccountDetailWidget({
    Key? key,
    required this.bankAccount,
    required this.onTap,
    this.decoration,
    this.trailingIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      decoration: decoration ??
          BoxDecoration(
            color: AppColors.white,
            borderRadius: WalletConstant.borderRadius8,
            boxShadow: [
              BoxShadow(
                color: WalletTheme.black.withOpacity(0.1),
                offset: const Offset(0, 1),
                blurRadius: 14,
                spreadRadius: 0,
              ),
            ],
          ),
      child: ListTile(
        onTap: onTap.call,
        contentPadding: const EdgeInsets.symmetric(horizontal: 5),
        leading: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: WalletConstant.borderRadius10,
            color: WalletTheme.white,
            boxShadow: [
              BoxShadow(
                  color: WalletTheme.black.withOpacity(.1),
                  offset: const Offset(0, 1),
                  blurRadius: 14,
                  spreadRadius: 0),
            ],
          ),
          child: Image.network(
            '${bankAccount.bank?.logo}',
            fit: BoxFit.fitWidth,
          ),
        ),
        title: Text(
          '${bankAccount.bank?.name}',
          overflow: TextOverflow.ellipsis,
          style: context.text.titleSmall?.copyWith(fontSize: 14),
        ),
        subtitle: Text(
          '${bankAccount.bankHolder}\n${bankAccount.bankNumber}',
          style: context.text.titleSmall?.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 12,
            height: 1.3,
          ),
        ),
        trailing: trailingIcon ??
            RotatedBox(
              quarterTurns: 3,
              child: ImageWidget(IconAppConstants.icArrowLeft),
            ),
      ),
    );
  }
}
