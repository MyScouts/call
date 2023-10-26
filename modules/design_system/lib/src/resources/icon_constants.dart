class IconAppConstants {
  static String icPhone = IconApp.iconPhone.path;
  static String icUncheckCircle = IconApp.iconUnCheckCircle.path;
  static String icVnFlag = IconApp.iconVnFlag.path;
  static String icArrowLeft = IconApp.icArrowLeft.path;
}

enum IconApp {
  iconPhone('assets/icons/ic_phone.png'),
  iconUnCheckCircle('assets/icons/ic_uncheck-circle.svg'),
  iconVnFlag('assets/icons/vn_flag.png'),
  icArrowLeft('assets/icons/ic_arrow_left.svg');

  const IconApp(this.path);
  final String path;
}
