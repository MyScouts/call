import 'package:flutter/widgets.dart';

double statusBarHeight = 0;

double bottomInset = 0;

double pixelRatio = 1;

double screenWidth = 375;

void setMediaQueryData(MediaQueryData data) {
  statusBarHeight = data.viewPadding.top;
  bottomInset = data.viewPadding.bottom;
  pixelRatio = data.devicePixelRatio;
  screenWidth = data.size.width;
}