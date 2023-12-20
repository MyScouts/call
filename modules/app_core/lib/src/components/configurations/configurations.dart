// Copyright 2021 Fighttech.vn, Ltd. All rights reserved.

import 'default_env.dart';

class Configurations {
  static String _environment = DefaultConfig.environment;
  static String _baseUrl = DefaultConfig.baseUrl;
  static String _ecommereBaseUrl = DefaultConfig.ecommereBaseUrl;
  static bool _isStudio = DefaultConfig.isStudio;
  static bool _isProduction = DefaultConfig.isProduction;
  static String _hash = DefaultConfig.hash;
  static int _userIdOffice = DefaultConfig.userIdOffice;
  static String _zaloSupport = '';
  static String _phoneSupport = '';
  static String _androidPackageId = '';
  static String _iosAppId = '';
  static Map<String, dynamic> _telegramLog = {};

  void setConfigurationValues(Map<String, dynamic> value) {
    _environment = value['environment'] ?? DefaultConfig.environment;
    _baseUrl = value['baseUrl'] ?? DefaultConfig.baseUrl;
    _isStudio = value['isStudio'] ?? DefaultConfig.isStudio;
    _isProduction = value['isProduction'] ?? DefaultConfig.isProduction;
    _ecommereBaseUrl =
        value['ecommereBaseUrl'] ?? DefaultConfig.ecommereBaseUrl;

    _hash = value['hash'] ?? DefaultConfig.hash;
    _userIdOffice = value['userIdOffice'] ?? DefaultConfig.userIdOffice;
    _zaloSupport = value['zaloSupport'] ?? '';
    _phoneSupport = value['phoneSupport'] ?? '';
    _iosAppId = value['iosAppId'] ?? '';
    _androidPackageId = value['androidPackageId'] ?? '';
    _telegramLog = value['telegramLog'] ?? '';
  }

  static String get environment => _environment;

  static String get baseUrl => _baseUrl;

  static String get ecommereBaseUrl => _ecommereBaseUrl;

  static Map<String, dynamic> get telegramLog => _telegramLog;

  static bool get isStudio => _isStudio;

  static bool get isProduction => _isProduction;

  static String get hash => _hash;

  static int get userIdOffice => _userIdOffice;

  static String get zaloSupport => _zaloSupport;

  static String get phoneSupport => _phoneSupport;

  static String get androidPackageId => _androidPackageId;

  static String get iosAppId => _iosAppId;
}

extension StringExtAppConfig on String {
  String get getLinkMedia => '${Configurations.ecommereBaseUrl}$this';
}
