import 'package:app_main/src/presentation/authentication/pages/register_page.dart';
import 'package:app_main/src/presentation/authentication/pages/login_page.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:localization/localization.dart';

class AuthenticateScreen extends StatefulWidget {
  static const String routeName = 'authenticate';
  const AuthenticateScreen({super.key});

  @override
  State<AuthenticateScreen> createState() => _AuthenticateScreenState();
}

class _AuthenticateScreenState extends State<AuthenticateScreen> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                  children: [
                    ImageWidget(
                      ImageConstants.defaultAppLogo,
                      width: 100,
                    ),
                    const SizedBox(height: 24),
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: const Color(0xFFF4F4F4),
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InkWell(
                            onTap: () {
                              isLogin = true;
                              setState(() {});
                            },
                            child: Container(
                              width: 160,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color:
                                    isLogin ? Colors.white : Colors.transparent,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromRGBO(7, 48, 45, 0.06),
                                    spreadRadius: 2,
                                    blurRadius: 6,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  S.current.login,
                                  style: TextStyle(
                                      fontWeight: isLogin
                                          ? FontWeight.w600
                                          : FontWeight.w400,
                                      fontSize: 14,
                                      height: 20 / 14,
                                      leadingDistribution:
                                          TextLeadingDistribution.even,
                                      color: isLogin
                                          ? const Color(0xFF212121)
                                          : const Color(0xFF6E6E6E)),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 4),
                          InkWell(
                            onTap: () {
                              isLogin = false;
                              setState(() {});
                            },
                            child: Container(
                              width: 160,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color:
                                    isLogin ? Colors.transparent : Colors.white,
                              ),
                              child: Center(
                                child: Text(
                                  S.current.register,
                                  style: TextStyle(
                                    fontWeight: isLogin
                                        ? FontWeight.w400
                                        : FontWeight.w600,
                                    fontSize: 14,
                                    height: 20 / 14,
                                    leadingDistribution:
                                        TextLeadingDistribution.even,
                                    color: isLogin
                                        ? const Color(0xFF6E6E6E)
                                        : const Color(0xFF212121),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 24),
          Expanded(
            child: SingleChildScrollView(
              child: isLogin ? const LoginWidget() : const RegisterWidget(),
            ),
          )
        ],
      ),
    );
  }
}
