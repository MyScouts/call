enum ValidationRequiredField {
  success,
  nullData,
}

enum ValidationBasicStatus {
  success,
  invalidFormat,
  nullData,
}

enum ValidationUsernameStatus {
  success,
  invalidMinLength,
  nullData,
}

enum ValidationPasswordStatus {
  success,
  nullData,
  invalidMinLength,
  invalidFormat,
}

const passWordMinCharacter = 6;

class ValidationsUsecase {
  ValidationPasswordStatus password(String? passwd) {
    if (passwd?.isEmpty ?? true) {
      return ValidationPasswordStatus.nullData;
    }
    if (passwd!.length < passWordMinCharacter) {
      return ValidationPasswordStatus.invalidMinLength;
    }
    return ValidationPasswordStatus.success;

    // const String pattern =
    //     r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    // final RegExp regExp = RegExp(pattern);

    // return regExp.hasMatch(passwd)
    //     ? ValidationPasswordStatus.success
    //     : ValidationPasswordStatus.invalidFormat;
  }

  ValidationPasswordStatus changePassword(String? passwd) {
    if (passwd?.isEmpty ?? true) {
      return ValidationPasswordStatus.nullData;
    }
    if (passwd!.length < passWordMinCharacter) {
      return ValidationPasswordStatus.invalidMinLength;
    }

    const String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    final RegExp regExp = RegExp(pattern);

    return regExp.hasMatch(passwd)
        ? ValidationPasswordStatus.success
        : ValidationPasswordStatus.invalidFormat;
  }

  ValidationUsernameStatus username(String? username) {
    if (username?.isEmpty ?? true) {
      return ValidationUsernameStatus.nullData;
    }

    // if (username!.length < 4) {
    //   return ValidationUsernameStatus.invalidMinLength;
    // }

    return ValidationUsernameStatus.success;
  }

  ValidationRequiredField requiredValue(String? value) {
    if (value?.isEmpty ?? true) {
      return ValidationRequiredField.nullData;
    }
    return ValidationRequiredField.success;
  }

  ValidationBasicStatus email(String? email) {
    if (email?.isEmpty ?? true) {
      return ValidationBasicStatus.nullData;
    }

    return RegExp(
                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
            .hasMatch(email!)
        ? ValidationBasicStatus.success
        : ValidationBasicStatus.invalidFormat;
  }

  ValidationBasicStatus phoneNumber(String? phone) {
    if (phone?.isEmpty ?? true) {
      return ValidationBasicStatus.nullData;
    }

    return RegExp(r'(^(?:[+0]9)?[0-9]{9,12}$)').hasMatch(phone!)
        ? ValidationBasicStatus.success
        : ValidationBasicStatus.invalidFormat;
  }
}
