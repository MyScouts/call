import 'package:design_system/design_system.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet/core/core.dart';
import 'package:wallet/presentation/presentation.dart';
import 'package:wallet/presentation/shared/widgets/toast_message/toast_message.dart';

import '../../../../../wallet.dart';
import '../../../../domain/entities/wallet/bank_account.dart';
import '../../../shared/widgets/app_bar.dart';
import '../../../wallet_constant.dart';
import '../../widgets/qrcode_widget.dart';
import '../bloc/bank_account_bloc.dart';

class BankAccountDetailsScreen extends StatefulWidget {
  final BankAccount bankAccount;
  static const String routeName = '/bank-account-details';

  const BankAccountDetailsScreen({Key? key, required this.bankAccount})
      : super(key: key);

  @override
  State<BankAccountDetailsScreen> createState() =>
      _BankAccountDetailsScreenState();
}

class _BankAccountDetailsScreenState extends State<BankAccountDetailsScreen> {
  late final screenPadding = EdgeInsets.symmetric(
    horizontal: context.horizontal,
    vertical: 5,
  );
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
          title: 'Tài khoản ngân hàng',
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
            padding: EdgeInsets.only(bottom: paddingBottom),
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: WalletTheme.blueCheckedColor,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.symmetric(
                          horizontal: context.horizontal,
                          vertical: 10,
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.check,
                              color: AppColors.white,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'Đã kiểm tra',
                              style: context.text.titleMedium?.copyWith(
                                color: AppColors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ...BankAccountField.values
                          .map((field) =>
                              bankAccountFiledWidget(bankAccountField: field))
                          .toList(),
                      Padding(
                        padding: screenPadding,
                        child: QrCodeWidget(
                          isChecked: true,
                          qrImage: widget.bankAccount.qrImage,
                        ),
                      ),
                      setDefaultBankAccountWidget()
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: context.horizontal),
                    child: SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: WalletConstant.borderRadius8,
                            side: const BorderSide(
                              color: AppColors.blue10,
                              width: 1,
                            ),
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
                          'XOÁ',
                          style: context.text.titleLarge?.copyWith(
                            fontSize: 18,
                            color: AppColors.blue10,
                          ),
                        ),
                      ),
                    ),
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
      padding: screenPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            bankAccountField.title,
            style: context.text.bodyMedium?.copyWith(
              color: WalletTheme.grey72,
              fontSize: 14,
            ),
          ),
          Text(
            fieldValue(bankAccountField),
            style: context.text.bodyMedium?.copyWith(
              color: WalletTheme.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 5),
          const Divider(
            color: WalletTheme.grey73,
            thickness: 1,
          ),
        ],
      ),
    );
  }

  String fieldValue(BankAccountField filed) {
    switch (filed) {
      case BankAccountField.bankName:
        return '${widget.bankAccount.bank?.name}';
      case BankAccountField.bankAccountNumber:
        return '${widget.bankAccount.bankNumber}';
      case BankAccountField.bankAccountHolder:
        return '${widget.bankAccount.bankHolder}';
    }
  }

  Widget setDefaultBankAccountWidget() {
    return StatefulBuilder(
      builder: (context, setState) {
        return Padding(
          padding: screenPadding,
          child: Row(
            children: [
              Text(
                'Thiết lập tài khoản mặc định',
                style: context.text.titleMedium?.copyWith(
                  color: WalletTheme.greyTextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              CupertinoSwitch(
                value: isDefault,
                activeColor: AppColors.blue10,
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
          ),
        );
      },
    );
  }
}
