import 'package:app_main/app_main.dart';
import 'package:app_main/src/core/extensions/list_extension.dart';
import 'package:app_main/src/presentation/authentication/authentication_coordinator.dart';
import 'package:app_main/src/presentation/community/community.component.dart';
import 'package:app_main/src/presentation/dashboard/dashboard_constants.dart';
import 'package:app_main/src/presentation/dashboard/dashboard_coordinator.dart';
import 'package:app_main/src/presentation/dashboard_v2/widget/dash_ecom_leading.dart';
import 'package:app_main/src/presentation/dashboard_v2/widget/dash_ps_promotion.dart';
import 'package:app_main/src/presentation/live/presentation/live_home/live_home_screen.dart';
import 'package:app_main/src/presentation/qr_code/scan_qr_code_screen.dart';
import 'package:design_system/design_system.dart';
import 'package:design_system/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          padding: EdgeInsets.all(16.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 478.h,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 259.w,
                        height: 478.h,
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              width: 259.w,
                              height: 93.h,
                              child: leading,
                            ),
                            SizedBox(
                              height: 118.h,
                              width: 259.w,
                              child: promotion,
                            ),
                            SizedBox(
                              width: 259.w,
                              height: 239.h,
                              child: center,
                            ),
                          ].separated(SizedBox(height: 14.h)),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Container(
                        width: 92.w,
                        height: 478.h,
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
                              .map<Widget>((e) => Expanded(
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Center(
                                        child: AppIcon(app: e),
                                      ),
                                    ),
                                  ))
                              .toList()
                              .separated(
                                const SizedBox(height: 10),
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 14.h),
                SizedBox(
                  width: 361.w,
                  height: 109.h,
                  child: bottom,
                ),
                SizedBox(height: 14.h),
              ],
            ),
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
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: ImageWidget(app.backgroundImage),
            ),
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
  final BuildContext context;
  const DashboardCommunity({super.key, required this.context});

  @override
  Widget get leading => const DashBoardCommunityLeading();

  @override
  Widget get promotion => const DashboardCmPromotion();

  @override
  Widget get center => const DashCmCenter();

  @override
  List<DashBoardItem> get items => communityItems;

  @override
  Widget get bottom => Stack(
        children: [
          ImageWidget(
            Assets.icons_dashboard_live_mock.path,
            fit: BoxFit.fill,
          ),
          Positioned.fill(
              child: Row(
            children: [
              Expanded(child: Container()),
              const SizedBox(width: 5),
              Expanded(child: Container()),
              const SizedBox(width: 5),
              Expanded(
                  child: GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, LiveHomeScreen.routeName),
              )),
            ],
          ))
        ],
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
        fit: BoxFit.fill,
      );

  @override
  List<DashBoardItem> get items => personalItems;
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
        fit: BoxFit.fill,
      );

  @override
  List<DashBoardItem> get items => ecoItems;
}

final communityItems = <DashBoardItem>[
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
    id: 'ic_game',
    title: 'Trò chơi',
    backgroundImage: Assets.icons_dashboard_game.path,
  ),
  DashBoardIconItem(
    id: 'ic_donate',
    title: 'Donate',
    backgroundImage: Assets.icons_dashboard_donate.path,
  ),
  DashBoardIconItem(
    id: 'ic_tv_live',
    title: 'TV Live',
    backgroundImage: Assets.icons_dashboard_tv_live.path,
  ),
];

final personalItems = <DashBoardItem>[
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
    id: 'ic_profile',
    title: 'Profile',
    backgroundImage: IconAppConstants.icProfile,
  ),
  DashBoardIconItem(
    id: 'ic_save',
    title: 'Đã Lưu',
    backgroundImage: Assets.icons_dashboard_save.path,
  ),
  DashBoardIconItem(
    id: 'ic_buff',
    title: 'Nạp xu',
    backgroundImage: Assets.icons_dashboard_buff.path,
  ),
];

final ecoItems = <DashBoardItem>[
  DashBoardIconItem(
    id: 'ic_khtx',
    title: 'KHTX',
    backgroundImage: Assets.icons_dashboard_k_h_t_x.path,
  ),
  DashBoardIconItem(
    id: 'ic_marShop',
    title: 'MarShop',
    backgroundImage: IconAppConstants.icMaShop,
  ),
  DashBoardIconItem(
    id: 'ic_order',
    title: 'Đơn hàng',
    backgroundImage: Assets.icons_dashboard_order.path,
  ),
  DashBoardIconItem(
    id: 'ic_ncc',
    title: 'NCC',
    backgroundImage: Assets.icons_dashboard_n_c_c.path,
  ),
  DashBoardIconItem(
    id: 'ic_kho',
    title: 'Kho',
    backgroundImage: Assets.icons_dashboard_kho.path,
  ),
];
