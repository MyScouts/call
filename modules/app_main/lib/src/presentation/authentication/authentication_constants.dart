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
