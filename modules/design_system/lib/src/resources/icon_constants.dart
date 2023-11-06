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
  static String communityGroup = IconApp.communityGroup.path;
  static String communitySurvey = IconApp.communitySurvey.path;
  static String communityCharity = IconApp.communityCharity.path;
  static String communityTraining = IconApp.communityTraining.path;
  static String gallery = IconApp.gallery.path;
  static String camera2 = IconApp.camera2.path;

  static String icLogout = IconApp.icLogout.path;
  static String icWaiting = IconApp.icWaiting.path;
  static String icApproved = IconApp.icApproved.path;
  static String icReject = IconApp.icReject.path;
  static String icApprovedTick = IconApp.icApprovedTick.path;
}

enum IconApp {
  icLogout('assets/icons/ic_logout.png'),
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
  communityGroup('assets/icons/community_group.svg'),
  //modules/design_system/assets/icons/community_survey.svg
  communitySurvey('assets/icons/community_survey.svg'),
  //modules/design_system/assets/icons/community_charity.svg
  communityCharity('assets/icons/community_charity.svg'),
  //modules/design_system/assets/icons/community_training.svg
  communityTraining('assets/icons/community_training.svg'),
  camera2('assets/icons/wallet/camera2.svg'),
  gallery('assets/icons/wallet/gallery.svg'),

  icArrowLeft('assets/icons/ic_arrow_left.svg'),
  icApproved('assets/icons/ic_approved.svg'),
  icWaiting('assets/icons/ic_waiting.svg'),
  icReject('assets/icons/ic_reject.svg'),
  icApprovedTick('assets/icons/ic_approved_tick.svg');

  const IconApp(this.path);
  final String path;
}
