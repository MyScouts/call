import 'package:app_core/app_core.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:injectable/injectable.dart';

import 'manage_protector_screen.dart';

@injectable
class ProtectorModule extends RouteModule {
  @override
  Map<String, WidgetBuilder> getAll(RouteSettings settings) => {
        ManageProtectorScreen.routerName: (context) {
          return const ManageProtectorScreen();
        },
      };
}
