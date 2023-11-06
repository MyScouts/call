// ignore_for_file: join_return_with_assignment

import 'dart:convert';
import 'dart:io';

import 'package:intl/intl.dart';

extension StringExt on String {
  bool get isNotEmptyData => isNotEmpty && toUpperCase() != 'NULL';

  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }

  String get htmlToString => Bidi.stripHtmlIfNeeded(this);

  bool get isPathVideo =>
      ['mp4', 'mov'].contains(split('.').last.toLowerCase());

  bool get isImage =>
      ['png', 'jpg', 'jpeg'].contains(split('.').last.toLowerCase());

  String get capitalizeWord {
    final listString = toLowerCase().split(' ');
    listString.removeWhere((element) => element.isEmpty || element == ' ');
    return listString.map((e) => e.capitalize()).toList().join(' ');
  }
}

extension StringMaybeNull on String? {
  String textWithPrefix([String? prefix]) {
    return (this?.isNotEmpty ?? false) ? '$this${prefix ?? ''}' : '';
  }

  String? removeTrailingZero() {
    if (this == null) {
      return '';
    }
    if (!this!.contains('.')) {
      return this;
    }
    var str = this!.replaceAll(RegExp(r'0*$'), '');
    if (str.endsWith('.')) {
      str = str.substring(0, str.length - 1);
    }
    return str;
  }

  String? formatDiscount() {
    if (this == null) {
      return '';
    }
    if (!this!.contains('.')) {
      return this;
    }
    return this!.replaceFirst('.', ',');
  }
}

extension StringFormatPhoneExt on String? {
  String? get formatPhone {
    if (this == null) {
      return null;
    }
    return this?[0] == '0' ? this! : '0${this!}';
  }

  String get toPhone {
    if (this == null) {
      return '';
    }
    return int.parse(this ?? '0').toString();
  }
}

extension ImagePathToBase64 on String {
  String toBase64() {
    final imageBytes = File(this).readAsBytesSync();
    return base64Encode(imageBytes);
  }
}

extension DatetimeFormat on String {
  String dateTimeDisplay() {
    final date = split(' ').first;
    final time =
        DateFormat.jm().format(DateFormat('hh:mm:ss').parse(split(' ').last));

    return '$date at $time';
  }

  DateTime parseDateTime() {
    final DateFormat format = DateFormat('dd/MM/yyyy');
    final DateTime dateTime = format.parse(this);
    return dateTime;
  }
}

extension NullableStringIsNullOrEmptyExtension on String? {
  /// Returns `true` if the String is either null or empty.
  bool get isNullOrEmpty => this?.isEmpty ?? true;
}

extension NullableStringIsNotNullOrEmptyExtension on String? {
  bool get isNotNullOrEmpty => !isNullOrEmpty;
}

extension DurationByStringExt on String {
  Duration parseDuration() {
    var hours = 0;
    var minutes = 0;
    var micros = 0;
    final parts = split(':');
    try {
      if (parts.isNotEmpty) {
        hours = int.parse(parts.first);
      }
      if (parts.length > 1) {
        minutes = int.parse(parts[1]);
      }
      if (parts.length > 2) {
        micros = (double.parse(parts[parts.length - 1]) * 1000000).round();
      }
      return Duration(hours: hours, minutes: minutes, microseconds: micros);
    } catch (_) {
      return Duration.zero;
    }
  }
}

extension StringCheck on String {
  bool get hasNumber => RegExp(r'\d+').hasMatch(this);
  bool get hasUppercase => RegExp(r'[A-Z]').hasMatch(this);
}

extension CheckIsNumber on String {
  bool isNumber() {
    return RegExp(r'^\d+$').hasMatch(this);
  }
}
