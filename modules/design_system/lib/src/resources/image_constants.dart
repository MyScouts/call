class ImageConstants {
  static String defaultAppLogo = ImageApp.defaultAppLogo.path;
  static String defaultAuthBg = ImageApp.authBackground.path;
  static String bgCongratulation = ImageApp.bgCongratulation.path;
  static String bgFacebook = ImageApp.bgFacebook.path;
  static String bgInstagram = ImageApp.bgInstagram.path;
  static String bgTiktok = ImageApp.bgTiktok.path;
  static String bgLocket = ImageApp.bgLocket.path;
  static String defaultBgDashboard = ImageApp.defaultBgDashboard.path;
  static String warning = ImageApp.warning.path;
}

enum ImageApp {
  defaultBgDashboard('assets/images/bg_dashboard.jpeg'),
  defaultAppLogo('assets/images/vdone_logo.png'),
  authBackground('assets/images/bg_auth.png'),
  bgCongratulation('assets/images/bg_congratulation.png'),
  bgFacebook('assets/images/facebook.jpg'),
  bgInstagram('assets/images/instagram.webp'),
  bgTiktok('assets/images/tiktok.webp'),
  bgLocket('assets/images/locket.webp'),
  warning('assets/images/warning.png');

  const ImageApp(this.path);
  final String path;
}
