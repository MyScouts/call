import 'package:design_system/design_system.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet/core/core.dart';
import 'package:wallet/presentation/presentation.dart';
import 'package:wallet/presentation/shared/widgets/toast_message/toast_message.dart';

import '../../../../domain/entities/wallet/bank_account.dart';
import '../../../wallet_constant.dart';
import '../../widgets/qrcode_widget.dart';
import '../bloc/bank_account_bloc.dart';

class BankAccountDetailsScreen extends StatefulWidget {
  final BankAccount bankAccount;
  static const String routeName = '/bank-account-details';

  const BankAccountDetailsScreen({super.key, required this.bankAccount});

  @override
  State<BankAccountDetailsScreen> createState() =>
      _BankAccountDetailsScreenState();
}

class _BankAccountDetailsScreenState extends State<BankAccountDetailsScreen> {
  late final paddingBottom = MediaQuery.of(context).padding.bottom;
  late final _bloc = context.read<BankAccountBloc>();

  late bool isDefault;

  @override
  void initState() {
    isDefault = widget.bankAccount.isDefault ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: context.hideKeyboard,
      child: Scaffold(
        appBar: appbarBuilder(
          context,
          title: 'Thông tin khoản ngân hàng',
          leading: IconButton(
            padding: const EdgeInsets.all(2),
            icon: const Icon(Icons.arrow_back),
            onPressed: context.backToBankAccounts,
          ),
        ),
        body: BlocListener<BankAccountBloc, BankAccountState>(
          listener: (context, state) {
            state.whenOrNull(
              deleteBankAccountLoading: showLoading,
              setDefaultBankAccountLoading: showLoading,
              setDefaultBankAccountSuccess: () {
                hideLoading();
                _bloc.add(const BankAccountEvent.getBankAccounts());
              },
              deleteBankAccountSuccess: () {
                hideLoading();
                _bloc.add(const BankAccountEvent.getBankAccounts());
                context.backToBankAccounts();
              },
            );
          },
          child: Padding(
            padding: EdgeInsets.only(
              bottom: paddingBottom,
              left: context.horizontal,
              right: context.horizontal,
            ),
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      ...BankAccountField.values.map(
                        (field) =>
                            bankAccountFiledWidget(bankAccountField: field),
                      ),
                      QrCodeWidget(
                        isChecked: true,
                        qrImage: widget.bankAccount.qrImage,
                      ),
                      setDefaultBankAccountWidget(),
                      const SizedBox(height: 40),
                      SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 20,
                            ),
                            backgroundColor: const Color(0xFFFEF3F2),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            if (widget.bankAccount.id != null) {
                              context.showDeleteBankAccount(
                                id: widget.bankAccount.id!,
                                bloc: _bloc,
                              );
                            }
                          },
                          child: Text(
                            'Huỷ liên kết',
                            style: context.text.bodyLarge?.copyWith(
                              color: const Color(0xFFDE372D),
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              height: 24 / 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget bankAccountFiledWidget({required BankAccountField bankAccountField}) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Row(
        children: [
          Text(
            bankAccountField.title,
            style: context.text.bodyMedium?.copyWith(
              color: const Color(0xFF6E6E6E),
              fontSize: 14,
              height: 20 / 14,
            ),
          ),
          Expanded(
            child: Text(
              fieldValue(bankAccountField),
              textAlign: TextAlign.end,
              style: context.text.bodyMedium?.copyWith(
                color: WalletTheme.black,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                height: 20 / 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String fieldValue(BankAccountField filed) {
    switch (filed) {
      case BankAccountField.bankName:
        return '${widget.bankAccount.bank?.shortName}';
      case BankAccountField.bankAccountNumber:
        String hiddenBankNumber = '';
        for (int i = 0; i < widget.bankAccount.bankNumber!.length - 3; i++) {
          hiddenBankNumber = '$hiddenBankNumber*';
        }

        final lastThreeDigits = widget.bankAccount.bankNumber != null &&
                widget.bankAccount.bankNumber!.length >= 3
            ? '*${widget.bankAccount.bankNumber?.substring((widget.bankAccount.bankNumber!.length) - 3, widget.bankAccount.bankNumber!.length)}'
            : '***';

        return '$hiddenBankNumber$lastThreeDigits';
      case BankAccountField.bankAccountHolder:
        return '${widget.bankAccount.bankHolder}';
    }
  }

  Widget setDefaultBankAccountWidget() {
    return StatefulBuilder(
      builder: (context, setState) {
        return Row(
          children: [
            Text(
              'Tài khoản mặc định thanh toán',
              style: context.text.bodyMedium?.copyWith(
                color: const Color(0xFF6E6E6E),
                fontSize: 14,
                height: 20 / 14,
              ),
            ),
            const Spacer(),
            CupertinoSwitch(
              value: isDefault,
              activeColor: const Color(0xFF00A65F),
              onChanged: (value) {
                isDefault = value;
                if (widget.bankAccount.id != null) {
                  _bloc.add(
                    BankAccountEvent.setDefaultBankAccount(
                      bankAccountId: widget.bankAccount.id!,
                      isDefault: isDefault,
                    ),
                  );
                }
                setState(() {});
              },
            )
          ],
        );
      },
    );
  }
}
