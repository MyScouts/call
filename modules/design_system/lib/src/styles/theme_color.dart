part of 'theme.dart';

abstract class ThemeColor {
  Color get primary;
  Color get secondary;
  Color get accent;
  Color get scaffoldBackground;

  Color get background;

  // BottomNavigationBar
  Color get bottomBarIconSelected;

  Color get bottomBarIconUnSelected;

  Color get bottomBarSelectedItemColor;

  Color get bottomBarUnselectedItemColor;

  //
  Color get appbarTitleColor;

  Color get error;
  Color get disableBackgroundColor;
  Color get textInputBorderColor;
  Color get hintTextColor;

  // Button
  Color get textColor;

  Color get outlinedButtonPrimary;
}

class AppColors {
  /// grey
  static const Color lightGrey = Color(0xFFE9F0F6);
  static const Color grey2 = Color(0xff696969);
  static const Color grey3 = Color(0xffEDEDED);
  static const Color grey4 = Color(0xffB6B6B6);
  static const Color grey5 = Color(0xffE0E0E0);
  static const Color grey6 = Color(0xffDADADA);
  static const Color grey7 = Color(0xffC8D3DE);
  static const Color grey8 = Color(0xff9EAED1);
  static const Color grey9 = Color(0xffDFDFDF);
  static const Color grey10 = Color(0xffA6AFCE);
  static const Color grey11 = Color(0xff9EAED1);
  static const Color grey12 = Color(0xffF5F5F5);
  static const Color grey13 = Color(0xffD1D1D1);
  static const Color grey14 = Color(0xffA1A1A1);
  static const Color grey15 = Color(0xffBDBDBD);
  static const Color grey20 = Color(0xff828282);
  static const Color grey30 = Color(0xff717171);
  static const Color grey40 = Color(0xff636363);
  static const Color grey50 = Color(0xff7B7676);
  static const Color grey69 = Color(0xffEFEFEF);
  static const Color grey70 = Color(0xffF2F2F2);
  static const Color grey71 = Color(0xffFAFAFA);
  static const Color grey72 = Color(0xff666666);
  static const Color grey73 = Color(0xff555555);
  static const Color grey74 = Color(0xff707070);
  static const Color greyTextColor = Color(0xff434343);
  static const Color greyLightTextColor = Color(0xff8C8C8C);
  static const Color greyBorder = Color(0xffE2E2E2);
  static const Color popupShadowColor = Color(0xff919EAB);
  static const Color grey75 = Color(0xff90A3BF);
  static const Color greyIcon = Color(0xff3F3F46);
  static const Color gray50 = Color(0xffF4F4F4);
  static const Color neutral200 = Color(0xffC8C8C8);
  static const Color grey76 = Color(0xff6E6E6E);
  static const Color grey77 = Color(0xffACACAC);
  static const Color grey78 = Color(0xff667385);
  static const Color grey79 = Color(0xffEAEDF0);
  static const Color grey80 = Color(0xffF9F9F9);
  static const Color grey81 = Color(0xffF4F4F4);
  static const Color grey82 = Color(0xffC8C8C8);



  /// white
  static const Color white = Color(0xffffffff);

  /// black
  static const Color black = Colors.black;
  static const Color black10 = Color(0xff333333);
  static const Color black11 = Color(0xff363636);
  static const Color black12 = Color(0xff383838);
  static const Color textBlackColor = Color(0xFF130838);
  static const Color black13 = Color(0xFF3F3F3F);

  /// blue
  static const Color blue5 = Color(0xffF1F8FF);
  static const Color blue6 = Color(0xffECF5FE);
  static const Color blue7 = Color(0xffD4F0FF);
  static const Color blue8 = Color(0xff54D7FF);
  static const Color blue9 = Color(0xff2AC5F4);
  static const Color blue10 = Color(0xff1E90FF);
  static const Color blue11 = Color(0xff3C9DFC);
  static const Color blue12 = Color(0xffCEE1F2);
  static const Color blue13 = Color(0xffE1F0FF);
  static const Color blue14 = Color(0xff73DDFF);

  static const Color blue3 = Color(0xffEfFBFF);
  static const Color blue15 = Color(0xff287DB2);
  static const Color blue16 = Color(0xff2685AE);
  static const Color blue20 = Color(0xff0E88FF);
  static const Color blue25 = Color(0xff2F80ED);
  static const Color blue30 = Color(0xff005BB4);
  static const Color blue31 = Color(0xff0023C4);
  static const Color blue32 = Color(0xff5BA3E9);
  static const Color blue33 = Color(0xff458EF7);
  static const Color blue34 = Color(0xff353DFF);
  static const Color blueEdit = Color(0xff4B84F7);
  static const Color blue35 = Color(0xffEDF4FF);
  static const Color blue36 = Color(0xff015CB5);
  static const Color blue37 = Color(0xff0E86FC);
  

  /// pink
  static const Color pink10 = Color(0xffFF7FD2);
  static const Color pink11 = Color(0xffFFEDF8);
  static const Color pink12 = Color(0xffE495DA);

  /// green
  static const Color green10 = Color(0xff20F943);
  static const Color green11 = Color(0xff03A300);
  static const Color green20 = Color(0xff5FD95C);
  static const Color green21 = Color(0xff74C973);

  /// red
  static const Color red1 = Color(0xffDA3E39);
  static const Color red2 = Color(0xffD92424);
  static const Color red3 = Color(0xffFF4D4F);
  static const Color red10 = Color(0xffD90000);
  static const Color red20 = Color(0xffE0230D);
  static const Color red30 = Color(0xffEB5757);
  static const Color red35 = Color(0xffDD636E);
  static const Color red36 = Color(0xffFF0000);
  static const Color red69 = Color(0xffEA5F5F);
  static const Color red70 = Color(0xffFF5757);

  static const Color red500 = Color(0XFFDE372D);

  /// purple
  static const Color purple10 = Color(0xff403666);
  static const Color purple20 = Color(0xffA663B5);
  static const Color purple30 = Color(0xff571BFF);
  static const Color purple35 = Color(0xffF61AF4);
  static const Color purple50 = Color(0xFF3E0367);
  static const Color purple55 = Color(0xFFC872FF);

  /// organge
  static const Color organge1 = Color(0xffFFAD0D);

  /// gray
  static const Color gray500 = Color(0xFF6E6E6E);

  /// bg
  static const Color bgFa = Color(0xFFFAFAFA);
  static const Color bgButtonCall = Color(0xFFF3F7FA);

  static const Color bgColor = Color(0xFFF3F8FF);
  static const Color borderColor = Color(0xFFF2F2F2);

  static const Color textDisable = Color(0xffACACAC);
  static const Color textSecondary = Color(0xff6E6E6E);

  static const Color bgSenderMessage = Color(0xff0070F0);
  static const Color bgCard = Color(0xFFF8F8F8);

  static const Color lineColor = Color(0xFFEAEDF0);
}
