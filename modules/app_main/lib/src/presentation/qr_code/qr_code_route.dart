import 'package:app_core/app_core.dart';
import 'package:app_main/src/blocs/user/user_cubit.dart';
import 'package:app_main/src/presentation/qr_code/qr_code_screen.dart';
import 'package:app_main/src/presentation/qr_code/scan_qr_code_screen.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class QrCodeRoutes extends RouteModule {
  @override
  Map<String, WidgetBuilder> getAll(RouteSettings settings) => {
        ScanQrCodeScanScreen.routeName: (context) {
          final args = settings.arguments != null
              ? settings.arguments as Map<String, dynamic>
              : {};
          return BlocProvider.value(
            value: injector.get<UserCubit>(),
            child: ScanQrCodeScanScreen(
              showMyQr: args['showMyQr'] ?? true,
            ),
          );
        },
        QrCodeScreen.routeName: (context) {
          final args = settings.arguments as Map<String, dynamic>;
          return QrCodeScreen(
            userInfo: args['userInfo'],
          );
        },
      };
}
