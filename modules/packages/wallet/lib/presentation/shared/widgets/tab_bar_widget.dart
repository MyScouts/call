import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:wallet/presentation/shared/widgets/tab_indicator_decoration.dart';
import 'package:wallet/presentation/shared/widgets/tabbar_indicator_center_widget.dart';

import '../../../../wallet.dart';
import '../../../core/theme/wallet_theme.dart';
import '../../wallet_constant.dart';

class TabBarViewWidget extends StatefulWidget {
  final Widget walletCoinComponent;
  final Widget walletVndComponent;
  final Widget walletDiamondComponent;
  final int initialIndex;

  const TabBarViewWidget({
    Key? key,
    required this.walletCoinComponent,
    required this.walletDiamondComponent,
    required this.walletVndComponent,
    this.initialIndex = 0,
  }) : super(key: key);

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
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 5),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: WalletTheme.lightGrey, width: 1),
              ),
            ),
            child: TabbarIndicatorCenterWidget<WalletType>(
              controller: _tabController,
              isScrollable: false,
              tabItems: userType.walletCanShow,
              labelPadding: const EdgeInsets.only(top: 20, bottom: 8),
              indicator: TabIndicatorDecoration(
                width: 25,
                weight: 2,
                color: AppColors.blue10,
              ),
              labelColor: AppColors.blue10,
              builderItem: (wallet) {
                return Text(wallet.walletTypeText);
              },
            ),
          ),
          const SizedBox(height: 22),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: tabBuilder,
            ),
          ),
        ],
      ),
    );
  }
}
