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

  @override
  void initState() {
    super.initState();
    for (var element in widget.pack.rules) {
      if (element.products.isNotEmpty) {
        productIds.addAll(element.products.map((e) => e.id));
      }
    }

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
                          text: widget.pack.price.toAppCurrencyString(),
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
                  .map((product) => BuildProductCard(product: product))
                  .toList()
              : [],
        );
      },
    );
  }
}

class BuildProductCard extends StatefulWidget {
  final ProductDetailResponse product;
  const BuildProductCard({
    super.key,
    required this.product,
  });

  @override
  State<BuildProductCard> createState() => _BuildProductCardState();
}

class _BuildProductCardState extends State<BuildProductCard> {
  final ValueNotifier<int> _notifier = ValueNotifier(0);

  @override
  void initState() {
    super.initState();
    _notifier.value = widget.product.price;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CachedNetworkImage(imageUrl: widget.product.thumbnail[0]),
        Text(
          widget.product.name,
          softWrap: true,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: context.textTheme.titleMedium,
        ),
        const SizedBox(height: 5),
        ValueListenableBuilder(
          valueListenable: _notifier,
          builder: (context, value, child) {
            return Text(
              value.toAppCurrencyString(),
              style: context.textTheme.titleMedium!.copyWith(
                color: context.theme.primaryColor,
              ),
            );
          },
        ),
        const SizedBox(height: 5),
        QuantityButtonWidget(
          onChange: (qua) {
            _notifier.value = widget.product.price * qua;
          },
        ),
      ],
    );
  }
}
