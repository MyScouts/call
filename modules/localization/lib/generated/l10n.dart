// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `server internal error`
  String get messages_server_internal_error {
    return Intl.message(
      'server internal error',
      name: 'messages_server_internal_error',
      desc: '',
      args: [],
    );
  }

  /// `Login failed.`
  String get messages_login_fail {
    return Intl.message(
      'Login failed.',
      name: 'messages_login_fail',
      desc: '',
      args: [],
    );
  }

  /// `{field} is required.`
  String validation_required(Object field) {
    return Intl.message(
      '$field is required.',
      name: 'validation_required',
      desc: '',
      args: [field],
    );
  }

  /// `{field} invalid.`
  String validation_invalid(Object field) {
    return Intl.message(
      '$field invalid.',
      name: 'validation_invalid',
      desc: '',
      args: [field],
    );
  }

  /// `phone number`
  String get lbl_Phone {
    return Intl.message(
      'phone number',
      name: 'lbl_Phone',
      desc: '',
      args: [],
    );
  }

  /// `password`
  String get lbl_password {
    return Intl.message(
      'password',
      name: 'lbl_password',
      desc: '',
      args: [],
    );
  }

  /// `enter phone number`
  String get phone_placeholder {
    return Intl.message(
      'enter phone number',
      name: 'phone_placeholder',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'vi'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
