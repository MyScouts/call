// Copyright 2022 Fighttech.vn, Ltd. All rights reserved.

part of '../theme.dart';

class ThemeColorDark extends ThemeColor {
  @override
  Color get primary => const Color(0xFF015CB5);
  @override
  Color get accent => const Color.fromARGB(255, 0, 157, 255);
  @override
  Color get scaffoldBackground => AppColors.white;
  @override
  Color get background => AppColors.grey12;

  // Bottom Navigation Bar
  @override
  Color get bottomBarIconSelected => primary;

  @override
  Color get bottomBarIconUnSelected => const Color(0xFF9D9D9D);

  @override
  Color get bottomBarSelectedItemColor => primary;

  @override
  Color get bottomBarUnselectedItemColor => const Color(0xFF9D9D9D);

  @override
  Color get appbarTitleColor => const Color(0xFF1D1E2C);

  @override
  Color get textColor => AppColors.white;

  @override
  Color get outlinedButtonPrimary => Colors.black;

  @override
  Color get secondary => const Color.fromARGB(0, 0, 119, 250);

  @override
  Color get error => AppColors.red10;

  @override
  Color get textInputBorderColor => AppColors.grey10;

  @override
  Color get hintTextColor => AppColors.grey10;

  @override
  Color get disableBackgroundColor => AppColors.grey11;
}
