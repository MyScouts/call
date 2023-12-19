// Copyright 2022 Fighttech.vn, Ltd. All rights reserved.

import 'package:flutter/material.dart';

part 'colors/dark.dart';
part 'colors/light.dart';
part 'theme_color.dart';
part 'theme_decoration.dart';
part 'theme_display_metric.dart';
part 'theme_text.dart';

extension BrightnessExt on Brightness {
  ThemeColor getThemeColor() {
    return this == Brightness.light ? ThemeColorLight() : ThemeColorDark();
  }
}

extension ThemeDataExt on ThemeData {
  ThemeColor get themeColor => brightness.getThemeColor();

  ThemeDecoration get themeDecoration => ThemeDecoration(this);

  ThemeDisplayMetric get themeDisplayMetric => const ThemeDisplayMetric();

  String get fontFamily => 'Inter';

  ThemeData getTheme(Brightness theme, {Map<String, dynamic>? themeJson}) {
    final dataThemeColor = theme.getThemeColor();
    final themeText = ThemeText(
      fontFamily,
      themeColor: dataThemeColor,
    );
    final newTextTheme = themeText.getTextTheme;

    return ThemeData(
      brightness: theme,
      fontFamily: fontFamily,
      textTheme: newTextTheme,
      primaryTextTheme: newTextTheme,
      colorScheme: colorScheme.copyWith(
        primary: dataThemeColor.primary,
        brightness: theme,
        secondary: dataThemeColor.accent,
        onBackground: dataThemeColor.textColor,
        background: dataThemeColor.background,
        error: dataThemeColor.error,
      ),
      tabBarTheme: TabBarTheme(
        indicator: const UnderlineTabIndicator(
          borderSide: BorderSide(
            color: AppColors.white,
            width: 2,
          ),
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: AppColors.white,
        unselectedLabelColor: AppColors.white,
        labelStyle: themeText.tabBarThemeLabelStyle,
        unselectedLabelStyle: themeText.tabBarThemeUnselectedLabelStyle,
      ),
      primaryColor: dataThemeColor.primary,
      scaffoldBackgroundColor: dataThemeColor.scaffoldBackground,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        unselectedItemColor: const Color(0xFF8f8f8f),
        selectedItemColor: themeColor.primary,
        selectedLabelStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: themeColor.primary,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: AppColors.grey14,
        ),
        selectedIconTheme: IconThemeData(color: themeColor.primary),
        unselectedIconTheme: const IconThemeData(color: AppColors.grey14),
        type: BottomNavigationBarType.fixed,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(45),
          padding: EdgeInsets.zero,
          elevation: 0,
          disabledForegroundColor: AppColors.white,
          disabledBackgroundColor: themeColor.disableBackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor:
              MaterialStateProperty.all<Color>(dataThemeColor.textColor),
          textStyle: MaterialStateProperty.all<TextStyle>(
            themeText.textButtonThemeStyle,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: themeColor.primary),
          ),
          foregroundColor: themeColor.outlinedButtonPrimary,
          padding: EdgeInsets.zero,
          minimumSize: const Size.fromHeight(45),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        contentPadding: const EdgeInsets.only(
          top: 18,
          bottom: 12,
          left: 15,
          right: 15,
        ),
        filled: true,
        fillColor: AppColors.white,
        hintStyle: themeText.getTextTheme.labelMedium?.copyWith(
          color: themeColor.hintTextColor,
        ),
        focusColor: dataThemeColor.scaffoldBackground,
        focusedBorder: themeDecoration.textInputBorder,
        border: themeDecoration.textInputBorderNone,
        enabledBorder: themeDecoration.textInputBorder,
        focusedErrorBorder: themeDecoration.textInputErrorBorder,
        errorBorder: themeDecoration.textInputErrorBorder,
      ),
      appBarTheme: AppBarTheme(
        surfaceTintColor: Colors.white,
        backgroundColor: dataThemeColor.scaffoldBackground,
        titleTextStyle: themeText.textTitleAppbarThemeStyle,
        toolbarHeight: 48,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        shape: const Border(
          bottom: BorderSide(color: Color(0xFFF0F2F4)),
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: dataThemeColor.background,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
      ),
    );
  }
}
