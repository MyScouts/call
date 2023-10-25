import 'package:flutter/material.dart';

import 'string_ext.dart';

extension ObjectExt<T> on T {
  R let<R>(R Function(T it) op) => op(this);
}

T? asOrNull<T>(dynamic value, [T? defaultValue]) {
  if (value is T) {
    return value;
  }
  if (value != null) {
    try {
      final tType = T.toString();
      if (tType == 'List<String>') {
        return value.cast<String>();
      }
      if (tType == 'List<double>') {
        return value.cast<double>();
      }
      if (tType == 'List<int>') {
        return value.cast<int>();
      }
      if (tType == 'String' && value is String) {
        return value as T;
      }
      if (tType == 'DateTime' && value is String) {
        return DateTime.tryParse(value) as T;
      }
      if (value is num) {
        if (tType == 'double') {
          return value.toDouble() as T;
        }
        if (tType == 'int') {
          return value.toInt() as T;
        }
      }
      if (tType == 'Duration' && value is String) {
        return value.parseDuration() as T;
      }
      if (tType == 'Color' && value is String) {
        var hexColor = value.replaceAll('#', '');
        if (hexColor.length == 6) {
          hexColor = 'FF$hexColor';
        }
        if (hexColor.length == 8) {
          return Color(int.parse('0x$hexColor')) as T;
        }
      }
    } catch (_) {}
  }
  return defaultValue;
}

int? intPareSafe(dynamic value) {
  int? val;
  try {
    val = int.parse(value);
  } catch (_) {}
  return val;
}
