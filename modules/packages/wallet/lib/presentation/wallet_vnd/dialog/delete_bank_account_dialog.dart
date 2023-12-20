import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet/core/core.dart';
import '../../wallet_constant.dart';
import '../bank_account/bloc/bank_account_bloc.dart';

class DeleteBankAccountDialog extends StatelessWidget {
  final int bankAccountId;

  const DeleteBankAccountDialog({super.key, required this.bankAccountId});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      insetPadding: EdgeInsets.symmetric(horizontal: context.horizontal),
      shape: RoundedRectangleBorder(
        borderRadius: WalletConstant.borderRadius10,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Opacity(
                  opacity: 0,
                  child: InkWell(
                    onTap: () {},
                    child: const Icon(Icons.close),
                  ),
                ),
                const Spacer(),
                Text(
                  'Huỷ liên kết thẻ',
                  style: context.text.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    height: 24 / 16,
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: context.popNavigator,
                  child: const Icon(Icons.close),
                ),
              ],
            ),
            const SizedBox(height: 25),
            Text(
              'Bạn chắn chắn muốn huỷ liên kết thẻ ngân hàng với ví của mình?',
              style: context.text.titleLarge?.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF6E6E6E),
                height: 20 / 14,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 35),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 20,
                      ),
                      backgroundColor: const Color(0xFFF4F4F4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: context.popNavigator,
                    child: Text(
                      'Quay về',
                      style: context.text.bodyLarge?.copyWith(
                        color: const Color(0xFF6E6E6E),
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        height: 24 / 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 12,
                      ),
                      backgroundColor: const Color(0xFFDE372D),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      context.popNavigator();
                      context.read<BankAccountBloc>().add(
                            BankAccountEvent.deleteBankAccount(
                              bankId: bankAccountId,
                            ),
                          );
                    },
                    child: Text(
                      'Huỷ liên kết',
                      style: context.text.bodyLarge?.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        height: 24 / 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
          ],
        ),
      ),
    );
  }
}
