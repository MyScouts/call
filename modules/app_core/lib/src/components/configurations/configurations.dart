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
  }

  static String get environment => _environment;
  static String get baseUrl => _baseUrl;
  static String get ecommereBaseUrl => _ecommereBaseUrl;

  static bool get isStudio => _isStudio;
  static bool get isProduction => _isProduction;
  static String get hash => _hash;
  static int get userIdOffice => _userIdOffice;
  static String get zaloSupport => _zaloSupport;
  static String get phoneSupport => _phoneSupport;
}

extension StringExtAppConfig on String {
  String get getlinkMedia => '${Configurations.ecommereBaseUrl}$this';
}
