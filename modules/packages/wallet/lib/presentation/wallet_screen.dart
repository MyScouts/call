import 'package:app_core/app_core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:mobilehub_ui_core/mobilehub_ui_core.dart';
import 'package:wallet/core/core.dart';
import 'package:wallet/presentation/presentation.dart';

import '../../wallet.dart';
import '../core/theme/wallet_theme.dart';
import 'shared/bloc/wallet_bloc.dart';
import 'shared/widgets/app_bar.dart';
import 'shared/widgets/tab_bar_widget.dart';
import 'wallet_diamond/bloc/wallet_diamond_bloc.dart';
import 'wallet_diamond/wallet_diamond_screen.dart';
import 'wallet_point/wallet_point_screen.dart';
import 'wallet_vnd/widgets/vnd_asset_status.dart';

class WalletScreen extends StatefulWidget {
  static const String routeName = '/my-wallet';
  final VoidCallback? onBackLive;

  const WalletScreen({Key? key, this.onBackLive}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  late final bloc = injector<WalletBloc>();

  @override
  void initState() {
    bloc.add(const WalletEvent.getCoinWalletInfo());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarBuilder(
        context,
        title: 'Ví của tôi',
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: WalletTheme.black),
          //thêm nut back to live khi ở màn live thu nhỏ
          onPressed: widget.onBackLive ?? () => handleBack(context),
        ),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: context.hideKeyboard,
        child: BlocConsumer<WalletBloc, WalletState>(
          bloc: bloc,
          listener: (context, state) {
            state.whenOrNull(
              needToRegisterJA: (walletType) => context.showRegisterJaDialog(
                walletType: walletType,
                isPipLive: widget.onBackLive != null,
              ),
              reloadDiamondWalletInfoSuccess: () {
                bloc.add(const WalletEvent.getCoinWalletInfo());
              },
            );
          },
          buildWhen: (previous, current) =>
              current.whenOrNull(
                getCoinWalletInfoLoaded: () => true,
              ) ??
              false,
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () => const LoadingWidget(),
              needToRegisterJA: (walletType) => const SizedBox(),
              getCoinWalletInfoLoaded: () {
                return Column(
                  children: [
                    BlocBuilder<WalletBloc, WalletState>(
                      bloc: bloc,
                      buildWhen: (previous, current) =>
                          current.whenOrNull(
                            getCoinWalletInfoLoaded: () => true,
                          ) ??
                          false,
                      builder: (context, state) => Padding(
                        padding: EdgeInsets.fromLTRB(
                          context.horizontal,
                          10,
                          context.horizontal,
                          24,
                        ),
                        child: UserInfoCard(
                          user: WalletInjectedData.user,
                          walletInfo: WalletInjectedData.coinWalletInfo,
                        ),
                      ),
                    ),
                    const Divider(thickness: 8, color: WalletTheme.lightGrey),
                    TabBarViewWidget(
                      walletCoinComponent: const WalletPointScreen(),
                      walletDiamondComponent: walletDiamondComponent(context),
                      walletVndComponent: walletVndComponent(context),
                    )
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget walletDiamondComponent(BuildContext context) {
    return BlocProvider(
      create: (context) => WalletDiamondBloc(injector()),
      child: WalletDiamondScreen(
        isPIP: widget.onBackLive != null,
        //handle close popup register ja in PIP Live
      ),
    );
  }

  Widget walletVndComponent(BuildContext context) {
    return Builder(
      builder: (context) {
        bloc.add(const WalletEvent.getVndWalletInfo());
        return BlocBuilder<WalletBloc, WalletState>(
          bloc: bloc,
          buildWhen: (previous, current) =>
              current.whenOrNull(
                vndWalletInfoLoaded: (info) => true,
                needToRegisterJA: (walletType) => true,
              ) ??
              false,
          builder: (context, state) => state.maybeWhen(
            orElse: () => const LoadingWidget(),
            needToRegisterJA: (walletType) => const SizedBox(),
            vndWalletInfoLoaded: (vndWalletInfo) {
              return Column(
                children: [
                  VNDAssetStatus(vndWalletInfo: vndWalletInfo),
                  const Expanded(child: WalletVNDActions()),
                ],
              );
            },
          ),
        );
      },
    );
  }

  void handleBack(BuildContext context) {
    final canPop =
        WalletDiamondNestedRoute.navigatorKey.currentState?.canPop() ?? false;

    canPop
        ? WalletDiamondNestedRoute.navigatorKey.currentState?.pop()
        : Navigator.of(context).pop();
  }
}
