import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/models/responses/ecom/product_detail_response.dart';
import 'package:app_main/src/data/models/responses/marshop_response.dart';
import 'package:app_main/src/presentation/marshop/marshop_bloc.dart';
import 'package:app_main/src/presentation/marshop/marshop_coordinator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:design_system/design_system.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:mobilehub_bloc/mobilehub_bloc.dart';
import 'package:ui/ui.dart';

import '../widgets/quantity_button_widget.dart';

class ConfirmInfomationScreen extends StatefulWidget {
  static String routeName = 'confirm-infomation';
  final MarshopRegisterPackResponse pack;
  final User authInfo;
  final MarshopResponse marshop;

  const ConfirmInfomationScreen({
    super.key,
    required this.pack,
    required this.authInfo,
    required this.marshop,
  });

  @override
  State<ConfirmInfomationScreen> createState() =>
      _ConfirmInfomationScreenState();
}

class _ConfirmInfomationScreenState extends State<ConfirmInfomationScreen> {
  ListProductBloc get _bloc => context.read<ListProductBloc>();
  List<String> productIds = [];
  List<MarshopRegisterPackProduct> products = [];
  final List<RegisterPackProductInfo> _prodResults = [];
  late int _totalPrice;

  @override
  void initState() {
    super.initState();
    for (var element in widget.pack.rules) {
      if (element.products.isNotEmpty) {
        productIds.addAll(element.products.map((e) => e.id));
        _prodResults.addAll(element.products.map(
          (e) => RegisterPackProductInfo(
            id: e.id,
            quantity: e.minQuantity,
            price: 0,
          ),
        ));
        products.addAll(element.products);
      }
    }
    _totalPrice = widget.pack.price;
    _bloc.add(GetListDataParam1Event(productIds));
  }

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
                      children: [
                        _buildRules(),
                        const SizedBox(height: 10),
                        Text(
                          "Thêm sản phẩm",
                          style: context.textTheme.titleMedium,
                        ),
                        const SizedBox(height: 10),
                        _buildProducts(),
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
                          text: _totalPrice.toAppCurrencyString(),
                          style: context.textTheme.titleLarge!.copyWith(
                            color: context.theme.primaryColor,
                            fontWeight: FontWeight.w700,
                          ))
                    ]),
              ),
              const SizedBox(height: 15),
              PrimaryButton(
                title: "Tiếp tục",
                onTap: () => context.startConfirmInfomationAddressScreen(
                  pack: widget.pack,
                  authInfo: widget.authInfo,
                  marshop: widget.marshop,
                  totalPrice: _totalPrice,
                  productResult: _prodResults,
                ),
                disabled: false,
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

  _buildProducts() {
    return BlocBuilder<ListProductBloc, GetListState>(
      buildWhen: (old, state) =>
          state is GetListDataSuccess<ProductDetailResponse>,
      builder: (context, state) {
        return GridView.count(
          childAspectRatio: 3 / 5,
          padding: const EdgeInsets.symmetric(vertical: 16),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: state is GetListDataSuccess<ProductDetailResponse>
              ? state.data
                  .map((product) => BuildProductCard(
                        product: product,
                        packProd: products.firstWhere(
                          (element) => element.id == product.id.toString(),
                        ),
                        onPriceChange: (prd) {
                          _totalPrice = widget.pack.price;
                          for (var item in _prodResults) {
                            int index = _prodResults.indexOf(item);
                            if (item.id == prd.id) {
                              _prodResults[index].quantity = prd.quantity;
                            }
                            _totalPrice +=
                                (_prodResults[index].quantity * prd.price);
                          }
                          setState(() {});
                        },
                      ))
                  .toList()
              : [],
        );
      },
    );
  }
}

class BuildProductCard extends StatelessWidget {
  final ProductDetailResponse product;
  final MarshopRegisterPackProduct packProd;
  final Function(RegisterPackProductInfo) onPriceChange;
  const BuildProductCard({
    super.key,
    required this.product,
    required this.packProd,
    required this.onPriceChange,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CachedNetworkImage(imageUrl: product.avatar),
        Text(
          product.name,
          softWrap: true,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: context.textTheme.titleMedium,
        ),
        const SizedBox(height: 5),
        Text(
          product.price.toAppCurrencyString(),
          style: context.textTheme.titleMedium!.copyWith(
            color: context.theme.primaryColor,
          ),
        ),
        const SizedBox(height: 5),
        QuantityButtonWidget(
          minVal: packProd.minQuantity,
          onChange: (qua) => onPriceChange(RegisterPackProductInfo(
            id: product.id.toString(),
            quantity: qua,
            price: product.price,
          )),
        ),
      ],
    );
  }
}

class RegisterPackProductInfo {
  final String id;
  final int price;
  int quantity;
  RegisterPackProductInfo({
    required this.id,
    required this.quantity,
    required this.price,
  });
}
