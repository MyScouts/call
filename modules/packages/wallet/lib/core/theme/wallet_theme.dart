import 'package:flutter/material.dart';

class WalletTheme {
  WalletTheme._();

  static const backgroundColor = Color(0xffD7F3FF);

  static const primaryColor6 = Color(0xff1890FF);

  /// grey
  static const lightGrey = Color(0xFFE9F0F6);
  static const grey72 = Color(0xff999999);
  static const grey73 = Color(0xFFD9D9D9);
  static const grey74 = Color(0xff707070);
  static const grey75 = Color(0xffBFBFBF);
  static const grey76 = Color(0xff7C7C7C);
  static const greyTextColor = Color(0xff434343);
  static const greyLightTextColor = Color(0xff8C8C8C);
  static const greyBorder = Color(0xffE2E2E2);
  static const greyLightBorder = Color(0xffD1D1D1);
  static const popupShadowColor = Color(0xff919EAB);
  static const greyBackgroundColor = Color(0xffF0F0F0);
  static final white50 = const Color(0xff000000).withOpacity(0.5);
  static const greyDivider = Color(0xff9F9F9F);

  /// black
  static const black = Colors.black;
  static const black22 = Color(0xff222222);

  /// white
  static const white = Colors.white;
  static const whiteTitle = Color(0xffF2F1F1);

  // green
  static const polarGreen = Color(0xff389E0D);

  /// red
  static const red = Colors.red;
  static const dustRed = Color(0xffF5222D);
  static final red66 = const Color(0xffFF0000).withOpacity(0.66);

  /// purple
  static const Color purple30 = Color(0xFF8381DD);

  /// transparent
  static const Color transparent = Colors.transparent;

  /// blue
  static const Color blueCheckedColor = Color(0xff1E90FF);
  static const Color lightBlue = Color(0xFFECF5FE);

  static const Color textColor = Color(0xFF282828);
  static const Color goldColor = Color(0xFFF9A233);

  static const Color ddoneColor = Color(0xFFE47A2E);
  static const Color ddoneBgColor = Color(0xFFFFFCD7);
  static const Color coinColor = Color(0xFFC6650C);
  static const Color coinBgColor = Color(0xFFFEF2D8);
  static const Color diamondColor = Color(0xFF4B84F7);
  static const Color diamondBgColor = Color(0xFFE9F4FF);
  static const Color vndColor = Color(0xFF1E9737);
  static const Color vndBgColor = Color(0xFFE0FEEC);

  static const Color bgColor = Color(0xFFF2F3F4);

  static final Color shadowColor = const Color(0xFF212121).withOpacity(0.08);
}

extension WalletThemeExt on BuildContext {
  Color get walletBackgroundColor => WalletTheme.backgroundColor;

  Size get size => MediaQuery.of(this).size;
}
