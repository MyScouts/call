import 'package:app_main/src/presentation/qr_code/qr_code_screen.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mobilehub_core/mobilehub_core.dart';

@injectable
class QrCodeRoutes extends RouteModule {
  @override
  Map<String, WidgetBuilder> getAll(RouteSettings settings) => {
        QrCodeScanScreen.routeName: (context) {
          return const QrCodeScanScreen();
        },
      };
}
