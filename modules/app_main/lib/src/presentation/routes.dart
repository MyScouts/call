import 'package:app_core/app_core.dart';
import 'package:injectable/injectable.dart';
import 'authentication/authentication_routes.dart';
import 'dashboard/dashboard_routes.dart';

@singleton
class Routes extends RouteModuleBuilder {
  @override
  List<RouteModule> get routes => [
        get<DashboardRoutes>(),
        get<AuthenticationRoutes>(),
      ];

  @override
  List<RouteModuleBuilder> get routerModules => [];
}
