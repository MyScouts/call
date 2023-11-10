class ImageConstants {
  static String defaultAppLogo = ImageApp.defaultAppLogo.path;
  static String defaultAuthBg = ImageApp.authBackground.path;
  static String bgCongratulation = ImageApp.bgCongratulation.path;
  static String bgFacebook = ImageApp.bgFacebook.path;
  static String bgInstagram = ImageApp.bgInstagram.path;
  static String bgTiktok = ImageApp.bgTiktok.path;
  static String bgLocket = ImageApp.bgLocket.path;
  static String defaultBgDashboard = ImageApp.defaultBgDashboard.path;
  static String imgdefault = ImageApp.imgdefault.path;
  static String warning = ImageApp.warning.path;
  static String defaultAvatar = ImageApp.defaultAvatar.path;
  static String rafiki = ImageApp.rafiki.path;
  static String pdoneSuccess = ImageApp.pdoneSuccess.path;
  static String previewPerson = ImageApp.previewPerson.path;
  static String frontCMND = ImageApp.frontCMND.path;
  static String passport = ImageApp.passport.path;
  static String backCMND = ImageApp.backCMND.path;
  static String live = ImageApp.live.path;
  static String banner = ImageApp.banner.path;
  static String cmBg = ImageApp.cmBg.path;
  static String perBg = ImageApp.perBg.path;
  static String ecomBg = ImageApp.ecomBg.path;
  static String defaultUserAvatar = ImageApp.defaultUserAvatar.path;
  static String defaultUserBackground = ImageApp.defaultUserBackground.path;
  static String bgQrCode = ImageApp.bgQrCode.path;
  static String emptyDataList = ImageApp.emptyDataList.path;
  static String communityBanner = ImageApp.communityBanner.path;
  static String communityDuLich = ImageApp.communityDuLich.path;
  static String communityLuatSu = ImageApp.communityLuatSu.path;
  static String communityNgheThuat = ImageApp.communityNgheThuat.path;
  static String communityTruyenThong = ImageApp.communityTruyenThong.path;
  static String communityXayDung = ImageApp.communityXayDung.path;
  static String communityViecLam = ImageApp.communityViecLam.path;
  static String celebrate = ImageApp.celebrate.path;
  static String bg1 = ImageApp.bg1.path;
  static String bg2 = ImageApp.bg2.path;
  static String bg3 = ImageApp.bg3.path;
  static String bg4 = ImageApp.bg4.path;
  static String bg5 = ImageApp.bg5.path;
  static String bg6 = ImageApp.bg6.path;
  static String bg7 = ImageApp.bg7.path;
  static String bg8 = ImageApp.bg8.path;
  static String bg9 = ImageApp.bg9.path;
  static String bg10 = ImageApp.bg10.path;
  static String bg11 = ImageApp.bg11.path;
  static String imgDefaultTeamBanner = ImageApp.imgDefaultTeamBanner.path;
  static String guidePdone = ImageApp.guidePdone.path;
  static String bgEmpty = ImageApp.bgEmpty.path;
}

enum ImageApp {
  bgEmpty('assets/images/empty.png'),
  bgQrCode('assets/images/bg_qrcode.png'),
  defaultUserAvatar('assets/images/avatar.png'),
  defaultUserBackground('assets/images/bg_diary.jpeg'),
  defaultBgDashboard('assets/images/bg_dashboard.jpeg'),
  defaultAppLogo('assets/images/vdone_logo.png'),
  authBackground('assets/images/bg_auth.png'),
  bgCongratulation('assets/images/bg_congratulation.png'),
  bgFacebook('assets/images/facebook.jpg'),
  bgInstagram('assets/images/instagram.webp'),
  bgTiktok('assets/images/tiktok.webp'),
  bgLocket('assets/images/locket.webp'),
  defaultAvatar('assets/images/person.png'),
  rafiki('assets/images/rafiki.png'),
  pdoneSuccess('assets/images/pdone_success.png'),
  previewPerson('assets/images/preview_person.png'),
  frontCMND('assets/images/front_cmnd.png'),
  passport('assets/images/passport.png'),
  backCMND('assets/images/back_cmnd.png'),
  imgdefault('assets/images/logo.png'),
  warning('assets/images/warning.png'),
  banner('assets/images/banner.png'),
  cmBg('assets/images/cm_bg.png'),
  perBg('assets/images/per_bg.png'),
  ecomBg('assets/images/ecom_bg.png'),
  live('assets/images/live.png'),
  emptyDataList('assets/images/empty_data_list.png'),
  communityBanner('assets/images/community_banner.png'),
  communityXayDung('assets/images/xaydung.jpg'),
  communityTruyenThong('assets/images/truyenthong.jpg'),
  communityViecLam('assets/images/vieclam.jpg'),
  communityNgheThuat('assets/images/nghethuat.jpg'),
  communityLuatSu('assets/images/luatsu.png'),
  communityDuLich('assets/images/dulich.jpg'),
  //modules/design_system/assets/images/celebrate.png
  imgDefaultTeamBanner('assets/images/img_default_team_banner.png'),
  celebrate('assets/images/celebrate.png'),
  guidePdone('assets/images/guidePdone.png'),
  bg1('assets/images/bg1.png'),
  bg2('assets/images/bg2.png'),
  bg3('assets/images/bg3.png'),
  bg4('assets/images/bg4.png'),
  bg5('assets/images/bg5.png'),
  bg6('assets/images/bg6.png'),
  bg7('assets/images/bg7.png'),
  bg8('assets/images/bg8.png'),
  bg9('assets/images/bg9.png'),
  bg10('assets/images/bg10.png'),
  bg11('assets/images/bg11.png');

  const ImageApp(this.path);

  final String path;
}
