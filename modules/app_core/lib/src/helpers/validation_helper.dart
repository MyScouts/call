import 'package:localization/localization.dart';

import '../../app_core.dart';

RegExp phoneRegex = RegExp(r'^\d{10}$');
RegExp passwordRegex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$');

class ValidationHelper {
  static String? phone(String? value) {
    if (value == null || value.isEmpty) {
      return S.current.validation_required(S.current.lbl_Phone).capitalize();
    }
    final String phone = int.tryParse(value).toString();
    if (phone.length == 9 && phone.substring(0, 2) != '12' ||
        (phone.length == 10 && phone.substring(0, 2) == '12')) {
      return null;
    }
    return S.current.validation_invalid(S.current.lbl_Phone).capitalize();
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return S.current.validation_required(S.current.lbl_password).capitalize();
    }
    if (!passwordRegex.hasMatch(value)) {
      return S.current.validation_invalid(S.current.lbl_password).capitalize();
    }
    return null;
  }

  static String? match(String? value1, String value2) {
    if (value1 != value2) {
      return S.current.validation_password_match.capitalize();
    }
    return null;
  }

  static String? requiredValid(String? value, String label) {
    if (value == null || value.isEmpty) {
      return S.current.validation_required(label).capitalize();
    }
    return null;
  }
}
