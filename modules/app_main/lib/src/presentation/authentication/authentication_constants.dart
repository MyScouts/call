import 'package:app_core/app_core.dart';
import 'package:localization/localization.dart';

class AuthenticationConstants {
  static const countryIdDefault = 240;
  static const int phoneNumberLimit = 10;
  static const int otpLength = 6;
  static const int otpTimer = 60; // second
}

enum TypeOtpGenerate {
  registration,
  forgotPassword,
}

enum PasswordRules { min8Character, hasOneCapital, hasOneNumber }

extension GetPasswordRulesText on PasswordRules {
  String getText() {
    switch (this) {
      case PasswordRules.min8Character:
        return S.current.minium_8_character.capitalize();
      case PasswordRules.hasOneCapital:
        return S.current.least_one_uppercase_character.capitalize();
      case PasswordRules.hasOneNumber:
        return S.current.has_one_1_digit.capitalize();
      default:
        return "";
    }
  }
}
