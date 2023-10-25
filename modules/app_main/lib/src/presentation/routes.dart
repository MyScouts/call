import 'package:app_main/src/di/di.dart';
import 'package:injectable/injectable.dart';

import '../core/router/route_module.dart';
import 'authentication/authentication_routes.dart';

@singleton
class Routes extends RouteModuleBuilder {
  @override
  List<RouteModule> get routes => [
        getIt.get<AuthenticationRoutes>(),
      ];

  @override
  List<RouteModuleBuilder> get routerModules => [];
}
