class IconAppConstants {
  static String icPhone = IconApp.iconPhone.path;
  static String icUncheckCircle = IconApp.iconUnCheckCircle.path;
  static String icCheckCircle = IconApp.icCheckCircle.path;
  static String icErrorCircle = IconApp.icErrorCircle.path;
  static String icVnFlag = IconApp.iconVnFlag.path;
  static String icArrowLeft = IconApp.icArrowLeft.path;
  static String visibilityOff = IconApp.visibilityOff.path;
  static String visibility = IconApp.visibility.path;
  static String star = IconApp.star.path;
  static String proAds = IconApp.proAds.path;
  static String pro = IconApp.pro.path;
}

enum IconApp {
  iconPhone('assets/icons/ic_phone.png'),
  iconUnCheckCircle('assets/icons/ic_uncheck-circle.svg'),
  icCheckCircle('assets/icons/ic_check_circle.png'),
  icErrorCircle('assets/icons/ic_error_circle.png'),
  iconVnFlag('assets/icons/vn_flag.png'),
  visibility('assets/icons/visibility.png'),
  visibilityOff('assets/icons/visibility_off.png'),
  star('assets/icons/star.png'),
  proAds('assets/icons/pro_ads.png'),
  pro('assets/icons/pro.png'),
  icArrowLeft('assets/icons/ic_arrow_left.svg');

  const IconApp(this.path);
  final String path;
}
