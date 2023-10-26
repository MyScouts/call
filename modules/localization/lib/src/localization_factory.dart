import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../localization.dart';

class LocalizationFactory {
  static Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates =
      const [
    S.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];
  static List<Locale> supportedLocales = const [
    Locale('vi', 'VN'), // VietName, no country code
    Locale('en', 'US'), // English, no country code
  ];
}
