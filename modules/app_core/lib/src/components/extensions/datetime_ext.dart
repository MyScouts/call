import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'object_ext.dart';

extension DateTimeExt on DateTime {
  String get dateTimeDisplay {
    final formatterDate = DateFormat('MM/dd/yyyy');
    final formatterTime = DateFormat.jm();
    final actualDate = formatterDate.format(this);
    final actualTime = formatterTime.format(this);

    return '$actualDate at $actualTime';
  }

  String get tohhmm {
    final formatterDate = DateFormat('HH:mm');
    final actualDate = formatterDate.format(this);

    return actualDate;
  }

  String get toddMMyyyy {
    final formatterDate = DateFormat('dd MM yyyy');
    final actualDate = formatterDate.format(this);

    return actualDate;
  }

  String get toddMMMyyyy {
    final formatterDate = DateFormat('dd MMM yyyy');
    final actualDate = formatterDate.format(this);

    return actualDate;
  }

  String get toYYYYmmdd {
    final formatterDate = DateFormat('yyyy-MM-dd');
    final actualDate = formatterDate.format(this);

    return actualDate;
  }

  String get ddMMyyyy {
    final formatterDate = DateFormat('dd/MM/yyyy');
    final actualDate = formatterDate.format(this);

    return actualDate;
  }

  String get formatServer {
    final formatterDate = DateFormat('yyyy-MM-dd');
    final actualDate = formatterDate.format(this);

    return actualDate;
  }

  String get datetimeMessage {
    final formatterDate = DateFormat('dd/MM hh:mm');
    final actualDate = formatterDate.format(this);

    return actualDate;
  }

  String get datetimeDiscountProduct {
    final formatterDate = DateFormat('HH:mm dd/MM/yyyy ');
    final actualDate = formatterDate.format(this);

    return actualDate;
  }

  String get dateOrder {
    final formatterDate = DateFormat('MMM dd, yyyy hh:mm');
    final actualDate = formatterDate.format(this);
    return actualDate;
  }

  String get datePreOrder {
    final formatterDate = DateFormat('dd/MM/yyyy, HH:mm:ss');
    final actualDate = formatterDate.format(this);
    return actualDate;
  }

  String get dateDiscountProduct {
    final formatterDate = DateFormat('yyyy/MM/dd HH:mm');
    final actualDate = formatterDate.format(this);
    return actualDate;
  }

  String get timeLastMessage {
    final timeNow = DateTime.now();
    late DateFormat formatterDate;
    if (timeNow.day == day) {
      formatterDate = DateFormat('hh:mm');
    } else {
      formatterDate = DateFormat('dd/MM hh:mm');
    }

    final actualDate = formatterDate.format(this);
    return actualDate;
  }

  String get toHumanReadable {
    timeago.setLocaleMessages('vi_VN', timeago.ViMessages());

    return timeago.format(this, locale: Intl.getCurrentLocale());
  }

  String get timeComment {
    if (DateTime.now().subtract(const Duration(days: 1)).compareTo(this) > -1) {
      return datetimeMessage;
    }

    return toHumanReadable
        .replaceAll('một phút trước', 'Vừa xong')
        .replaceAll('a moment ago', 'Now')
        .replaceAll('a minute', 'Now')
        .replaceAll('khoảng ', '')
        .replaceAll(' phút', ' phút')
        .replaceAll(' tiếng', ' giờ')
        .replaceAll('trước', '');
  }

  String get timeMessage {
    if (DateTime.now().subtract(const Duration(days: 2)).compareTo(this) > -1) {
      return datetimeMessage;
    }

    return toHumanReadable
        .replaceAll('một phút trước', 'Vừa xong')
        .replaceAll('a moment ago', 'Now')
        .replaceAll('a minute', 'Now')
        .replaceAll('khoảng ', '')
        .replaceAll(' phút', 'm')
        .replaceAll(' tiếng', 'h');
  }

  bool isUnder18yearsAgo() =>
      (DateTime(DateTime.now().year, month, day).isAfter(DateTime.now())
          ? DateTime.now().year - year - 1
          : DateTime.now().year - year) <
      18;

  bool isUnder15yearsAgo() {
    final now = DateTime.now();
    final fifthteenYearsAgo = now.subtract(
      const Duration(days: 15 * 365),
    ); // Assuming 365 days in a year

    return isAfter(fifthteenYearsAgo);
  }

  String text() {
    return '''${year.toString()}-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}''';
  }

  String formatDate() {
    return '''${day.toString().padLeft(2, '0')}/${month.toString().padLeft(2, '0')}/${year.toString()}''';
  }

  int get getOld {
    final DateTime currentDate = DateTime.now();
    int age = currentDate.year - year;
    if (currentDate.month < month ||
        (currentDate.month == month && currentDate.day < day)) {
      age--;
    }
    return age;
  }
}

extension DateOnlyCompare on DateTime {
  int dayLeft() {
    return difference(DateTime.now()).inDays;
  }

  bool get isToday {
    return isSameDay(DateTime.now());
  }

  bool isSameDay(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  bool isBeforeDate(DateTime other) {
    return !isSameDay(other) && isBefore(other);
  }

  DateTime copyWith({
    int? year,
    int? month,
    int? day,
    int? hour,
    int? minute,
    int? second,
    int? millisecond,
    bool? isUtc,
  }) {
    return ((isUtc ?? this.isUtc) ? DateTime.utc : DateTime.new)(
      year ?? this.year,
      month ?? this.month,
      day ?? this.day,
      hour ?? this.hour,
      minute ?? this.minute,
      second ?? this.second,
      millisecond ?? this.millisecond,
    );
  }

  DateTime get startDate {
    return DateTime(year, month, day);
  }

  DateTime get middle {
    return DateTime(year, month, day, 12);
  }

  DateTime get endDate {
    return DateTime(year, month, day, 23, 59, 59, 999);
  }

  DateTime get startThisWeek {
    return subtract(Duration(days: weekday - 1)).startDate;
  }

  DateTime get startPrevWeek {
    return subtract(Duration(days: weekday + 6)).startDate;
  }

  DateTime get endPrevWeek {
    return startPrevWeek.add(const Duration(days: 6)).endDate;
  }

  DateTime get prevMonth {
    return copyWith(month: month - 1);
  }

  DateTime get startPrevMonth {
    return prevMonth.copyWith(day: 1).startDate;
  }

  DateTime get endPrevMonth {
    return startPrevMonth.let(
      (d) => d
          .copyWith(month: d.month + 1)
          .subtract(const Duration(days: 1))
          .endDate,
    );
  }
}
