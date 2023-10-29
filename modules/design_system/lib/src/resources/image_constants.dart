class ImageConstants {
  static String defaultAppLogo = ImageApp.defaultAppLogo.path;
  static String defaultAuthBg = ImageApp.authBackground.path;
  static String bgCongratulation = ImageApp.bgCongratulation.path;
  static String warning = ImageApp.warning.path;
  static String defaultAvatar = ImageApp.defaultAvatar.path;
  static String rafiki = ImageApp.rafiki.path;
  static String previewPerson = ImageApp.previewPerson.path;
  static String frontCMND = ImageApp.frontCMND.path;
  static String passport = ImageApp.passport.path;
  static String backCMND = ImageApp.backCMND.path;
}

enum ImageApp {
  defaultAppLogo('assets/images/vdone_logo.png'),
  authBackground('assets/images/bg_auth.png'),
  bgCongratulation('assets/images/bg_congratulation.png'),
  defaultAvatar('assets/images/person.png'),
  rafiki('assets/images/rafiki.png'),
  previewPerson('assets/images/preview_person.png'),
  frontCMND('assets/images/front_cmnd.png'),
  passport('assets/images/passport.png'),
  backCMND('assets/images/back_cmnd.png'),
  warning('assets/images/warning.png');

  const ImageApp(this.path);
  final String path;
}
