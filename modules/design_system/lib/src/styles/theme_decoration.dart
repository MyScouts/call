// Copyright 2022 Fighttech.vn, Ltd. All rights reserved.

part of 'theme.dart';

class ThemeDecoration {
  final ThemeData _theme;
  const ThemeDecoration(this._theme);

  BoxDecoration get appBarGradient => const BoxDecoration();

  BoxDecoration get textShadow => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: [
            _theme.colorScheme.background,
            Colors.white.withOpacity(0.2),
          ],
        ),
      );

  BoxDecoration get panelBottomShadow => BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
        color: _theme.scaffoldBackgroundColor,
      );

  BoxDecoration get card => BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        border: Border.all(color: Colors.grey),
      );

  InputBorder get textInputBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide:
            BorderSide(color: _theme.themeColor.textInputBorderColor, width: 1),
      );
  InputBorder get textInputErrorBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: _theme.themeColor.error, width: 1),
      );

  InputBorder get textInputBorderSocial => OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.transparent, width: 0),
      );

  InputBorder get textInputBorderNone => OutlineInputBorder(
        borderRadius: BorderRadius.circular(1),
        borderSide: BorderSide.none,
      );
  InputBorder get textInputSearchBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(40),
        borderSide: BorderSide.none,
      );

  LinearGradient get gradientPrimary =>
      const LinearGradient(colors: [AppColors.blue30, AppColors.blue20]);
}
