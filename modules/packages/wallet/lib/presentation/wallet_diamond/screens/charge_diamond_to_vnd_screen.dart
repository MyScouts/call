import 'package:app_core/app_core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobilehub_ui_core/mobilehub_ui_core.dart';

import '../bloc/wallet_diamond_bloc.dart';
import '../widgets/widgets.dart';

class ChargeDiamondToVndScreen extends StatelessWidget {
  const ChargeDiamondToVndScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Đổi kim cương sang VNĐ',
          style: context.textTheme.titleLarge,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: Navigator.of(context).pop,
        ),
      ),
      body: ColoredBox(
        color: AppColors.white,
        child: BlocBuilder<WalletDiamondBloc, WalletDiamondState>(
          buildWhen: (previous, current) => current is WalletDiamondLoaded,
          builder: (context, state) {
            if (state is WalletDiamondLoaded) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    DiamondAssetStatus(vndWalletInfo: state.walletDiamondInfo),
                    WalletDiamondInputForm(
                      vndWalletInfo: state.walletDiamondInfo,
                    ),
                  ],
                ),
              );
            }

            if (state is WalletDiamondError) {
              return Center(child: Text(state.error));
            }

            return const LoadingWidget();
          },
        ),
      ),
    );
  }
}
