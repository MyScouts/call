import 'package:app_core/app_core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:mobilehub_ui_core/mobilehub_ui_core.dart';
import 'package:ui/ui.dart';
import 'package:wallet/core/core.dart';
import 'package:wallet/presentation/presentation.dart';
import 'package:wallet/presentation/shared/bloc/wallet_bloc.dart';
import 'package:wallet/presentation/wallet_constant.dart';

import '../../../../domain/entities/wallet/bank_account.dart';
import '../../../shared/widgets/app_bar.dart';
import '../../bank_account/bloc/bank_account_bloc.dart';
import '../../widgets/bank_account_detail_widget.dart';
import 'confirm_withdraw_transaction_screen.dart';

class WithdrawScreen extends StatefulWidget {
  static const String routeName = '/withdraw';

  const WithdrawScreen({super.key});

  @override
  State<WithdrawScreen> createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen> with ValidationMixin {
  final _controller = TextEditingController();

  final ValueNotifier<bool> _withDrawAllAvailable = ValueNotifier(false);
  final ValueNotifier<bool> _isValid = ValueNotifier(false);

  late final _bloc = context.read<BankAccountBloc>();
  BankAccount? _selectedBankAccount;
  bool showAllBankAccount = false;
  final maxHeightBankAccountWidgets = 300.0;

  void _onChangedCheckbox(bool? value) {
    _withDrawAllAvailable.value = value == true;
    if (value == true) {
      _controller.text =
          WalletInjectedData.userWallet.availableVnd.toAppCurrencyString(
        isWithSymbol: false,
      );
    }
    _isValid.value = isValidForm && _selectedBankAccount != null;
  }

  @override
  void initState() {
    _bloc.add(const BankAccountEvent.getBankAccounts());
    super.initState();
  }

  @override
  void dispose() {
    _withDrawAllAvailable.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AutoHideKeyboard(
      child: Scaffold(
        appBar: appbarBuilder(
          context,
          title: 'Rút tiền',
          leading: IconButton(
            padding: const EdgeInsets.all(2),
            icon: const Icon(Icons.arrow_back),
            onPressed: context.popNavigator,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              _buildAvailableVnd(),
              const SizedBox(height: 20),
              const Divider(color: WalletTheme.dividerColor, thickness: 8),
              const SizedBox(height: 20),
              _buildInput(),
              const Divider(color: WalletTheme.dividerColor, thickness: 8),
              const SizedBox(height: 20),
              _buildBankAccount(),
              const SizedBox(height: 40),
              _buildWithdrawBtn(),
              SizedBox(height: MediaQuery.of(context).padding.bottom),
            ],
          ),
        ),
      ),
    );
  }

