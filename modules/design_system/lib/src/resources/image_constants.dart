class ImageConstants {
  static String defaultAppLogo = ImageApp.defaultAppLogo.path;
  static String defaultAuthBg = ImageApp.authBackground.path;
}

enum ImageApp {
  defaultAppLogo('assets/images/vdone_logo.png'),
  authBackground('assets/images/bg_auth.png');

  const ImageApp(this.path);
  final String path;
}
