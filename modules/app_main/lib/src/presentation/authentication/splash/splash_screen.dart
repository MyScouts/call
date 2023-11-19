import 'package:app_core/app_core.dart';
import 'package:app_main/src/blocs/app/app_cubit.dart';
import 'package:app_main/src/presentation/authentication/authentication_coordinator.dart';
import 'package:app_main/src/presentation/dashboard/dashboard_coordinator.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = 'splash';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AppCubit get _appCubit => context.read();

  @override
  void initState() {
    super.initState();
    _appCubit.appInitial(type: isIOS ? 'ios' : 'android');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {
          if (state is UpgradeAppVersion) {
            context.showForceUpgradeAppDialog();
          }

          if (state is AutoLogin) {
            context.startDashboardUtil();
          }

          if (state is UnauthorizedApp) {
            context.startLoginUtil();
          }
        },
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ImageWidget(ImageConstants.bgAppLogo),
                if (state is AppInitial) _buildLoading(),
              ],
            ),
          );
        },
      ),
    );
  }

  _buildLoading() {
    return isAndroid
        ? const CircularProgressIndicator()
        : const CupertinoActivityIndicator();
  }
}
