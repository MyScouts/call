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
  late TabController _tabController;
  late final userType = context.userType;

  List<Widget> get tabBuilder {
    if (userType == UserType.isDefault) {
      return [widget.walletCoinComponent];
    } else if (userType == UserType.isPDone) {
      return [widget.walletCoinComponent, widget.walletDiamondComponent];
    } else {
      return [
        widget.walletCoinComponent,
        widget.walletDiamondComponent,
        widget.walletVndComponent
      ];
    }
  }

  @override
  void initState() {
    _tabController = TabController(
      length: userType.walletCanShow.length,
      vsync: this,
      initialIndex: widget.initialIndex,
    );
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
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
              borderRadius: BorderRadius.vertical(top: Radius.circular(18))
            ),
          ),
          Column(
            children: [
              _buildTab(),
              const SizedBox(height: 22),
              Expanded(
                child: PageView(
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

  int _page = 0;
  final PageController _pageCtrl = PageController(initialPage: 0);

  _buildTab() {
    return Container(
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
        mainAxisSize: MainAxisSize.min,
        children: ResourceType.values.map((type) => _tabButton(type)).toList(),
      ),
    );
  }

  Widget _tabButton(ResourceType resourceType) {
    final index =
        ResourceType.values.indexWhere((type) => type == resourceType);
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
        width: MediaQuery.of(context).size.width / 5,
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          borderRadius: WalletConstant.borderRadius90,
          color: _page == index ? const Color(0xFF4B84F7) : Colors.white,
        ),
        child: Center(
          child: Text(
            resourceType.resourceTabText,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              height: 20 / 14,
              leadingDistribution: TextLeadingDistribution.even,
              color: _page == index ? AppColors.white : const Color(0xFF6E6E6E),
            ),
          ),
        ),
      ),
    );
  }
}
