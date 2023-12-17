import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/models/payloads/resource/resource_payload.dart';
import 'package:app_main/src/presentation/app_coordinator.dart';
import 'package:app_main/src/presentation/general_setting/contracts/contract_constant.dart';
import 'package:app_main/src/presentation/general_setting/general_coordinator.dart';
import 'package:app_main/src/presentation/marshop/register_marshop/register_pack_action_dialog.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class ContractConfirmDialog extends StatefulWidget {
  final RegisterPackAction action;
  final Function onConfirm;
  const ContractConfirmDialog({
    super.key,
    required this.action,
    required this.onConfirm,
  });

  @override
  State<ContractConfirmDialog> createState() => _ContractConfirmDialogState();
}

class _ContractConfirmDialogState extends State<ContractConfirmDialog> {
  final ValueNotifier<bool> _acceptCtrl = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [
            Center(
              child: Text(
                "Thông báo",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: Navigator.of(context).pop,
                child: const Icon(Icons.close, color: AppColors.grey8),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          widget.action == RegisterPackAction.buy
              ? "Để đảm bảo quyền lợi của cả 2 bên, vui lòng đọc kỹ hợp đồng mua hàng và ký vào hợp đồng bằng cách tích vào ô bên dưới và nhấn đồng ý !"
              : "Để đảm bảo quyền lợi của cả 2 bên, vui lòng đọc kỹ hợp đồng thuê hàng và ký vào hợp đồng bằng cách tích vào ô bên dưới và nhấn đồng ý !",
          style: context.textTheme.titleSmall,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            _acceptCtrl.value = !_acceptCtrl.value;
            setState(() {});
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Checkbox(
                value: _acceptCtrl.value,
                activeColor: context.theme.primaryColor,
                onChanged: (value) {
                  _acceptCtrl.value = !_acceptCtrl.value;
                  setState(() {});
                },
                visualDensity: const VisualDensity(horizontal: 0),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Text.rich(
                    TextSpan(children: [
                      const TextSpan(text: "Tôi đã đọc và đồng ý với "),
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => _handleClickContract(),
                        text: widget.action == RegisterPackAction.buy
                            ? "Hợp đồng mua hàng "
                            : "Hợp đồng thuê hàng ",
                        style: context.textTheme.titleMedium!.copyWith(
                          color: context.theme.primaryColor,
                        ),
                      ),
                      const TextSpan(text: "của VDONE"),
                    ]),
                    style: context.textTheme.bodyMedium,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 25),
          child: Row(
            children: [
              Expanded(
                child: PrimarySolidButton(
                  title: "Huỷ",
                  onTap: () => context.pop(),
                  color: Colors.grey[200],
                  textColor: Colors.grey,
                  disabled: false,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              const SizedBox(width: 20),
              ValueListenableBuilder(
                valueListenable: _acceptCtrl,
                builder: (context, value, child) {
                  return Expanded(
                    child: PrimarySolidButton(
                      title: "Đồng ý",
                      onTap: () {
                        context.pop();
                        widget.onConfirm();
                      },
                      disabled: !value,
                      width: MediaQuery.of(context).size.width,
                    ),
                  );
                },
              )
            ],
          ),
        )
      ],
    );
  }

  void _handleClickContract() {
    context.startContractView(
      type: widget.action == RegisterPackAction.buy
          ? TypeContract.purchasePack
          : TypeContract.rentPack,
      payload: widget.action == RegisterPackAction.buy
          ? PurchaseMarShopPackParam()
          : RentMarShopPackParam(),
    );
  }
}
