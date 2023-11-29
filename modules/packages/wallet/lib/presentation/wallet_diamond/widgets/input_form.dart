import 'package:app_core/app_core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:wallet/presentation/shared/widgets/toast_message/toast_message.dart';
import 'package:wallet/presentation/wallet_coodinator.dart';

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
  final _diamondController = TextEditingController();

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

  Future<void> handleTapExchangeButton(BuildContext context) async {
    if (!isValidForm) {
      // showToastMessage('Số kim cương không hợp lệ', ToastMessageType.warning);
      return;
    }

    if ((int.tryParse(_diamondController.text) ?? 0) >
        (widget.vndWalletInfo.totalDiamond ?? 0)) {
      // showToastMessage('Số kim cương quy đổi vượt quá số lượng bạn đang có', ToastMessageType.warning);
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
    return BlocListener<WalletDiamondBloc, WalletDiamondState>(
      listener: (context, state) {
        if (state is ExchangeDiamondFailure) {
          hideLoading();
          showToastMessage(state.message, ToastMessageType.error);
        }

        if (state is ExchangeDiamondSuccess) {
          hideLoading();
          showToastMessage('Quy đổi thành công, vui lòng xem lịch sử',
              ToastMessageType.success);
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 15,
          horizontal: context.horizontal,
        ),
        child: Column(
          children: [
            diamondForm(),
            const SizedBox(height: 24),
            GradiantButton(
              borderRadius: WalletConstant.borderRadius10,
              gradient: const LinearGradient(
                colors: [AppColors.blue30, AppColors.blue20],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              onPressed: () {
                handleTapExchangeButton(context);
              },
              child: Text(
                'Đổi'.toUpperCase(),
                style: context.text.bodyMedium!.copyWith(
                  color: AppColors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget diamondForm() => validationFormBuilder(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  ImageWidget(
                    ImageConstants.icWalletDiamond,
                    width: 20,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Số kim cương cần đổi',
                    style: context.text.titleMedium?.copyWith(
                      color: WalletTheme.greyTextColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            TextFormField(
              style: context.textTheme.titleLarge!.copyWith(
                color: AppColors.blue33,
                fontSize: 24,
              ),
              controller: _diamondController,
              validator: _validateDiamond,
              decoration: InputDecoration(
                  // border: InputBorder.none,
                  // focusedBorder: InputBorder.none,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: AppColors.black10.withOpacity(0.6), width: 1),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: AppColors.black10.withOpacity(0.6), width: 1),
                  ),
                  // enabledBorder: InputBorder.none,
                  // errorBorder: InputBorder.none,
                  // disabledBorder: InputBorder.none,
                  hintText: 'Nhập số kim cương muốn đổi sang VNĐ',
                  hintStyle: TextStyle(
                      fontSize: 16,
                      color: AppColors.black10.withOpacity(0.6),
                      fontWeight: FontWeight.normal)),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                AppTextInputFormatter.currency,
              ],
            ),
            // Container(
            //   height: 0.5,
            //   width: 400,
            //   color: AppColors.black10.withOpacity(0.6),
            //   margin: const EdgeInsets.symmetric(horizontal: 8),
            // )
          ],
        ),
      );
}
