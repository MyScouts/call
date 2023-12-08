import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import '../../../core/theme/wallet_theme.dart';
import '../../wallet_constant.dart';

class TabBarViewWidget extends StatefulWidget {
  final Widget walletCoinComponent;
  final Widget walletVndComponent;
  final Widget walletDiamondComponent;
  final Widget walletDOneComponent;
  final int initialIndex;

  const TabBarViewWidget({
    super.key,
    required this.walletCoinComponent,
    required this.walletDiamondComponent,
    required this.walletVndComponent,
    required this.walletDOneComponent,
    this.initialIndex = 0,
  });

  @override
  State<TabBarViewWidget> createState() => _TabBarViewWidgetState();
}

class _TabBarViewWidgetState extends State<TabBarViewWidget>
    with TickerProviderStateMixin {
  late final PageController _pageCtrl = PageController(
    initialPage: widget.initialIndex,
  );

  @override
  void dispose() {
    _pageCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Container(
            height: double.infinity,
            margin: const EdgeInsets.only(top: 30),
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(18))),
          ),
          Column(
            children: [
              _buildTab(),
              const SizedBox(height: 22),
              Expanded(
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _pageCtrl,
                  children: [
                    widget.walletDOneComponent,
                    widget.walletCoinComponent,
                    widget.walletDiamondComponent,
                    widget.walletVndComponent
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  late int _page = widget.initialIndex;

  _buildTab() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: paddingHorizontal),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: WalletConstant.borderRadius90,
          boxShadow: [
            BoxShadow(
              color: WalletTheme.shadowColor,
              spreadRadius: 2,
              blurRadius: 20.06,
              offset: const Offset(0, 4), // changes position of shadow
            ),
          ]),
      child: Row(
        children: WalletType.values
            .map((type) => Expanded(child: _tabButton(type)))
            .toList(),
      ),
    );
  }

  Widget _tabButton(WalletType resourceType) {
    final index = WalletType.values.indexWhere((type) => type == resourceType);
    return InkWell(
      onTap: () {
        _pageCtrl.animateToPage(
          index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.ease,
        );
        _page = index;
        setState(() {});
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: WalletConstant.borderRadius90,
          color: _page == index ? const Color(0xFF4B84F7) : Colors.white,
        ),
        child: Center(
          child: Text(
            resourceType.resourceTabText,
            maxLines: 2,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              height: 1,
              leadingDistribution: TextLeadingDistribution.even,
              color:
                  _page == index ? AppColors.white : const Color(0xFF6E6E6E),
            ),
          ),
        ),
      ),
    );
  }
}
