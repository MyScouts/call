import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/settings/setting_routes.dart';
import 'package:injectable/injectable.dart';
import 'package:wallet/presentation/wallet_routes.dart';
import 'authentication/authentication_routes.dart';
import 'chat/chat_routes.dart';
import 'dashboard/dashboard_routes.dart';
import 'general_setting/general_routes.dart';
import 'call/call_routes.dart';

@singleton
class Routes extends RouteModuleBuilder {
  @override
  List<RouteModule> get routes => [
        get<DashboardRoutes>(),
        get<AuthenticationRoutes>(),
        get<GeneralRoutes>(),
        get<SettingRoutes>(),
        get<ChatRoutes>(),
        get<CallRoutes>(),
      ];

  @override
  List<RouteModuleBuilder> get routerModules => [
        get<WalletRoutes>(),
      ];
}
