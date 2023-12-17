import 'package:app_core/app_core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:mobilehub_ui_core/mobilehub_ui_core.dart';
import 'package:ui/ui.dart';
import 'package:wallet/core/core.dart';
import 'package:wallet/presentation/presentation.dart';
import 'package:wallet/presentation/shared/widgets/wallet_diamond_actions.dart';
import '../data/datasources/models/response/wallet_info_response.dart';
import 'shared/bloc/wallet_bloc.dart';
import 'shared/widgets/tab_bar_widget.dart';
import 'shared/widgets/wallet_coin_actions.dart';
import 'shared/widgets/wallet_diamond_resource_builder.dart';
import 'shared/widgets/wallet_vnd_resource_builder.dart';
import 'wallet_diamond/bloc/wallet_diamond_bloc.dart';

class WalletScreen extends StatefulWidget {
  static const String routeName = '/my-wallet';
  final VoidCallback? onBackLive;

  const WalletScreen({super.key, this.onBackLive});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  late final bloc = injector<WalletBloc>();

  @override
  void initState() {
    bloc.add(const WalletEvent.getOnboarding());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WalletTheme.bgColor,
      extendBodyBehindAppBar: true,
      body: AutoHideKeyboard(
        child: BlocConsumer<WalletBloc, WalletState>(
          bloc: bloc,
          listener: (context, state) {
            state.whenOrNull(
              getOnboardingSuccess: (data) {
                bloc.add(const WalletEvent.getWalletInfo());
                WalletInjectedData.setUser = WalletInjectedData.user.copyWith(
                  isJA: data.isJA,
                  isPDone: data.isPdone ?? false,
                );
              },
            );
          },
          buildWhen: (previous, current) =>
              current.whenOrNull(
                getWalletInfoSuccess: (walletInfo) => true,
                error: (mess) => true,
              ) ??
              false,
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () => const LoadingWidget(),
              error: (message) => Center(child: Text(message)),
              getWalletInfoSuccess: (walletInfo) {
                return Column(
                  children: [
                    Stack(
                      children: [
                        ImageWidget(ImageConstants.imgWalletHeader),
                        Positioned(
                          top: MediaQuery.of(context).padding.top + 5,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: Text(
                              'Ví của tôi',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    color: AppColors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).padding.top + 5,
                          right: 20,
                          child: GestureDetector(
                            onTap:
                                widget.onBackLive ?? () => handleBack(context),
                            child:
                                const Icon(Icons.clear, color: AppColors.white),
                          ),
                        ),
                        Positioned(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(
                              20,
                              MediaQuery.of(context).padding.top + 60,
                              20,
                              20,
                            ),
                            child: UserInfoCard(
                              user: WalletInjectedData.user,
                              walletInfo: WalletInjectedData.userWallet,
                            ),
                          ),
                        ),
                      ],
                    ),
                    TabBarViewWidget(
                      initialIndex: 3,
                      walletDOneComponent: const Center(
                        child: Text('Tính năng này đang được phát triển'),
                      ),
                      walletCoinComponent: walletCoinComponent(context),
                      walletDiamondComponent:
                          walletDiamondComponent(context, walletInfo!),
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

  Widget walletCoinComponent(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 12),
          WalletCoinActions(walletBloc: bloc),
        ],
      ),
    );
  }

  Widget walletDiamondComponent(BuildContext context, UserWallet userWallet) {
    return SingleChildScrollView(
      child: Column(
        children: [
          WalletDiamondResourceBuilder(userWallet: userWallet),
          const SizedBox(height: 12),
          WalletDiamondActions(
            walletBloc: bloc,
          ),
        ],
      ),
    );
  }

  Widget walletVndComponent(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          WalletVNDResourceBuilder(),
          SizedBox(height: 12),
          WalletVNDActions(),
        ],
      ),
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
