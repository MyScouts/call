import 'package:app_core/app_core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:mobilehub_ui_core/mobilehub_ui_core.dart';
import 'package:ui/ui.dart';
import 'package:wallet/presentation/presentation.dart';
import 'package:wallet/presentation/shared/widgets/toast_message/toast_message.dart';

import '../../../../core/configuratons/configurations.dart';
import '../../../../core/theme/wallet_theme.dart';
import '../../../../core/utils/input_formatter.dart';
import '../../../../domain/entities/wallet/bank_account.dart';
import '../../../shared/widgets/gradiant_button.dart';
import '../../../shared/widgets/tab_bar_widget.dart';
import '../../../wallet_constant.dart';
import '../../../wallet_diamond/bloc/wallet_diamond_bloc.dart';
import '../../../wallet_diamond/wallet_diamond_screen.dart';
import '../../../wallet_point/wallet_point_screen.dart';
import '../../bank_account/bloc/bank_account_bloc.dart';
import '../../widgets/bank_account_detail_widget.dart';
import 'confirm_withdraw_transaction_screen.dart';

class CreateWithdrawOrderScreen extends StatefulWidget {
  final BankAccount bankAccount;
  static const String routeName = '/create-withdraw-order';

  const CreateWithdrawOrderScreen({Key? key, required this.bankAccount})
      : super(key: key);

  @override
  State<CreateWithdrawOrderScreen> createState() =>
      _CreateWithdrawOrderScreenState();
}

