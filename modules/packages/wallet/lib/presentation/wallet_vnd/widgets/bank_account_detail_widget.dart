import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import '../../../core/theme/wallet_theme.dart';
import '../../../domain/entities/wallet/bank_account.dart';
import '../../wallet_constant.dart';

class BankAccountDetailWidget extends StatelessWidget {
  final BankAccount bankAccount;
  final VoidCallback onTap;
  final BoxDecoration? decoration;
  final Widget? trailingIcon;

  const BankAccountDetailWidget({
    super.key,
    required this.bankAccount,
    required this.onTap,
    this.decoration,
    this.trailingIcon,
  });

  @override
  Widget build(BuildContext context) {
    final hiddenBankNumber = bankAccount.bankNumber != null &&
            bankAccount.bankNumber!.length >= 3
        ? '*${bankAccount.bankNumber?.substring((bankAccount.bankNumber!.length) - 3, bankAccount.bankNumber!.length)}'
        : '***';

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      decoration: decoration ??
          BoxDecoration(
            color: AppColors.white,
            borderRadius: WalletConstant.borderRadius12,
            border: Border.all(
              color: const Color(0xFFDAE0EE),
            ),
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
          ),
          child: Image.network(
            '${bankAccount.bank?.logo}',
            fit: BoxFit.fitWidth,
          ),
        ),
        title: Text(
          '${bankAccount.bank?.shortName}',
          overflow: TextOverflow.ellipsis,
          style: context.text.titleSmall?.copyWith(
            fontSize: 14,
            color: const Color(0xFF212121),
            height: 1.8,
          ),
        ),
        subtitle: Text(
          hiddenBankNumber,
          style: context.text.titleSmall?.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              height: 1.8,
              color: const Color(0xFF6E6E6E)),
        ),
        trailing: trailingIcon ??
            const Icon(
              Icons.arrow_forward_ios_outlined,
              color: Color(0xFF6E6E6E),
              size: 20,
            ),
      ),
    );
  }
}
