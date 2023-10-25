import 'package:intl/intl.dart';

extension IntExt on int {
  String get stringNum {
    return NumberFormat.compactCurrency(
      decimalDigits: 0,
      symbol: '',
      locale: 'en',
    ).format(this).toLowerCase().replaceAll('.', ',');
  }

  int get notZero {
    return this < 0 ? 0 : this;
  }
}

extension CurrencyExt on num? {
  String toAppCurrencyString({bool isWithSymbol = true, String? locale}) {
    return NumberFormat.currency(
      locale: locale ?? 'vi',
      symbol: isWithSymbol ? 'đ' : '',
      customPattern: '#,###${isWithSymbol ? '\u00a4' : ''}',
    ).format(this ?? 0);
  }
}

extension IntNullExt on int? {
  int get getNumber {
    return this ?? 0;
  }
}
