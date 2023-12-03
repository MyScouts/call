import 'package:app_main/src/app_size.dart';
import 'package:flutter/cupertino.dart';

import 'pip_view.dart';

class PipPosition {
  final PipView _overlayView;

  Offset get bottomRight {
    return _bottomRight ?? Offset.zero;
  }

  Offset get bottomLeft {
    return _bottomLeft ?? Offset.zero;
  }

  Offset get topRight {
    return _topRight ?? Offset.zero;
  }

  Offset get topLeft {
    return _topLeft ?? Offset.zero;
  }

  Offset get overTopLeft {
    return _overTopLeft ?? Offset.zero;
  }

  Offset? _topLeft;
  Offset? _topRight;
  Offset? _bottomRight;
  Offset? _bottomLeft;
  Offset? _overTopLeft;

  PipPosition(this._overlayView) {
    _topLeft = Offset(
      8,
      SizeConfig.mediaQuerypadding.top,
    );
    _topRight = Offset(
      SizeConfig.screenWidth - _overlayView.width - 8,
      SizeConfig.mediaQuerypadding.top,
    );
    _bottomRight = Offset(
      SizeConfig.screenWidth - _overlayView.width - 8,
      SizeConfig.screenHeight -
          _overlayView.height -
          SizeConfig.mediaQuerypadding.bottom -
          8,
    );
    _bottomLeft = Offset(
      8,
      SizeConfig.screenHeight -
          _overlayView.height -
          SizeConfig.mediaQuerypadding.bottom -
          8,
    );
    _overTopLeft = Offset(
      -_overlayView.width,
      SizeConfig.mediaQuerypadding.top,
    );
  }
}
