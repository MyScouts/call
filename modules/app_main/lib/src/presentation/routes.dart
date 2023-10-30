import 'package:app_core/app_core.dart';
import 'package:injectable/injectable.dart';
import 'authentication/authentication_routes.dart';
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
      ];

  @override
  List<RouteModuleBuilder> get routerModules => [];
}
