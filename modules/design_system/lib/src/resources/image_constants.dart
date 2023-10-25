class ImageConstants {
  static String defaultAppLogo = ImageApp.defaultAppLogo.path;
}

enum ImageApp {
  defaultAppLogo('assets/images/bg_auth.png'),
  authBackground('assets/images/vdone_logo.png');

  const ImageApp(this.path);
  final String path;
}
