import 'package:flutter/material.dart';

abstract class SizeConfig {
  const SizeConfig._();

  static const heightRatio = 812;
  static const widthRatio = 375;

  static late double screenWidth;
  static late double screenHeight;

  /// Width Padding
  static late double horizontalPadding;

  /// Height Padding
  static late double verticalPadding;

  static late EdgeInsets mediaQuerypadding;

  static late double safeTopPadding;

  static late double safeBottomPadding;

  static late double keyboardHeight;

  static double calculateHorizontal(double value) =>
      screenWidth * value / widthRatio;
  static double calculateVertical(double value) =>
      screenHeight * value / heightRatio;

  static double calculateWidth(double value) => calculateHorizontal(value);
  static double calculateHeight(double value) => calculateVertical(value);

  static double commonIconSize = screenWidth * 92 / widthRatio;

  static double get yOffsetWithBottomBar =>
      SizeConfig.screenHeight - 56 - 58 - 16;
  static double get yOffset => SizeConfig.screenHeight - 56 - 16;
  static double get xOffset => SizeConfig.screenWidth - 56 - 16;

  static void init(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    screenWidth = mediaQueryData.size.width;
    screenHeight = mediaQueryData.size.height;
    horizontalPadding = screenWidth * 16 / widthRatio;
    verticalPadding = screenHeight * 16 / heightRatio;
    mediaQuerypadding = mediaQueryData.padding;
    safeTopPadding = MediaQuery.of(context).padding.top;
    safeBottomPadding = MediaQuery.of(context).padding.bottom;
    keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
  }
}