import 'package:localization/localization.dart';

import '../../app_core.dart';

RegExp phoneRegex = RegExp(r'^\+[0-9]{1,4} [0-9]+');
RegExp passwordRegex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$');

class ValidationHelper {
  static String? phone(String? value) {
    if (value == null || value.isEmpty) {
      return S.current.validation_required(S.current.lbl_Phone).capitalize();
    }
    // if (!phoneRegex.hasMatch(value)) {
    //   return 'Invalid phone number';
    // }
    return null;
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
}
