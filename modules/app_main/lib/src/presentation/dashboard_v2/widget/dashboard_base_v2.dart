import 'package:app_main/app_main.dart';
import 'package:app_main/src/core/extensions/list_extension.dart';
import 'package:app_main/src/presentation/authentication/authentication_coordinator.dart';
import 'package:app_main/src/presentation/community/community.component.dart';
import 'package:app_main/src/presentation/dashboard/dashboard_constants.dart';
import 'package:app_main/src/presentation/dashboard/dashboard_coordinator.dart';
import 'package:app_main/src/presentation/dashboard_v2/widget/dash_ecom_leading.dart';
import 'package:app_main/src/presentation/dashboard_v2/widget/dash_ps_promotion.dart';
import 'package:app_main/src/presentation/qr_code/scan_qr_code_screen.dart';
import 'package:design_system/design_system.dart';
import 'package:design_system/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

import 'dash_cm_center.dart';
import 'dash_cm_promotion.dart';
import 'dash_cm_leading.dart';
import 'dash_eco_center.dart';
import 'dash_ps_center.dart';
import 'dashboard_ps_leading.dart';

abstract class DashboardBaseV2 extends StatelessWidget {
  const DashboardBaseV2({super.key});

  Widget get leading => const SizedBox.shrink();

  Widget get promotion => const SizedBox.shrink();

  Widget get center => const SizedBox.shrink();

  Widget get bottom => const SizedBox.shrink();

  List<DashBoardItem> get items => const [];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrain) {
        return Container(
          constraints: constrain,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      flex: 259,
                      child: Column(
                        children: <Widget>[
                          AspectRatio(aspectRatio: 259 / 93, child: leading),
                          AspectRatio(
                            aspectRatio: 259 / 118,
                            child: promotion,
                          ),
                          Expanded(flex: 239, child: center),
                        ].separated(const SizedBox(height: 14)),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 92,
                      child: Container(
                        height: double.infinity,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 21,
                          horizontal: 16,
                        ),
                        child: Column(
                          children: items
                              .map<Widget>(
                                  (e) => Expanded(child: AppIcon(app: e)))
                              .toList(),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 14),
              SizedBox(height: 109, child: bottom),
            ],
          ),
        );
      },
    );
  }
}

class AppIcon extends StatelessWidget {
  const AppIcon({super.key, required this.app});

  final DashBoardItem app;

  bool get authenticate => isAuthenticate.value;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!authenticate) {
          context.requiredLogin();
          return;
        }
        context.handleStartAppWidget(id: app.id, path: app.path);
      },
      behavior: HitTestBehavior.opaque,
      child: Column(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 1),
                  color: Color.fromRGBO(117, 117, 117, 0.20),
                  blurRadius: 12,
                  spreadRadius: 4,
                ),
              ],
            ),
            child: ImageWidget(app.backgroundImage),
          ),
          const SizedBox(height: 5),
          Text(
            app.title,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class DashboardCommunity extends DashboardBaseV2 {
  const DashboardCommunity({super.key});

  @override
  Widget get leading => const DashBoardCommunityLeading();

  @override
  Widget get promotion => const DashboardCmPromotion();

  @override
  Widget get center => const DashCmCenter();

  @override
  List<DashBoardItem> get items => [
        DashBoardIconItem(
          id: 'ic_group',
          title: 'Group',
          backgroundImage: IconAppConstants.icGroupTeam,
          path: CommunityWidget.routeName,
        ),
        DashBoardIconItem(
          id: 'ic_team',
          title: 'Team',
          backgroundImage: IconAppConstants.icTeam,
        ),
        DashBoardIconItem(
          id: 'ic_live',
          title: 'Live',
          backgroundImage: IconAppConstants.icLive,
        ),
        DashBoardIconItem(
          id: 'ic_wallet',
          title: 'Ví',
          backgroundImage: IconAppConstants.icWallet,
        ),
        DashBoardIconItem(
          id: 'ic_call',
          title: 'Điện thoại',
          backgroundImage: IconAppConstants.icCall,
        ),
      ];

  @override
  Widget get bottom => ImageWidget(
        Assets.icons_dashboard_live_mock.path,
        fit: BoxFit.contain,
      );
}

class DashboardPersonal extends DashboardBaseV2 {
  const DashboardPersonal({super.key});

  @override
  Widget get leading => const DashBoardPsLeading();

  @override
  Widget get promotion => const DashboardPsPromotion();

  @override
  Widget get center => const DashboardPsCenter();

  @override
  Widget get bottom => ImageWidget(
    Assets.icons_dashboard_live_mock_2.path,
    fit: BoxFit.contain,
  );

  @override
  List<DashBoardItem> get items => [
        DashBoardIconItem(
          id: 'ic_qr',
          title: 'QR Code',
          backgroundImage: IconAppConstants.icQr,
          path: ScanQrCodeScanScreen.routeName,
        ),
        DashBoardIconItem(
          id: 'ic_scan',
          title: 'Quét QR',
          backgroundImage: IconAppConstants.icScan,
          path: ScanQrCodeScanScreen.routeName,
        ),
        DashBoardIconItem(
          id: 'ic_profile',
          title: 'Profile',
          backgroundImage: IconAppConstants.icProfile,
        ),
        DashBoardIconItem(
          id: 'ic_mess',
          title: 'Tin nhắn',
          backgroundImage: IconAppConstants.icMess,
        ),
        DashBoardIconItem(
          id: 'ic_call',
          title: 'Điện thoại',
          backgroundImage: IconAppConstants.icCall,
        ),
      ];
}

class DashboardEco extends DashboardBaseV2 {
  const DashboardEco({super.key});

  @override
  Widget get leading => const DashBoardEcoLeading();

  @override
  Widget get promotion => const DashboardPsPromotion();

  @override
  Widget get center => const DashEcoCenter();

  @override
  Widget get bottom => ImageWidget(
    Assets.icons_dashboard_live_mock_3.path,
    fit: BoxFit.contain,
  );


  @override
  List<DashBoardItem> get items => [
        DashBoardIconItem(
          id: 'ic_marShop',
          title: 'MarShop',
          backgroundImage: IconAppConstants.icMaShop,
        ),
        DashBoardIconItem(
          id: 'ic_market',
          title: 'Kho',
          backgroundImage: IconAppConstants.icMarket,
        ),
        DashBoardIconItem(
          id: 'ic_qr',
          title: 'QR Code',
          backgroundImage: IconAppConstants.icQr,
          path: ScanQrCodeScanScreen.routeName,
        ),
        DashBoardIconItem(
          id: 'ic_wallet',
          title: 'Ví',
          backgroundImage: IconAppConstants.icWallet,
        ),
        DashBoardIconItem(
          id: 'ic_call',
          title: 'Điện thoại',
          backgroundImage: IconAppConstants.icCall,
        ),
      ];
}
