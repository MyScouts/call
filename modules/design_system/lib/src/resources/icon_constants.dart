class IconAppConstants {
  static String icPhone = IconApp.iconPhone.path;
  static String icUncheckCircle = IconApp.iconUnCheckCircle.path;
  static String icCheckCircle = IconApp.icCheckCircle.path;
  static String icErrorCircle = IconApp.icErrorCircle.path;
  static String icVnFlag = IconApp.iconVnFlag.path;
  static String icArrowLeft = IconApp.icArrowLeft.path;
  static String icHamburger = IconApp.icHamburger.path;
  static String icSearch = IconApp.icSearch.path;
  static String visibilityOff = IconApp.visibilityOff.path;
  static String visibility = IconApp.visibility.path;
  static String star = IconApp.star.path;
  static String proAds = IconApp.proAds.path;
  static String pro = IconApp.pro.path;
  static String icECommerce = IconApp.icECommerce.path;
  static String icVDone = IconApp.icVDone.path;
  static String icNews = IconApp.icNews.path;
  static String icGroupTeam = IconApp.icGroupTeam.path;
  static String icPayment = IconApp.icPayment.path;
  static String icVStore = IconApp.icVStore.path;
  static String icBToB = IconApp.icBToB.path;
  static String icChanel = IconApp.icChanel.path;
  static String icWheelOfFortune = IconApp.icWheelOfFortune.path;
  static String icDashboardContact = IconApp.icDashboardContact.path;
  static String icTv = IconApp.icTv.path;
  static String icBird = IconApp.icBird.path;
  static String icClock = IconApp.icClock.path;
  static String icDoc = IconApp.icDoc.path;
}

enum IconApp {
  icWheelOfFortune('assets/icons/wheel_of_fortune.png'),
  icChanel('assets/icons/ic_chanel.png'),
  icBToB('assets/icons/ic_b_to_b.png'),
  icVStore('assets/icons/ic_vstore.png'),
  icPayment('assets/icons/ic_payment.png'),
  icGroupTeam('assets/icons/ic_group_team.png'),
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
  visibility('assets/icons/visibility.png'),
  visibilityOff('assets/icons/visibility_off.png'),
  star('assets/icons/star.png'),
  proAds('assets/icons/pro_ads.png'),
  pro('assets/icons/pro.png'),
  icArrowLeft('assets/icons/ic_arrow_left.svg'),
  icTv('assets/icons/ic_tv.png'),
  icBird('assets/icons/ic_bird.png'),
  icClock('assets/icons/ic_clock.png'),
  icDoc('assets/icons/ic_doc.png'),
  icDashboardContact('assets/icons/ic_dashboard_contact.png');

  const IconApp(this.path);
  final String path;
}
