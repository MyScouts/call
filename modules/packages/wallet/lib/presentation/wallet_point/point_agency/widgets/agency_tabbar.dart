import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:wallet/presentation/wallet_constant.dart';

import '../../../../core/core.dart';

class AgencyTabBarWidget extends StatefulWidget {
  final Widget widgetByMoney;
  final Widget widgetByCoin;
  final int initialIndex;

  const AgencyTabBarWidget({
    super.key,
    required this.widgetByMoney,
    required this.widgetByCoin,
    this.initialIndex = 0,
  });

  @override
  State<AgencyTabBarWidget> createState() => _AgencyTabBarWidgetState();
}

class _AgencyTabBarWidgetState extends State<AgencyTabBarWidget>
    with TickerProviderStateMixin {
  @override
  void dispose() {
    _pageCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
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
            SizedBox(
              height: 230,
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageCtrl,
                children: [
                  widget.widgetByMoney,
                  widget.widgetByCoin,
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  int _page = 0;
  final PageController _pageCtrl = PageController(initialPage: 0);

  _buildTab() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      margin: const EdgeInsets.symmetric(horizontal: 16),
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
        children: RechargeType.values
            .map(
              (type) => Expanded(child: _tabButton(type)),
            )
            .toList(),
      ),
    );
  }

  Widget _tabButton(RechargeType resourceType) {
    final index =
        RechargeType.values.indexWhere((type) => type == resourceType);
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
        width: MediaQuery.of(context).size.width / 3,
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
