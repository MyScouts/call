import 'package:app_core/app_core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imagewidget/imagewidget.dart';

import '../../../core/core.dart';
import '../../../domain/domain.dart';
import '../../shared/bloc/wallet_bloc.dart';
import '../../shared/shared.dart';
import '../../shared/widgets/gradiant_button.dart';
import '../../wallet_constant.dart';
import '../bloc/wallet_diamond_bloc.dart';
import '../dialogs/dialogs.dart';
import '../wallet_diamond_constant.dart';

class WalletDiamondInputForm extends StatefulWidget {
  final DiamondWalletInfo vndWalletInfo;

  const WalletDiamondInputForm({
    Key? key,
    required this.vndWalletInfo,
  }) : super(key: key);

  @override
  State<WalletDiamondInputForm> createState() => _WalletDiamondInputFormState();
}

class _WalletDiamondInputFormState extends State<WalletDiamondInputForm>
    with ValidationMixin {
  final _diamondController = TextEditingController(),
      _vndController = TextEditingController(text: '0');

  String? _validateDiamond(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập số kim cương';
    }

    final valueInt = int.tryParse(value.replaceAll('.', ''));

    if (valueInt == null) {
      return 'Số kim cương không hợp lệ';
    }

    if (valueInt > (widget.vndWalletInfo.available ?? 0)) {
      return 'Số kim cương trong ví không đủ. Vui lòng nhập lại';
    }

    if (valueInt < 100) {
      return 'Số kim cương tối thiểu là 100';
    }

    handleUpdateVND(valueInt);

    return null;
  }

  void handleUpdateVND(int valueInt) {
    EasyDebounce.debounce(
      'updateExchangeDiamondVND',
      const Duration(milliseconds: 500),
      () => context
          .read<WalletDiamondBloc>()
          .add(UpdateExchangeDiamondVND(valueInt)),
    );
  }

  void setExchangeVNDValue(int i) => EasyDebounce.debounce(
        'setExchangeDiamondVND',
        const Duration(milliseconds: 500),
        () => context.read<WalletDiamondBloc>().add(SetExchangeDiamondVND(i)),
      );

  Future<void> handleTapExchangeButton() async {
    if (!isValidForm) {
      return;
    }

    final result = await showDialog<bool>(
      context: context,
      builder: (context) => const ConfirmExchangeDiamondDialog(),
    );

    if (result == null || !result) {
      return;
    }

    final diamond = int.tryParse(_diamondController.text.replaceAll('.', ''));
    if (diamond != null) {
      // ignore: use_build_context_synchronously
      context.read<WalletDiamondBloc>().add(ExchangeDiamond(diamond));
    }
  }

  void handleTapMaxButton() {
    final diamond = widget.vndWalletInfo.available ?? 0;
    _diamondController.text = diamond.toAppCurrencyString(isWithSymbol: false);
    _diamondController.selection = TextSelection.fromPosition(
      TextPosition(offset: _diamondController.text.length),
    );
    onValidation();
  }

  @override
  void dispose() {
    validationListener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 15,
        horizontal: context.horizontal,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    diamondForm(),
                    vndForm(),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 35).copyWith(left: 12),
                child: GradiantButton(
                  width: 70,
                  borderRadius: WalletConstant.borderRadius10,
                  gradient: const LinearGradient(
                    colors: [AppColors.blue30, AppColors.blue20],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  onPressed: handleTapMaxButton,
                  child: Text(
                    'Tất cả'.toUpperCase(),
                    style: context.text.bodyMedium!.copyWith(
                      color: AppColors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          GradiantButton(
            borderRadius: WalletConstant.borderRadius10,
            gradient: const LinearGradient(
              colors: [AppColors.blue30, AppColors.blue20],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            onPressed: handleTapExchangeButton,
            child: Text(
              'Đổi sang VNĐ'.toUpperCase(),
              style: context.text.bodyMedium!.copyWith(
                color: AppColors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget diamondForm() => validationFormBuilder(
        child: FormElement(
          name: WalletDiamondField.diamond.name,
          hintText: 'Nhập số kim cương muốn đổi',
          title: 'Số kim cương',
          controller: _diamondController,
          borderRadius: WalletConstant.borderRadius5,
          filled: true,
          color: AppColors.white,
          enableBorderColor: AppColors.grey13,
          focusedBorderColor: WalletTheme.blueCheckedColor,
          suffixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: ImageWidget(IconAppConstants.camera2, width: 18),
          ),
          validator: _validateDiamond,
          onChanged: (value) {
            if (!conditionValidator) {
              return;
            }
            onValidation();
            if (!isValidForm) {
              setExchangeVNDValue(0);
            }
          },
          keyBoardType: TextInputType.number,
          valueTransformer: AppTextInputFormatter.reversedFromCurrency,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            AppTextInputFormatter.currency,
          ],
        ),
      );

  Widget vndForm() => BlocListener<WalletDiamondBloc, WalletDiamondState>(
        listener: (context, state) {
          if (state is ExchangeVNDValueUpdated) {
            _vndController.text = state.exchangeDiamondVND
                .toAppCurrencyString(isWithSymbol: false);
          }

          if (state is ExchangeDiamondSuccess) {
            setConditionValidator = false;
            _diamondController.clear();
            setConditionValidator = true;
            _vndController.clear();
            showDialog(
              context: context,
              builder: (context) => const ExchangeStatusDialog(isSuccess: true),
            ).whenComplete(() {
              context.read<WalletDiamondBloc>().add(LoadWalletDiamondInfo());
              injector<WalletBloc>()
                  .add(const WalletEvent.reloadDiamondWalletInfo());
            });
          }

          if (state is ExchangeDiamondFailure) {
            showDialog(
              context: context,
              builder: (context) =>
                  const ExchangeStatusDialog(isSuccess: false),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  'Số tiền quy đổi',
                  style: context.text.titleMedium?.copyWith(
                    color: WalletTheme.greyTextColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: TextFormField(
                        controller: _vndController,
                        keyboardAppearance: Brightness.light,
                        textAlign: TextAlign.start,
                        style: context.text.bodyMedium!.copyWith(fontSize: 16),
                        decoration: const InputDecoration(
                          disabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.greyLightTextColor,
                              width: 1,
                            ),
                          ),
                          enabled: false,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(14),
                    child: ImageWidget(IconAppConstants.group, width: 18),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
