class IconAppConstants {
  static String icPhone = IconApp.iconPhone.path;
  static String icUncheckCircle = IconApp.iconUnCheckCircle.path;
  static String icCheckCircle = IconApp.icCheckCircle.path;
  static String icErrorCircle = IconApp.icErrorCircle.path;
  static String icVnFlag = IconApp.iconVnFlag.path;
  static String icArrowLeft = IconApp.icArrowLeft.path;
  static String icHamburger = IconApp.icHamburger.path;
  static String icSearch = IconApp.icSearch.path;
  static String icECommerce = IconApp.icECommerce.path;
  static String icVDone = IconApp.icVDone.path;
  static String icNews = IconApp.icNews.path;
}

enum IconApp {
  icVDone('assets/icons/ic_vdone.png'),
  icNews('assets/icons/ic_news.png'),
  icECommerce('assets/icons/ic_ecommerce.png'),
  icHamburger('assets/icons/ic_hamburger.svg'),
  icSearch('assets/icons/ic_search.svg'),
  iconPhone('assets/icons/ic_phone.png'),
  iconUnCheckCircle('assets/icons/ic_uncheck-circle.svg'),
  icCheckCircle('assets/icons/ic_check_circle.png'),
  icErrorCircle('assets/icons/ic_error_circle.png'),
  iconVnFlag('assets/icons/vn_flag.png'),
  icArrowLeft('assets/icons/ic_arrow_left.svg');

  const IconApp(this.path);
  final String path;
}
