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

  /// `Resend OTP success.`
  String get messages_resend_otp_success {
    return Intl.message(
      'Resend OTP success.',
      name: 'messages_resend_otp_success',
      desc: '',
      args: [],
    );
  }

  /// `password invalid.`
  String get message_password_invalid {
    return Intl.message(
      'password invalid.',
      name: 'message_password_invalid',
      desc: '',
      args: [],
    );
  }

  /// `User not found.`
  String get message_user_not_found {
    return Intl.message(
      'User not found.',
      name: 'message_user_not_found',
      desc: '',
      args: [],
    );
  }

  /// `User exits`
  String get message_user_exits {
    return Intl.message(
      'User exits',
      name: 'message_user_exits',
      desc: '',
      args: [],
    );
  }

  /// `register fail.`
  String get message_register_fail {
    return Intl.message(
      'register fail.',
      name: 'message_register_fail',
      desc: '',
      args: [],
    );
  }

  /// `OTP invalid.`
  String get message_otp_not_match {
    return Intl.message(
      'OTP invalid.',
      name: 'message_otp_not_match',
      desc: '',
      args: [],
    );
  }

  /// `resend OTP fail.`
  String get messages_resend_otp_fail {
    return Intl.message(
      'resend OTP fail.',
      name: 'messages_resend_otp_fail',
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

  /// `Password confirm not match`
  String get validation_password_match {
    return Intl.message(
      'Password confirm not match',
      name: 'validation_password_match',
      desc: '',
      args: [],
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

  /// `Password Confirm`
  String get lbl_password_confirm {
    return Intl.message(
      'Password Confirm',
      name: 'lbl_password_confirm',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get lbl_continue {
    return Intl.message(
      'Continue',
      name: 'lbl_continue',
      desc: '',
      args: [],
    );
  }

  /// `search`
  String get search {
    return Intl.message(
      'search',
      name: 'search',
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

  /// `Minimum of 8 characters`
  String get minium_8_character {
    return Intl.message(
      'Minimum of 8 characters',
      name: 'minium_8_character',
      desc: '',
      args: [],
    );
  }

  /// `Contains at least one uppercase character`
  String get least_one_uppercase_character {
    return Intl.message(
      'Contains at least one uppercase character',
      name: 'least_one_uppercase_character',
      desc: '',
      args: [],
    );
  }

  /// `Has at least 1 digit`
  String get has_one_1_digit {
    return Intl.message(
      'Has at least 1 digit',
      name: 'has_one_1_digit',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password?`
  String get forgot_password {
    return Intl.message(
      'Forgot password?',
      name: 'forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `Registration is consent to`
  String get registration_is_consent_to {
    return Intl.message(
      'Registration is consent to',
      name: 'registration_is_consent_to',
      desc: '',
      args: [],
    );
  }

  /// `terms_of_service_and_policies`
  String get terms_of_service_and_policies {
    return Intl.message(
      'terms_of_service_and_policies',
      name: 'terms_of_service_and_policies',
      desc: '',
      args: [],
    );
  }

  /// `by VDONE`
  String get by_vdone {
    return Intl.message(
      'by VDONE',
      name: 'by_vdone',
      desc: '',
      args: [],
    );
  }

  /// `Note about passwords`
  String get note_about_passwords {
    return Intl.message(
      'Note about passwords',
      name: 'note_about_passwords',
      desc: '',
      args: [],
    );
  }

  /// `Enter the verification code`
  String get enter_the_verification_code {
    return Intl.message(
      'Enter the verification code',
      name: 'enter_the_verification_code',
      desc: '',
      args: [],
    );
  }

  /// `Confirmation code has been sent`
  String get confirmation_code_has_been_sent {
    return Intl.message(
      'Confirmation code has been sent',
      name: 'confirmation_code_has_been_sent',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Resend the code later?`
  String get resend_the_code_later {
    return Intl.message(
      'Resend the code later?',
      name: 'resend_the_code_later',
      desc: '',
      args: [],
    );
  }

  /// `Resend`
  String get resend {
    return Intl.message(
      'Resend',
      name: 'resend',
      desc: '',
      args: [],
    );
  }

  /// `Congratulations, you have successfully registered!`
  String get congratulations_on_your_successful_registration {
    return Intl.message(
      'Congratulations, you have successfully registered!',
      name: 'congratulations_on_your_successful_registration',
      desc: '',
      args: [],
    );
  }

  /// `Wish you have great experiences on our products`
  String get wish_you_have_great_experiences_on_our_products {
    return Intl.message(
      'Wish you have great experiences on our products',
      name: 'wish_you_have_great_experiences_on_our_products',
      desc: '',
      args: [],
    );
  }

  /// `setting`
  String get setting {
    return Intl.message(
      'setting',
      name: 'setting',
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
