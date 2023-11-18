import 'package:app_main/src/presentation/authentication/login/pages/register_page.dart';
import 'package:app_main/src/presentation/authentication/login/pages/login_page.dart';
import 'package:app_main/src/presentation/authentication/login/widgets/auth_button_tab.dart';
import 'package:app_main/src/presentation/dashboard/dashboard_coordinator.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:ui/ui.dart';

class AuthenticateScreen extends StatefulWidget {
  static const String routeName = 'authenticate';
  const AuthenticateScreen({super.key});

  @override
  State<AuthenticateScreen> createState() => _AuthenticateScreenState();
}

class _AuthenticateScreenState extends State<AuthenticateScreen> {
  final PageController _pageCtrl = PageController(initialPage: 0);
  final ValueNotifier<int> valueCtrl = ValueNotifier(0);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ScaffoldHideKeyboard(
      resizeToAvoidBottomInset: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              ImageWidget(
                ImageConstants.defaultAuthBg,
                fit: BoxFit.fitWidth,
              ),
              Positioned(
                bottom: 0,
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ImageWidget(
                      ImageConstants.defaultAppLogo,
                      width: 100,
                    ),
                    const SizedBox(height: 24),
                    Center(
                      child: ValueListenableBuilder(
                        valueListenable: valueCtrl,
                        builder: (context, value, child) {
                          return LoginButtonTab(
                            page: value,
                            onChange: (page) {
                              valueCtrl.value = page;
                              _pageCtrl.animateToPage(
                                page,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeIn,
                              );
                            },
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                right: 25,
                top: 50,
                child: CustomCloseButton(
                  color: Colors.white,
                  onPressed: () => context.startDashboardUtil(),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Expanded(
            child: PageView(
              controller: _pageCtrl,
              onPageChanged: (value) {
                valueCtrl.value = value;
              },
              children: [
                const LoginWidget(),
                RegisterWidget(
                  viewInsets: MediaQuery.of(context).viewInsets,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
