import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/marshop/marshop_routes.dart';
import 'package:app_main/src/presentation/qr_code/qr_code_route.dart';
import 'package:app_main/src/presentation/settings/setting_routes.dart';
import 'package:injectable/injectable.dart';
import 'authentication/authentication_routes.dart';
import 'dashboard/dashboard_routes.dart';

@singleton
class Routes extends RouteModuleBuilder {
  @override
  List<RouteModule> get routes => [
        get<DashboardRoutes>(),
        get<AuthenticationRoutes>(),
        get<SettingRoutes>(),
        get<MarkShopRoutes>(),
        get<QrCodeRoutes>(),
      ];

  @override
  List<RouteModuleBuilder> get routerModules => [];
}
