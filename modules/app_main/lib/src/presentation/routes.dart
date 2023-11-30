import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/community/community_routes.dart';
import 'package:app_main/src/presentation/information_profile/information_profile_routes.dart';
import 'package:app_main/src/presentation/marshop/marshop_routes.dart';
import 'package:app_main/src/presentation/social/social_routes.dart';
import 'package:app_main/src/presentation/qr_code/qr_code_route.dart';
import 'package:app_main/src/presentation/settings/setting_routes.dart';
import 'package:injectable/injectable.dart';
import 'package:wallet/presentation/wallet_routes.dart';
import 'authentication/authentication_routes.dart';
import 'chat/chat_routes.dart';
import 'dashboard/dashboard_routes.dart';
import 'general_setting/general_routes.dart';
import 'upgrade_account/upgrade_account_routes.dart';

@singleton
class Routes extends RouteModuleBuilder {
  @override
  List<RouteModule> get routes => [
        get<DashboardRoutes>(),
        get<AuthenticationRoutes>(),
        get<UpgradeAccountRoutes>(),
        get<GeneralRoutes>(),
        get<SettingRoutes>(),
        get<MarkShopRoutes>(),
        get<QrCodeRoutes>(),
        get<SocialRoutes>(),
        get<CommunityRoutes>(),
        get<InfoProfileRoutes>(),
        get<ChatRoutes>(),
      ];

  @override
  List<RouteModuleBuilder> get routerModules => [
        get<WalletRoutes>(),
      ];
}
