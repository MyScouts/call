import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:wallet/core/core.dart';

import '../../../../wallet.dart';
import '../../shared/widgets/common_outline_button.dart';
import '../../shared/widgets/gradiant_button.dart';
import '../../wallet_constant.dart';
import '../bank_account/bloc/bank_account_bloc.dart';

class DeleteBankAccountDialog extends StatelessWidget {
  final int bankAccountId;

  const DeleteBankAccountDialog({Key? key, required this.bankAccountId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: context.horizontal),
      shape: RoundedRectangleBorder(
        borderRadius: WalletConstant.borderRadius10,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: context.horizontal12, vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: context.popNavigator,
                child: const Icon(Icons.close),
              ),
            ),
            const SizedBox(height: 25),
            ImageWidget(IconAppConstants.icClear),
            const SizedBox(height: 20),
            Text(
              'Bạn có chắc chắn muốn xóa tài khoản ngân hàng khỏi danh sách',
              style: context.text.titleLarge?.copyWith(
                  fontSize: 18, fontWeight: FontWeight.w500, height: 1.2),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                const SizedBox(width: 20),
                Expanded(
                  child: CommonOutlineButton(
                    onPressed: context.popNavigator,
                    height: 50,
                    borderRadius: WalletConstant.borderRadius90,
                    label: 'Huỷ',
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: GradiantButton(
                    onPressed: () {
                      context.popNavigator();
                      context.read<BankAccountBloc>().add(
                            BankAccountEvent.deleteBankAccount(
                                bankId: bankAccountId),
                          );
                    },
                    height: 50,
                    borderRadius: WalletConstant.borderRadius90,
                    child: const Text('Xác nhận'),
                  ),
                ),
                const SizedBox(width: 20),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