  _buildAvailableVnd() {
    return BlocBuilder<WalletBloc, WalletState>(
      bloc: injector.get<WalletBloc>(),
      builder: (context, state) => Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: context.horizontal),
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFFF8F9FD),
            borderRadius: WalletConstant.borderRadius12,
            // image: DecorationImage(
            //   image: AssetImage(ImageConstants.walletTotalDiamond),
            //   fit: BoxFit.cover,
            // ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 25),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'Số dư khả dụng\n',
              style: context.text.bodyMedium?.copyWith(
                color: WalletTheme.textColor,
                fontWeight: FontWeight.w500,
              ),
              children: [
                TextSpan(
                  text: WalletInjectedData.userWallet.availableVnd
                      .toAppCurrencyString(),
                  style: context.text.headlineLarge?.copyWith(
                    color: const Color(0xFF085CAF),
                    fontSize: 28,
                    height: 1.6,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildInput() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.horizontal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Số tiền',
            style: context.text.titleMedium?.copyWith(
              height: 24 / 16,
              fontSize: 16,
            ),
          ),
          validationFormBuilder(
            child: TextFormField(
              style: context.textTheme.titleLarge!.copyWith(
                color: AppColors.blue33,
                fontSize: 24,
              ),
              controller: _controller,
              validator: (value) {
                const minAmount = 10000;
                if (value == null || value.isEmpty) {
                  return 'Bạn phải nhập số tiền';
                }
                final amount = double.parse(value.replaceAll('.', ''));
                if (amount >
                    WalletInjectedData.userWallet.availableVnd!.toDouble()) {
                  return 'Số tiền nhập vươt quá số dư';
                }
                if (amount < minAmount) {
                  // ignore: lines_longer_than_80_chars
                  return 'Số tiền tối thiểu là ${minAmount.toAppCurrencyString()}';
                }

                return null;
              },
              onChanged: (value) {
                onValidation();
                _isValid.value = isValidForm && _selectedBankAccount != null;
              },
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.black10.withOpacity(0.6),
                    width: 1,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.black10.withOpacity(0.6),
                    width: 1,
                  ),
                ),
                focusedErrorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.black10.withOpacity(0.6),
                    width: 1,
                  ),
                ),
                errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.black10.withOpacity(0.6),
                    width: 1,
                  ),
                ),
                suffixIcon: IconButton(
                  splashColor: Colors.transparent,
                  onPressed: () {
                    _controller.clear();
                    _withDrawAllAvailable.value = false;
                    onValidation();
                    _isValid.value =
                        isValidForm && _selectedBankAccount != null;
                  },
                  iconSize: 12,
                  icon: Container(
                    margin: const EdgeInsets.only(top: 12),
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: const Color(0XFFACACAC),
                      borderRadius: BorderRadius.circular(90),
                    ),
                    child: const Icon(
                      Icons.clear,
                      color: AppColors.white,
                    ),
                  ),
                ),
                // disabledBorder: InputBorder.none,
                hintText: 'Nhập số tiền muốn rút',
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: AppColors.black10.withOpacity(0.6),
                  fontWeight: FontWeight.normal,
                ),
              ),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                AppTextInputFormatter.currency,
              ],
            ),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              _onChangedCheckbox(!_withDrawAllAvailable.value);
            },
            child: Row(
              children: [
                ValueListenableBuilder(
                  valueListenable: _withDrawAllAvailable,
                  builder: (_, __, ___) => Checkbox(
                    value: _withDrawAllAvailable.value,
                    activeColor: context.theme.primaryColor,
                    onChanged: _onChangedCheckbox,
                    visualDensity: const VisualDensity(horizontal: 0),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
                Text(
                  'Rút toàn bộ số dư còn lại',
                  style: context.text.bodyMedium,
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, bottom: 25),
            decoration: BoxDecoration(
              color: const Color(0xFFF6F6F6),
              borderRadius: WalletConstant.borderRadius12,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.info_outline, color: Color(0xFF989898)),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Tiền sẽ chuyển đến tài khoản Ngân hàng trong vòng 1 đến 2 ngày. Trong trường hợp thất bại, tiền sẽ tự động được hoàn về Ví của bạn',
                    style: context.text.bodyMedium?.copyWith(
                      color: const Color(0xFF989898),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildBankAccount() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.horizontal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Rút tiền tới tài khoản',
            style: context.text.titleMedium?.copyWith(
              height: 24 / 16,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 15),
          BlocConsumer<BankAccountBloc, BankAccountState>(
            listener: (context, state) {
              state.whenOrNull(
                getBankAccountsSuccess: (bankAccounts) {
                  if (bankAccounts.isNotEmpty) {
                    _selectedBankAccount = bankAccounts.firstWhere(
                        (acc) => acc.isDefault == true,
                        orElse: () => bankAccounts.first);
                  }
                },
              );
            },
            buildWhen: (previous, current) =>
                current.whenOrNull(
                  getBankAccountsSuccess: (bankAccount) => true,
                ) ??
                false,
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () => const LoadingWidget(),
                getBankAccountsError: Text.new,
                getBankAccountsSuccess: (bankAccounts) {
                  return Column(
                    children: [
                      if (_selectedBankAccount != null)
                        BankAccountDetailWidget(
                          bankAccount: _selectedBankAccount!,
                          trailingIcon: RotatedBox(
                            quarterTurns: showAllBankAccount ? 2 : 0,
                            child: ImageWidget(
                              IconAppConstants.icArrowDown,
                              width: 25,
                            ),
                          ),
                          onTap: () {
                            showAllBankAccount = !showAllBankAccount;
                            setState(() {});
                          },
                        ),
                      if (_selectedBankAccount != null)
                        Visibility(
                          visible: showAllBankAccount,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 5,
                            ),
                            constraints: BoxConstraints(
                              maxHeight: maxHeightBankAccountWidgets,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: WalletConstant.borderRadius10,
                              color: WalletTheme.bgColor,
                            ),
                            child: ListView(
                              shrinkWrap: true,
                              padding: const EdgeInsets.only(top: 10),
                              children: [
                                ...bankAccounts
                                    .where((account) =>
                                        account.id != _selectedBankAccount!.id)
                                    .map(
                                      (bankAccount) => Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 12),
                                        child: BankAccountDetailWidget(
                                          bankAccount: bankAccount,
                                          trailingIcon: const SizedBox(),
                                          onTap: () {
                                            _selectedBankAccount = bankAccount;
                                            showAllBankAccount =
                                                !showAllBankAccount;
                                            setState(() {});
                                          },
                                        ),
                                      ),
                                    ),
                              ],
                            ),
                          ),
                        )
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  _buildWithdrawBtn() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.horizontal),
      child: ValueListenableBuilder(
        valueListenable: _isValid,
        builder: (BuildContext context, bool value, Widget? child) {
          return PrimaryButton(
            title: 'Rút tiền',
            onTap: () {
              final params = WithdrawParams(
                value: num.parse(_controller.text.replaceAll('.', '')),
                bankAccount: _selectedBankAccount!,
                pDoneId: '${WalletInjectedData.user.pDoneId}',
              );
              context
                  .confirmWithdrawTransaction(withdrawParams: params)
                  .then((value) {
                _controller.clear();
                _withDrawAllAvailable.value = false;
                onValidation();
                _isValid.value = isValidForm && _selectedBankAccount != null;
              });
            },
            disabled: !value,
            width: double.infinity,
          );
        },
      ),
    );
  }
}
