import 'package:app_core/app_core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:ui/ui.dart';
import 'package:wallet/data/datasources/models/response/wallet_info_response.dart';

import '../../../core/core.dart';
import '../../wallet_constant.dart';

class UserInfoCard extends StatelessWidget {
  final User user;
  final UserWallet walletInfo;

  const UserInfoCard({
    super.key,
    required this.user,
    required this.walletInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: WalletConstant.borderRadius16,
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: WalletTheme.shadowColor,
            spreadRadius: 2,
            blurRadius: 20.06,
            offset: const Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            color: Colors.transparent,
            margin: const EdgeInsets.only(bottom: 18),
            child: Row(
              children: [
                AvatarWidget(
                  avatar: user.avatar,
                  size: 55,
                  borderSize: 1.45,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${user.displayName}',
                          style: context.text.titleLarge?.copyWith(
                            color: WalletTheme.textColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            height: 1,
                          ),
                        ),
                        Text(
                          'Hạng vàng',
                          style: context.text.labelSmall?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: WalletTheme.goldColor,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ImageWidget(
                  ImageConstants.imgGoldMember,
                  height: 55,
                  width: 55,
                ),
              ],
            ),
          ),

          Row(
            children: [
              Expanded(
                child: _resourceWidget(
                  context,
                  WalletType: WalletType.ddone,
                  resourceValue: '254',
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: _resourceWidget(
                  context,
                  WalletType: WalletType.coin,
                  resourceValue: walletInfo.availableCoin.toAppCurrencyString(
                    isWithSymbol: false,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: _resourceWidget(
                  context,
                  WalletType: WalletType.diamond,
                  resourceValue:
                      walletInfo.availableDiamond.toAppCurrencyString(
                    isWithSymbol: false,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: _resourceWidget(
                  context,
                  WalletType: WalletType.vnd,
                  resourceValue: walletInfo.availableVnd.toAppCurrencyString(
                    isWithSymbol: false,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          _progressBar(context)
          // Wrap(
          //   children: WalletType.values
          //       .map((type) => _resourceWidget(context,
          //           WalletType: type, resourceValue: '254.281.212'))
          //       .toList(),
          // ),
          // Padding(
          //   padding: const EdgeInsets.fromLTRB(12, 10, 12, 0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       UserAsset(
          //         type: WalletType.coin,
          //         amount: walletInfo.totalCoin
          //             .toAppCurrencyString(isWithSymbol: false),
          //       ),
          //       UserAsset(
          //         type: WalletType.diamond,
          //         amount: walletInfo.totalDiamond
          //             .toAppCurrencyString(isWithSymbol: false),
          //       ),
          //       UserAsset(
          //         type: WalletType.coinVnd,
          //         amount: walletInfo.totalVnd
          //             .toAppCurrencyString(isWithSymbol: false),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _resourceWidget(BuildContext context,
      {required WalletType WalletType, required String resourceValue}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: WalletType.valueBgColor,
        borderRadius: WalletConstant.borderRadius6,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          WalletType.icon,
          const SizedBox(width: 5),
          Text(
            resourceValue,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: WalletType.valueColor,
                  fontSize: 14,
                ),
          )
        ],
      ),
    );
  }

  Widget _progressBar(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 8,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEAEDF0),
                      borderRadius: WalletConstant.borderRadius8,
                    ),
                  ),
                  Container(
                    width: 15,
                    height: 8,
                    decoration: BoxDecoration(
                      color: const Color(0xFF4B84F7),
                      borderRadius: WalletConstant.borderRadius8,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: ImageWidget(ImageConstants.imgGoldMember, width: 25),
            )
          ],
        ),
        const SizedBox(height: 5),
        Text(
          'Bạn còn 300 điểm nữa để thăng hạng Kim cương',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: const Color(0xFF1D2B39),
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
        )
      ],
    );
  }
}
