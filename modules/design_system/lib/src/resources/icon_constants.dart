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
  static String icLogout = IconApp.icLogout.path;
  static String icFemale = IconApp.icFemale.path;
  static String icMale = IconApp.icMale.path;
  static String icUserGroup = IconApp.icUserGroup.path;
  static String icUserAddSolid = IconApp.icUserAddSolid.path;
  static String icUserAddOutline = IconApp.icUserAddOutline.path;
  static String icFlag = IconApp.icFlag.path;
  static String icQrCode = IconApp.icQrCode.path;
  static String icChatBan = IconApp.icChatBan.path;
  static String icFriendBan = IconApp.icFriendBan.path;
  static String icNewsBan = IconApp.icNewsBan.path;
  static String icUserRemove = IconApp.icUserRemove.path;
}

enum IconApp {
  icFriendBan('assets/icons/ic_friend_ban.svg'),
  icQrCode('assets/icons/ic_qrcode.svg'),
  icUserRemove('assets/icons/ic_user_remove.svg'),
  icNewsBan('assets/icons/ic_newspaper_ban.svg'),
  icChatBan('assets/icons/ic_chat_ban.svg'),
  icFlag('assets/icons/ic_flag.svg'),
  icUserAddOutline('assets/icons/ic_user_add_outline.svg'),
  icUserAddSolid('assets/icons/ic_user_add_solid.svg'),
  icUserGroup('assets/icons/ic_user_group.svg'),
  icFemale('assets/icons/ic_female.png'),
  icMale('assets/icons/ic_male.png'),
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
  icArrowLeft('assets/icons/ic_arrow_left.svg');

  const IconApp(this.path);
  final String path;
}
