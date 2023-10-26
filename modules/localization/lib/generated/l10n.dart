// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `{value}`
  String formatPrice(int value) {
    final NumberFormat valueNumberFormat = NumberFormat.simpleCurrency(
        locale: Intl.getCurrentLocale(), decimalDigits: 2);
    final String valueString = valueNumberFormat.format(value);

    return Intl.message(
      '$valueString',
      name: 'formatPrice',
      desc: 'Format Numbers and Currencies',
      args: [valueString],
    );
  }

  /// `{value}`
  String formatPriceShort(int value) {
    final NumberFormat valueNumberFormat = NumberFormat.compactCurrency(
        locale: Intl.getCurrentLocale(), decimalDigits: 2);
    final String valueString = valueNumberFormat.format(value);

    return Intl.message(
      '$valueString',
      name: 'formatPriceShort',
      desc: 'Format Numbers and Currencies',
      args: [valueString],
    );
  }

  /// `{date} | {time} `
  String formatDateDDmmYYYY(DateTime date, Object time) {
    final DateFormat dateDateFormat = DateFormat.yMd(Intl.getCurrentLocale());
    final String dateString = dateDateFormat.format(date);

    return Intl.message(
      '$dateString | $time ',
      name: 'formatDateDDmmYYYY',
      desc: '',
      args: [dateString, time],
    );
  }

  /// `{date} | {time} `
  String formatDateDDmmYYYYhhMM(DateTime date, DateTime time) {
    final DateFormat dateDateFormat = DateFormat.yMd(Intl.getCurrentLocale());
    final String dateString = dateDateFormat.format(date);

    final DateFormat timeDateFormat =
        DateFormat('hh:mm a', Intl.getCurrentLocale());
    final String timeString = timeDateFormat.format(time);

    return Intl.message(
      '$dateString | $timeString ',
      name: 'formatDateDDmmYYYYhhMM',
      desc: 'format datetime',
      args: [dateString, timeString],
    );
  }

  /// `Yes`
  String get cta_Yes {
    return Intl.message(
      'Yes',
      name: 'cta_Yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get cta_No {
    return Intl.message(
      'No',
      name: 'cta_No',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get cta_Save {
    return Intl.message(
      'Save',
      name: 'cta_Save',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get cta_Add {
    return Intl.message(
      'Add',
      name: 'cta_Add',
      desc: '',
      args: [],
    );
  }

  /// `Open`
  String get cta_Open {
    return Intl.message(
      'Open',
      name: 'cta_Open',
      desc: '',
      args: [],
    );
  }

  /// `Check out`
  String get cta_Checkout {
    return Intl.message(
      'Check out',
      name: 'cta_Checkout',
      desc: '',
      args: [],
    );
  }

  /// `Decline`
  String get cta_Decline {
    return Intl.message(
      'Decline',
      name: 'cta_Decline',
      desc: '',
      args: [],
    );
  }

  /// `Accept`
  String get cta_Accept {
    return Intl.message(
      'Accept',
      name: 'cta_Accept',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cta_Cancel {
    return Intl.message(
      'Cancel',
      name: 'cta_Cancel',
      desc: '',
      args: [],
    );
  }

  /// `Reschedule`
  String get cta_Reschedule {
    return Intl.message(
      'Reschedule',
      name: 'cta_Reschedule',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get lbl_Male {
    return Intl.message(
      'Male',
      name: 'lbl_Male',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get lbl_Female {
    return Intl.message(
      'Female',
      name: 'lbl_Female',
      desc: '',
      args: [],
    );
  }

  /// `Other`
  String get lbl_Other {
    return Intl.message(
      'Other',
      name: 'lbl_Other',
      desc: '',
      args: [],
    );
  }

  /// `Not found data!`
  String get lbl_NotFoundData {
    return Intl.message(
      'Not found data!',
      name: 'lbl_NotFoundData',
      desc: '',
      args: [],
    );
  }

  /// `Find`
  String get lbl_Find {
    return Intl.message(
      'Find',
      name: 'lbl_Find',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get lbl_Next {
    return Intl.message(
      'Next',
      name: 'lbl_Next',
      desc: '',
      args: [],
    );
  }

  /// `Message`
  String get lbl_Message {
    return Intl.message(
      'Message',
      name: 'lbl_Message',
      desc: '',
      args: [],
    );
  }

  /// `Allergist`
  String get lbl_Allergist {
    return Intl.message(
      'Allergist',
      name: 'lbl_Allergist',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get lbl_Address {
    return Intl.message(
      'Address',
      name: 'lbl_Address',
      desc: '',
      args: [],
    );
  }

  /// `I agree with VDONE Terms of Use`
  String get lbl_Terms {
    return Intl.message(
      'I agree with VDONE Terms of Use',
      name: 'lbl_Terms',
      desc: '',
      args: [],
    );
  }

  /// `Primary`
  String get lbl_Primary {
    return Intl.message(
      'Primary',
      name: 'lbl_Primary',
      desc: '',
      args: [],
    );
  }

  /// `Secondary`
  String get lbl_Secondary {
    return Intl.message(
      'Secondary',
      name: 'lbl_Secondary',
      desc: '',
      args: [],
    );
  }

  /// `Đăng nhập`
  String get lbl_Login {
    return Intl.message(
      'Đăng nhập',
      name: 'lbl_Login',
      desc: '',
      args: [],
    );
  }

  /// `Đăng ký`
  String get lbl_Register {
    return Intl.message(
      'Đăng ký',
      name: 'lbl_Register',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get lbl_Email {
    return Intl.message(
      'Email',
      name: 'lbl_Email',
      desc: '',
      args: [],
    );
  }

  /// `Số điện thoại`
  String get lbl_Phone {
    return Intl.message(
      'Số điện thoại',
      name: 'lbl_Phone',
      desc: '',
      args: [],
    );
  }

  /// `Tiếp theo`
  String get lbl_Continue {
    return Intl.message(
      'Tiếp theo',
      name: 'lbl_Continue',
      desc: '',
      args: [],
    );
  }

  /// `Xác nhận`
  String get lbl_Confirm {
    return Intl.message(
      'Xác nhận',
      name: 'lbl_Confirm',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get lbl_Gallery {
    return Intl.message(
      'Gallery',
      name: 'lbl_Gallery',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get lbl_Camera {
    return Intl.message(
      'Camera',
      name: 'lbl_Camera',
      desc: '',
      args: [],
    );
  }

  /// `File`
  String get lbl_File {
    return Intl.message(
      'File',
      name: 'lbl_File',
      desc: '',
      args: [],
    );
  }

  /// `Save Photo`
  String get lbl_SavePhoto {
    return Intl.message(
      'Save Photo',
      name: 'lbl_SavePhoto',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get lbl_Close {
    return Intl.message(
      'Close',
      name: 'lbl_Close',
      desc: '',
      args: [],
    );
  }

  /// `Street number`
  String get lblAddress_StreetNumber {
    return Intl.message(
      'Street number',
      name: 'lblAddress_StreetNumber',
      desc: '',
      args: [],
    );
  }

  /// `Street name`
  String get lblAddress_StreetName {
    return Intl.message(
      'Street name',
      name: 'lblAddress_StreetName',
      desc: '',
      args: [],
    );
  }

  /// `Suite`
  String get lblAddress_Suite {
    return Intl.message(
      'Suite',
      name: 'lblAddress_Suite',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get lblAddress_City {
    return Intl.message(
      'City',
      name: 'lblAddress_City',
      desc: '',
      args: [],
    );
  }

  /// `State`
  String get lblAddress_State {
    return Intl.message(
      'State',
      name: 'lblAddress_State',
      desc: '',
      args: [],
    );
  }

  /// `Zip code`
  String get lblAddress_ZipCode {
    return Intl.message(
      'Zip code',
      name: 'lblAddress_ZipCode',
      desc: '',
      args: [],
    );
  }

  /// `State/city (optional)`
  String get lblAddress_StateOrCity {
    return Intl.message(
      'State/city (optional)',
      name: 'lblAddress_StateOrCity',
      desc: '',
      args: [],
    );
  }

  /// `General information`
  String get lblUser_GeneralInfo {
    return Intl.message(
      'General information',
      name: 'lblUser_GeneralInfo',
      desc: '',
      args: [],
    );
  }

  /// `First name`
  String get lblUser_FirstName {
    return Intl.message(
      'First name',
      name: 'lblUser_FirstName',
      desc: '',
      args: [],
    );
  }

  /// `Last name`
  String get lblUser_LastName {
    return Intl.message(
      'Last name',
      name: 'lblUser_LastName',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get lblUser_PhoneNumber {
    return Intl.message(
      'Phone number',
      name: 'lblUser_PhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Profile picture`
  String get lblUser_ProfilePicture {
    return Intl.message(
      'Profile picture',
      name: 'lblUser_ProfilePicture',
      desc: '',
      args: [],
    );
  }

  /// `Cover photo`
  String get lblUser_CoverPhoto {
    return Intl.message(
      'Cover photo',
      name: 'lblUser_CoverPhoto',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get lblUser_Email {
    return Intl.message(
      'Email',
      name: 'lblUser_Email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get lblUser_Password {
    return Intl.message(
      'Password',
      name: 'lblUser_Password',
      desc: '',
      args: [],
    );
  }

  /// `Re-type Password`
  String get lblUser_RetypePassword {
    return Intl.message(
      'Re-type Password',
      name: 'lblUser_RetypePassword',
      desc: '',
      args: [],
    );
  }

  /// `Prefer not to answer`
  String get lblUser_PreferNotToAnswer {
    return Intl.message(
      'Prefer not to answer',
      name: 'lblUser_PreferNotToAnswer',
      desc: '',
      args: [],
    );
  }

  /// `Day of birth`
  String get lblUser_DayOfBirth {
    return Intl.message(
      'Day of birth',
      name: 'lblUser_DayOfBirth',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get signIn_Submit {
    return Intl.message(
      'Sign in',
      name: 'signIn_Submit',
      desc: '',
      args: [],
    );
  }

  /// `News`
  String get dashboard_TabNews {
    return Intl.message(
      'News',
      name: 'dashboard_TabNews',
      desc: '',
      args: [],
    );
  }

  /// `Live`
  String get dashboard_TabLive {
    return Intl.message(
      'Live',
      name: 'dashboard_TabLive',
      desc: '',
      args: [],
    );
  }

  /// `Explore`
  String get dashboard_TabExplore {
    return Intl.message(
      'Explore',
      name: 'dashboard_TabExplore',
      desc: '',
      args: [],
    );
  }

  /// `P-Done`
  String get dashboard_TabPDone {
    return Intl.message(
      'P-Done',
      name: 'dashboard_TabPDone',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng nhập tên đăng nhập`
  String get validate_PleaseEnterUsername {
    return Intl.message(
      'Vui lòng nhập tên đăng nhập',
      name: 'validate_PleaseEnterUsername',
      desc: '',
      args: [],
    );
  }

  /// `Tên đăng nhập phải có ít nhất 4 ký tự`
  String get validate_UsernameMustLeast4Character {
    return Intl.message(
      'Tên đăng nhập phải có ít nhất 4 ký tự',
      name: 'validate_UsernameMustLeast4Character',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng nhập thông tin tài khoản`
  String get validate_PleaseEnterAccountInfo {
    return Intl.message(
      'Vui lòng nhập thông tin tài khoản',
      name: 'validate_PleaseEnterAccountInfo',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng nhập mật khẩu`
  String get validate_PleaseEnterPassword {
    return Intl.message(
      'Vui lòng nhập mật khẩu',
      name: 'validate_PleaseEnterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Mật khẩu phải có ít nhất {passWordMinCharacter} ký tự`
  String validate_PasswordMustLeastNumCharacter(Object passWordMinCharacter) {
    return Intl.message(
      'Mật khẩu phải có ít nhất $passWordMinCharacter ký tự',
      name: 'validate_PasswordMustLeastNumCharacter',
      desc: '',
      args: [passWordMinCharacter],
    );
  }

  /// `Mật khẩu phải bao gồm chữ hoa, chữ thường, số, ký tự đặc biệt`
  String get validate_PasswordFormat {
    return Intl.message(
      'Mật khẩu phải bao gồm chữ hoa, chữ thường, số, ký tự đặc biệt',
      name: 'validate_PasswordFormat',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng nhập đúng email`
  String get validate_PleaseEnterCorrectEmail {
    return Intl.message(
      'Vui lòng nhập đúng email',
      name: 'validate_PleaseEnterCorrectEmail',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng nhập email`
  String get validate_PleaseEnterEmail {
    return Intl.message(
      'Vui lòng nhập email',
      name: 'validate_PleaseEnterEmail',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng nhập thông tin`
  String get validate_PleaseEnterInfo {
    return Intl.message(
      'Vui lòng nhập thông tin',
      name: 'validate_PleaseEnterInfo',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng nhập đúng số điện thoại`
  String get validate_PleaseEnterCorrectPhone {
    return Intl.message(
      'Vui lòng nhập đúng số điện thoại',
      name: 'validate_PleaseEnterCorrectPhone',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng nhập số điện thoại`
  String get validate_PleaseEnterPhone {
    return Intl.message(
      'Vui lòng nhập số điện thoại',
      name: 'validate_PleaseEnterPhone',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng nhập email hoặc số điện thoại`
  String get validate_PleaseEnterEmailOrPhone {
    return Intl.message(
      'Vui lòng nhập email hoặc số điện thoại',
      name: 'validate_PleaseEnterEmailOrPhone',
      desc: '',
      args: [],
    );
  }

  /// `Sai định dạng`
  String get validate_WrongFormat {
    return Intl.message(
      'Sai định dạng',
      name: 'validate_WrongFormat',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng chọn tập tin trước khi tiếp tục`
  String get validate_PleaseSelectFile {
    return Intl.message(
      'Vui lòng chọn tập tin trước khi tiếp tục',
      name: 'validate_PleaseSelectFile',
      desc: '',
      args: [],
    );
  }

  /// `Để trải nghiệm ứng dụng tốt hơn`
  String get auth_subdescription {
    return Intl.message(
      'Để trải nghiệm ứng dụng tốt hơn',
      name: 'auth_subdescription',
      desc: '',
      args: [],
    );
  }

  /// `Quên mật khẩu`
  String get auth_forgotPassword {
    return Intl.message(
      'Quên mật khẩu',
      name: 'auth_forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Nhập email hoặc số điện thoại đã đăng ký tài khoản`
  String get auth_forgotPasswordSubtitle {
    return Intl.message(
      'Nhập email hoặc số điện thoại đã đăng ký tài khoản',
      name: 'auth_forgotPasswordSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Đổi mật khẩu`
  String get auth_forgotPasswordEnterNewPassTitle {
    return Intl.message(
      'Đổi mật khẩu',
      name: 'auth_forgotPasswordEnterNewPassTitle',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng nhập mật khẩu mới cho tài khoản`
  String get auth_forgotPasswordEnterNewPassDescription {
    return Intl.message(
      'Vui lòng nhập mật khẩu mới cho tài khoản',
      name: 'auth_forgotPasswordEnterNewPassDescription',
      desc: '',
      args: [],
    );
  }

  /// `Xác thực tài khoản qua {type}`
  String verifyOtp_title(Object type) {
    return Intl.message(
      'Xác thực tài khoản qua $type',
      name: 'verifyOtp_title',
      desc: '',
      args: [type],
    );
  }

  /// `Xin vui lòng nhập mã OTP vừa được gửi tới {type}:`
  String verifyOtp_subtitle(Object type) {
    return Intl.message(
      'Xin vui lòng nhập mã OTP vừa được gửi tới $type:',
      name: 'verifyOtp_subtitle',
      desc: '',
      args: [type],
    );
  }

  /// `Gửi lại mãi thành công.`
  String get verifyOtp_resendSuccess {
    return Intl.message(
      'Gửi lại mãi thành công.',
      name: 'verifyOtp_resendSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Nhóm cộng đồng`
  String get community_group {
    return Intl.message(
      'Nhóm cộng đồng',
      name: 'community_group',
      desc: '',
      args: [],
    );
  }

  /// `Khảo sát cộng đồng`
  String get community_survey {
    return Intl.message(
      'Khảo sát cộng đồng',
      name: 'community_survey',
      desc: '',
      args: [],
    );
  }

  /// `Từ thiện cộng đồng`
  String get community_charity {
    return Intl.message(
      'Từ thiện cộng đồng',
      name: 'community_charity',
      desc: '',
      args: [],
    );
  }

  /// `Đào tạo cộng đồng`
  String get community_training {
    return Intl.message(
      'Đào tạo cộng đồng',
      name: 'community_training',
      desc: '',
      args: [],
    );
  }

  /// `Đăng ký P-Done`
  String get pdoneAction_registerPDone {
    return Intl.message(
      'Đăng ký P-Done',
      name: 'pdoneAction_registerPDone',
      desc: '',
      args: [],
    );
  }

  /// `Đăng ký JA`
  String get pdoneAction_registerCollaboratorsAndLink {
    return Intl.message(
      'Đăng ký JA',
      name: 'pdoneAction_registerCollaboratorsAndLink',
      desc: '',
      args: [],
    );
  }

  /// `Đăng ký V-Shop`
  String get pdoneAction_registerVShop {
    return Intl.message(
      'Đăng ký V-Shop',
      name: 'pdoneAction_registerVShop',
      desc: '',
      args: [],
    );
  }

  /// `Chưa có bài đăng nào`
  String get pDonePage_emptyDatalist_Tile {
    return Intl.message(
      'Chưa có bài đăng nào',
      name: 'pDonePage_emptyDatalist_Tile',
      desc: '',
      args: [],
    );
  }

  /// `Đăng bài để trang của bạn phong phú hơn!`
  String get pDonePage_emptyDatalist_Subtile {
    return Intl.message(
      'Đăng bài để trang của bạn phong phú hơn!',
      name: 'pDonePage_emptyDatalist_Subtile',
      desc: '',
      args: [],
    );
  }

  /// `Kết thêm bạn để thấy nhiều bài đăng hơn!`
  String get pDonePage_emptyDatalist_SubtileNoLogin {
    return Intl.message(
      'Kết thêm bạn để thấy nhiều bài đăng hơn!',
      name: 'pDonePage_emptyDatalist_SubtileNoLogin',
      desc: '',
      args: [],
    );
  }

  /// `Video thước phim thời lượng cần nhỏ hơn 45s.`
  String get createPost_limitFlimMessage {
    return Intl.message(
      'Video thước phim thời lượng cần nhỏ hơn 45s.',
      name: 'createPost_limitFlimMessage',
      desc: '',
      args: [],
    );
  }

  /// `------------`
  String get error_ {
    return Intl.message(
      '------------',
      name: 'error_',
      desc: '',
      args: [],
    );
  }

  /// `Tài khoản hoặc mật khẩu không đúng!`
  String get error_PHONE_OR_PASSWORD_NOT_MATCH {
    return Intl.message(
      'Tài khoản hoặc mật khẩu không đúng!',
      name: 'error_PHONE_OR_PASSWORD_NOT_MATCH',
      desc: '',
      args: [],
    );
  }

  /// `Tài khoản không tồn tại!`
  String get error_USER_NOT_FOUND {
    return Intl.message(
      'Tài khoản không tồn tại!',
      name: 'error_USER_NOT_FOUND',
      desc: '',
      args: [],
    );
  }

  /// `Hello World!`
  String get helloWorld {
    return Intl.message(
      'Hello World!',
      name: 'helloWorld',
      desc: 'The conventional newborn programmer greeting',
      args: [],
    );
  }

  /// `Cuộc gọi nhỡ`
  String get missedCall {
    return Intl.message(
      'Cuộc gọi nhỡ',
      name: 'missedCall',
      desc: '',
      args: [],
    );
  }

  /// `Cuộc gọi đi`
  String get outcomingCall {
    return Intl.message(
      'Cuộc gọi đi',
      name: 'outcomingCall',
      desc: '',
      args: [],
    );
  }

  /// `Cuộc gọi đến`
  String get incomingCall {
    return Intl.message(
      'Cuộc gọi đến',
      name: 'incomingCall',
      desc: '',
      args: [],
    );
  }

  /// `Lịch sử giao dịch`
  String get transactionHistory {
    return Intl.message(
      'Lịch sử giao dịch',
      name: 'transactionHistory',
      desc: '',
      args: [],
    );
  }

  /// `Chi tiết giao dịch`
  String get transactionHistoryDetail {
    return Intl.message(
      'Chi tiết giao dịch',
      name: 'transactionHistoryDetail',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'vi'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
