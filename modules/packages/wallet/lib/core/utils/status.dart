import 'package:app_core/app_core.dart';
import 'package:flutter/material.dart';

import '../core.dart';

enum ColorStatus {
  plus,
  minus,
  pending;

  Color get color {
    switch (this) {
      case ColorStatus.plus:
        return WalletTheme.primaryColor6;
      case ColorStatus.minus:
        return WalletTheme.dustRed;
      case ColorStatus.pending:
        return WalletTheme.white50;
    }
  }

  String parse(String value, {bool isWithSymbol = false}) {
    final valueDouble = double.tryParse(value);
    if (valueDouble == null) {
      return value;
    }

    switch (this) {
      case ColorStatus.pending:
      case ColorStatus.plus:
        // ignore: lines_longer_than_80_chars
        return '+${valueDouble.toAppCurrencyString(isWithSymbol: isWithSymbol)}';
      case ColorStatus.minus:
        // ignore: lines_longer_than_80_chars
        return '-${valueDouble.toAppCurrencyString(isWithSymbol: isWithSymbol)}';
    }
  }

  String minusDiamondValue(String value, {bool isWithSymbol = false}) {
    final valueDouble = double.tryParse(value);
    if (valueDouble == null) {
      return value;
    }
    return '-${valueDouble.toAppCurrencyString(isWithSymbol: isWithSymbol)}';
  }
}
