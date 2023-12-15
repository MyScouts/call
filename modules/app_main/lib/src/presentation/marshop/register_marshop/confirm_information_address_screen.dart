import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/models/payloads/marshop/marshop_payload.dart';
import 'package:app_main/src/data/models/responses/marshop_response.dart';
import 'package:app_main/src/domain/entities/update_account/update_place_information_payload.dart';
import 'package:app_main/src/presentation/marshop/marshop_coordinator.dart';
import 'package:app_main/src/presentation/marshop/register_marshop/confirm_infomation_screen.dart';
import 'package:app_main/src/presentation/upgrade_account/upgrade_pdone/bloc/place_information/place_information_bloc.dart';
import 'package:design_system/design_system.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

import '../../upgrade_account/upgrade_pdone/views/widgets/place_information_widget.dart';
import 'register_pack_action_dialog.dart';

class ConfirmInfomationAddressScreen extends StatefulWidget {
  static String routeName = 'confirm-infomation-address';
  final User authInfo;
  final MarshopResponse marshop;
  final MarshopRegisterPackResponse pack;
  final int totalPrice;
  final List<RegisterPackProductInfo> productResult;

  const ConfirmInfomationAddressScreen({
    super.key,
    required this.pack,
    required this.authInfo,
    required this.marshop,
    required this.productResult,
    required this.totalPrice,
  });

  @override
  State<ConfirmInfomationAddressScreen> createState() =>
      _ConfirmInfomationAddressScreenState();
}

class _ConfirmInfomationAddressScreenState
    extends State<ConfirmInfomationAddressScreen> {
  final TextEditingController _addressCtrl = TextEditingController();
  UpdatePlaceInformationPayload? address;
  RegisterPackAction? _action;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(
        title: "Xác nhận thông tin",
        isClose: false,
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: paddingHorizontal,
            vertical: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ExtendedNestedScrollView(
                  onlyOneScrollInBody: true,
                  headerSliverBuilder: (context, innerBoxIsScrolled) => [],
                  body: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildRules(),
                        const SizedBox(height: 10),
                        BlocProvider<PlaceInformationBloc>(
                          create: (context) => injector.get(),
                          child: PlaceInformationWidget(
                            title: 'Thêm địa chỉ',
                            onUpdatePlaceInformation: (value) {
                              address = value;
                              setState(() {});
                            },
                            addressCtrl: _addressCtrl,
                            required: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              RichText(
                text: TextSpan(
                    text: "Tổng tiền: ",
                    style: context.textTheme.bodyLarge,
                    children: [
                      TextSpan(
                          text: widget.totalPrice.toAppCurrencyString(),
                          style: context.textTheme.titleLarge!.copyWith(
                            color: context.theme.primaryColor,
                            fontWeight: FontWeight.w700,
                          ))
                    ]),
              ),
              const SizedBox(height: 15),
              PrimaryButton(
                title: "Tiếp tục",
                onTap: () {
                  context.startConfirmActionPackDialog(
                    onChange: (value) {
                      _action = value;
                      setState(() {});
                    },
                  ).then((value) {
                    if (_action != null) {
                      context.startContractConfirm(
                        action: _action!,
                        onConfirm: () => context.startRegisterMarshopOTP(
                          payload: RegisterMarshopPayload(
                            otp: "",
                            packId: widget.pack.id,
                            referralId: widget.marshop.id,
                            billInfo: RegisterMarshopBillInfo(
                              addressInfo: RegisterMarshopAddress(
                                address: _addressCtrl.text.trim(),
                                countryName: address!.countryName!,
                                districtName: address!.districtName!,
                                provinceName: address!.provinceName!,
                                wardName: address!.wardName!,
                              ),
                              priceInfo: RegisterMarshopPrice(
                                price: widget.pack.price,
                                shipFee: 0,
                                tax: 10,
                              ),
                              productInfo: widget.productResult
                                  .map((e) => RegisterMarshopProduct(
                                      productId: e.id, quantity: e.quantity))
                                  .toList(),
                            ),
                          ),
                          pack: widget.pack,
                          authInfo: widget.authInfo,
                          marshop: widget.marshop,
                          address: address!,
                          productResult: widget.productResult,
                          totalPrice: widget.totalPrice,
                        ),
                      );
                    }
                  });
                },
                disabled: address == null && _addressCtrl.text.isNotEmpty,
                width: null,
              ),
              const SizedBox(height: 15),
            ],
          )),
    );
  }

  _buildRules() {
    return Column(
        children: widget.pack.rules
            .map((e) => Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Assets.icons_ic_check.image(width: 20),
                          const SizedBox(width: 5),
                          Text(
                            e.title,
                            style: context.text.titleMedium,
                          )
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: context.theme.primaryColor),
                        ),
                        child: Text(
                          "SL: ${e.quantity}",
                          style: context.textTheme.titleSmall,
                        ),
                      )
                    ],
                  ),
                ))
            .toList());
  }
}