class _CreateWithdrawOrderScreenState extends State<CreateWithdrawOrderScreen>
    with ValidationMixin {
  WalletType _selectedValue = WalletType.vshop;
  final controller = TextEditingController();
  late final _bloc = context.read<BankAccountBloc>();
  final dataKey = GlobalKey();
  final walletType = WalletType.coinVnd;

  @override
  void initState() {
    _bloc.add(const BankAccountEvent.getVndWalletInfo());
    super.initState();
  }

  @override
  void dispose() {
    validationListener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarBuilder(context, title: 'Rút tiền'),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: context.hideKeyboard,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(
                context.horizontal,
                10,
                context.horizontal,
                24,
              ),
              child: UserInfoCard(
                user: WalletInjectedData.user,
                walletInfo: WalletInjectedData.coinWalletInfo,
              ),
            ),
            const Divider(thickness: 8, color: WalletTheme.lightGrey),
            TabBarViewWidget(
              walletDOneComponent: const SizedBox(),
              walletCoinComponent: const WalletPointScreen(),
              walletDiamondComponent: BlocProvider(
                create: (context) => WalletDiamondBloc(injector()),
                child: const WalletDiamondScreen(),
              ),
              walletVndComponent: walletVndComponent(context),
              initialIndex: walletType.initialIndexTabBar,
            )
          ],
        ),
      ),
    );
  }

  Widget walletVndComponent(BuildContext context) {
    return BlocConsumer<BankAccountBloc, BankAccountState>(
      listener: (context, state) {
        state.whenOrNull(
          estimateTaxLoading: showLoading,
          error: (err) {
            hideLoading();
            showToastText(err);
          },
          estimateTaxSuccess: (value) {
            hideLoading();
            final params = WithdrawParams(
              value: num.parse(controller.text.replaceAll('.', '')),
              bankAccount: widget.bankAccount,
              pDoneId: '${WalletInjectedData.user.pDoneId}',
              sourceFrom: _selectedValue.name,
              taxValue: value,
              bankAccountBloc: _bloc,
            );
            context.confirmWithdrawTransaction(withdrawParams: params);
          },
        );
      },
      buildWhen: (previous, current) =>
          current.whenOrNull(
            getVndWalletInfoSuccess: (info) => true,
          ) ??
          false,
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => const LoadingWidget(),
          getVndWalletInfoSuccess: (info) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    decoration:
                        const BoxDecoration(color: WalletTheme.lightGrey),
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: context.horizontal,
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: context.horizontal,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: WalletConstant.borderRadius5,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Số dư khả dụng',
                            style: context.text.titleMedium?.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                          UserIconAsset(
                            amount: info.available
                                .toAppCurrencyString(isWithSymbol: false),
                            textStyle: context.text.titleLarge?.copyWith(
                              color: AppColors.blue10,
                            ),
                            iconWidth: 25,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          height: 50,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  color: WalletTheme.lightGrey, width: 2),
                              right: BorderSide(
                                  color: WalletTheme.lightGrey, width: 1),
                            ),
                          ),
                          // child: UserAsset(
                          //   spaceBetween: 10,
                          //   type: WalletType.live,
                          //   iconWidth: 30,
                          //   amount: info.availableVLive
                          //       .toAppCurrencyString(isWithSymbol: false),
                          //   textStyle: context.text.titleMedium?.copyWith(
                          //     color: WalletTheme.black,
                          //     fontSize: 16,
                          //     fontWeight: FontWeight.w500,
                          //   ),
                          // ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 50,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  color: WalletTheme.lightGrey, width: 2),
                              left: BorderSide(
                                  color: WalletTheme.lightGrey, width: 1),
                            ),
                          ),
                          // child: UserAsset(
                          //   type: WalletType.vshop,
                          //   spaceBetween: 10,
                          //   iconHeight: 25,
                          //   amount: info.availableVShop
                          //       .toAppCurrencyString(isWithSymbol: false),
                          //   textStyle: context.text.titleMedium?.copyWith(
                          //     color: WalletTheme.black,
                          //     fontSize: 16,
                          //     fontWeight: FontWeight.w500,
                          //   ),
                          // ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(context.horizontal),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Chọn nguồn tiền rút',
                              style: context.text.titleMedium?.copyWith(
                                color: WalletTheme.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                            const Spacer(),
                            StatefulBuilder(
                              builder: (context, setState) {
                                return DropdownButton<WalletType>(
                                  isDense: true,
                                  value: _selectedValue,
                                  icon: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 5),
                                    child:
                                        ImageWidget(IconAppConstants.icArrowTop),
                                  ),
                                  underline: const SizedBox(),
                                  onChanged: (WalletType? newValue) {
                                    setState(() {
                                      _selectedValue = newValue!;
                                    });
                                  },
                                  style: context.text.titleLarge?.copyWith(
                                    fontSize: 16,
                                    color: AppColors.blue10,
                                  ),
                                  items: [WalletType.live, WalletType.vshop]
                                      .map(
                                        (wallet) => DropdownMenuItem(
                                          value: wallet,
                                          child: Text(wallet.walletTypeText),
                                        ),
                                      )
                                      .toList(),
                                );
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              key: dataKey,
                              child: validationFormBuilder(
                                child: FormElement(
                                  name: 'amount',
                                  filled: false,
                                  controller: controller,
                                  hintText: 'Nhập số tiền cần rút',
                                  enableBorderColor:
                                      WalletTheme.greyLightBorder,
                                  focusedBorderColor:
                                      WalletTheme.greyLightBorder,
                                  borderRadius: WalletConstant.borderRadius5,
                                  keyBoardType: TextInputType.number,
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: ImageWidget(IconAppConstants.group),
                                  ),
                                  valueTransformer: AppTextInputFormatter
                                      .reversedFromCurrency,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    AppTextInputFormatter.currency,
                                  ],
                                  onChanged: (value) {
                                    onValidation();
                                  },
                                  validator: (value) {
                                    const minAmount = 50000;
                                    if (value == null || value.isEmpty) {
                                      return 'Bạn phải nhập số tiền';
                                    }
                                    final amount =
                                        int.parse(value.replaceAll('.', ''));
                                    if (amount >
                                        (_selectedValue == WalletType.live
                                            ? info.availableVLive!
                                            : info.availableVShop!)) {
                                      return 'Số tiền nhập vươt quá số dư';
                                    }
                                    if (amount < minAmount) {
                                      // ignore: lines_longer_than_80_chars
                                      return 'Số tiền tối thiểu là ${minAmount.toAppCurrencyString()}';
                                    }

                                    return null;
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: GradiantButton(
                                width: 100,
                                onPressed: () {
                                  controller.text = _selectedValue ==
                                          WalletType.live
                                      ? info.availableVLive.toAppCurrencyString(
                                          isWithSymbol: false)
                                      : info.availableVShop.toAppCurrencyString(
                                          isWithSymbol: false);
                                  controller.selection =
                                      TextSelection.fromPosition(
                                    TextPosition(
                                        offset: controller.text.length),
                                  );
                                },
                                child: const Text('Tất cả'),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        BankAccountDetailWidget(
                          bankAccount: widget.bankAccount,
                          trailingIcon: const SizedBox(),
                          onTap: () {},
                        ),
                        const SizedBox(height: 25),
                        GradiantButton(
                          onPressed: () {
                            if (isValidForm) {
                              _bloc.add(
                                BankAccountEvent.estimateTax(
                                  value: num.parse(
                                    controller.text.replaceAll('.', ''),
                                  ),
                                ),
                              );
                            }
                          },
                          child: IntrinsicWidth(
                            child: Row(
                              children: [
                                const Text('RÚT TIỀN'),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 5, bottom: 3),
                                  child: ImageWidget(
                                    IconAppConstants.icBird,
                                    width: 22,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).viewInsets.bottom,
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}
