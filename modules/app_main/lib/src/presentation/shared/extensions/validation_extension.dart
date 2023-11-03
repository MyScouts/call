import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:ui/ui.dart';

import '../../../domain/usecases/validation_usecase.dart';

extension BuildContextExtValidation on BuildContext {
  String? validationRequired(String? value) {
    final resultValidate = ValidationsUsecase().requiredValue(value);
    if (resultValidate == ValidationRequiredField.nullData) {
      return S.of(this).validate_PleaseEnterInfo;
    }

    return null;
  }

  // String? validationPhone(String? phone) {
  //   final resultValidate = ValidationsUsecase().phoneNumber(phone);
  //   switch (resultValidate) {
  //     case ValidationBasicStatus.invalidFormat:
  //       return S.of(this).validate_PleaseEnterCorrectPhone;
  //     case ValidationBasicStatus.nullData:
  //       return S.of(this).validate_PleaseEnterPhone;
  //     case ValidationBasicStatus.success:
  //       return null;
  //   }
  // }

  // String? validationEmail(String? value) {
  //   final resultValidate = ValidationsUsecase().email(value);
  //   switch (resultValidate) {
  //     case ValidationBasicStatus.invalidFormat:
  //       return S.of(this).validate_PleaseEnterCorrectEmail;
  //     case ValidationBasicStatus.nullData:
  //       return S.of(this).validate_PleaseEnterEmail;
  //     case ValidationBasicStatus.success:
  //       return null;
  //   }
  // }

  // String? validationPassword(String? value) {
  //   final validationResult = ValidationsUsecase().password(value);
  //
  //   switch (validationResult) {
  //     case ValidationPasswordStatus.invalidFormat:
  //       return S.of(this).validate_PasswordFormat;
  //     case ValidationPasswordStatus.invalidMinLength:
  //       return S
  //           .of(this)
  //           .validate_PasswordMustLeastNumCharacter(passWordMinCharacter);
  //     case ValidationPasswordStatus.nullData:
  //       return S.of(this).validate_PleaseEnterPassword;
  //     case ValidationPasswordStatus.success:
  //       return null;
  //   }
  // }

  // String? validationUsername(String? value) {
  //   final validationResult = ValidationsUsecase().username(value);
  //
  //   switch (validationResult) {
  //     case ValidationUsernameStatus.invalidMinLength:
  //       return S.of(this).validate_UsernameMustLeast4Character;
  //     case ValidationUsernameStatus.nullData:
  //       return S.of(this).validate_PleaseEnterUsername;
  //     case ValidationUsernameStatus.success:
  //       return null;
  //   }
  // }

  String? validateEmptyInfo(String? value, String messageError) {
    final isNullOrEmpty = value?.isEmpty ?? true;
    if (isNullOrEmpty) {
      return messageError;
    }

    return null;
  }

  String? validateGender(String? value, String messageError) {
    print(value);
    if (value != 'Nam' && value != 'Nữ') {
      return messageError;
    }

    return null;
  }

  String? validateRetypePassword(
      String? value, String messageError, String password) {
    final isNullOrEmpty = value?.isEmpty ?? true;
    if (isNullOrEmpty) {
      return messageError;
    }

    if (value != password) {
      return 'Nhập lại mật khẩu không đúng.';
    }

    return null;
  }

  List<RequirementItem> requirementCheckListPassword(
      String Function() onChangePassword) {
    return [
      RequirementItem(
        title: 'Tối thiểu 8 ký tự',
        validator: () {
          final password = onChangePassword();
          return password.length >= 8;
        },
      ),
      RequirementItem(
        title: 'Có ít nhất một ký tự viết hoa',
        validator: () {
          final password = onChangePassword();
          final listCode = password.codeUnits;

          final indexItemChar = listCode.firstWhere(
            (element) => element >= 65 && element <= 90,
            orElse: () => -1,
          );

          return indexItemChar >= 0;
        },
      ),
      RequirementItem(
        title: 'Có ít nhất một chữ số',
        validator: () {
          final password = onChangePassword();
          final listCode = password.codeUnits;

          final indexItemNumber = listCode.firstWhere(
            (element) => element >= 48 && element <= 57,
            orElse: () => -1,
          );

          return indexItemNumber >= 0;
        },
      )
    ];
  }

  String? validateformatPDoneAccount(String? value, String messageError) {
    final isNullOrEmpty = value?.isEmpty ?? true;
    if (isNullOrEmpty) {
      return messageError;
    }

    if (value!.startsWith('VN') && value.length == 12) {
      return null;
    }

    return messageError;
  }

  String? validateCCCD(String? value, String messageError) {
    final isNullOrEmpty = value?.isEmpty ?? true;
    if (isNullOrEmpty) {
      return messageError;
    }

    final text = value!.trim();

    if (text.length < 8 || text.length > 12) {
      return messageError;
    }

    return null;
  }

  // String? validateEmailOrPhone(String? value, String messageError) {
  //   final isNullOrEmpty = value?.isEmpty ?? true;
  //   if (isNullOrEmpty) {
  //     return messageError;
  //   }
  //
  //   final text = value!.trim();
  //
  //   if (!text.contains('@')) {
  //     return validationPhone(value);
  //   }
  //
  //   return validationEmail(value);
  // }
}
