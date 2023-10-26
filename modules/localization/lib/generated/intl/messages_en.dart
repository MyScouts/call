// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(date, time) => "${date} | ${time} ";

  static String m1(date, time) => "${date} | ${time} ";

  static String m2(value) => "${value}";

  static String m3(value) => "${value}";

  static String m4(passWordMinCharacter) =>
      "Mật khẩu phải có ít nhất ${passWordMinCharacter} ký tự";

  static String m5(type) =>
      "Xin vui lòng nhập mã OTP vừa được gửi tới ${type}:";

  static String m6(type) => "Xác thực tài khoản qua ${type}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "auth_forgotPassword":
            MessageLookupByLibrary.simpleMessage("Quên mật khẩu"),
        "auth_forgotPasswordEnterNewPassDescription":
            MessageLookupByLibrary.simpleMessage(
                "Vui lòng nhập mật khẩu mới cho tài khoản"),
        "auth_forgotPasswordEnterNewPassTitle":
            MessageLookupByLibrary.simpleMessage("Đổi mật khẩu"),
        "auth_forgotPasswordSubtitle": MessageLookupByLibrary.simpleMessage(
            "Nhập email hoặc số điện thoại đã đăng ký tài khoản"),
        "auth_subdescription": MessageLookupByLibrary.simpleMessage(
            "Để trải nghiệm ứng dụng tốt hơn"),
        "community_charity":
            MessageLookupByLibrary.simpleMessage("Từ thiện cộng đồng"),
        "community_group":
            MessageLookupByLibrary.simpleMessage("Nhóm cộng đồng"),
        "community_survey":
            MessageLookupByLibrary.simpleMessage("Khảo sát cộng đồng"),
        "community_training":
            MessageLookupByLibrary.simpleMessage("Đào tạo cộng đồng"),
        "createPost_limitFlimMessage": MessageLookupByLibrary.simpleMessage(
            "Video thước phim thời lượng cần nhỏ hơn 45s."),
        "cta_Accept": MessageLookupByLibrary.simpleMessage("Accept"),
        "cta_Add": MessageLookupByLibrary.simpleMessage("Add"),
        "cta_Cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "cta_Checkout": MessageLookupByLibrary.simpleMessage("Check out"),
        "cta_Decline": MessageLookupByLibrary.simpleMessage("Decline"),
        "cta_No": MessageLookupByLibrary.simpleMessage("No"),
        "cta_Open": MessageLookupByLibrary.simpleMessage("Open"),
        "cta_Reschedule": MessageLookupByLibrary.simpleMessage("Reschedule"),
        "cta_Save": MessageLookupByLibrary.simpleMessage("Save"),
        "cta_Yes": MessageLookupByLibrary.simpleMessage("Yes"),
        "dashboard_TabExplore": MessageLookupByLibrary.simpleMessage("Explore"),
        "dashboard_TabLive": MessageLookupByLibrary.simpleMessage("Live"),
        "dashboard_TabNews": MessageLookupByLibrary.simpleMessage("News"),
        "dashboard_TabPDone": MessageLookupByLibrary.simpleMessage("P-Done"),
        "error_": MessageLookupByLibrary.simpleMessage("------------"),
        "error_PHONE_OR_PASSWORD_NOT_MATCH":
            MessageLookupByLibrary.simpleMessage(
                "Tài khoản hoặc mật khẩu không đúng!"),
        "error_USER_NOT_FOUND":
            MessageLookupByLibrary.simpleMessage("Tài khoản không tồn tại!"),
        "formatDateDDmmYYYY": m0,
        "formatDateDDmmYYYYhhMM": m1,
        "formatPrice": m2,
        "formatPriceShort": m3,
        "helloWorld": MessageLookupByLibrary.simpleMessage("Hello World!"),
        "incomingCall": MessageLookupByLibrary.simpleMessage("Cuộc gọi đến"),
        "lblAddress_City": MessageLookupByLibrary.simpleMessage("City"),
        "lblAddress_State": MessageLookupByLibrary.simpleMessage("State"),
        "lblAddress_StateOrCity":
            MessageLookupByLibrary.simpleMessage("State/city (optional)"),
        "lblAddress_StreetName":
            MessageLookupByLibrary.simpleMessage("Street name"),
        "lblAddress_StreetNumber":
            MessageLookupByLibrary.simpleMessage("Street number"),
        "lblAddress_Suite": MessageLookupByLibrary.simpleMessage("Suite"),
        "lblAddress_ZipCode": MessageLookupByLibrary.simpleMessage("Zip code"),
        "lblUser_CoverPhoto":
            MessageLookupByLibrary.simpleMessage("Cover photo"),
        "lblUser_DayOfBirth":
            MessageLookupByLibrary.simpleMessage("Day of birth"),
        "lblUser_Email": MessageLookupByLibrary.simpleMessage("Email"),
        "lblUser_FirstName": MessageLookupByLibrary.simpleMessage("First name"),
        "lblUser_GeneralInfo":
            MessageLookupByLibrary.simpleMessage("General information"),
        "lblUser_LastName": MessageLookupByLibrary.simpleMessage("Last name"),
        "lblUser_Password": MessageLookupByLibrary.simpleMessage("Password"),
        "lblUser_PhoneNumber":
            MessageLookupByLibrary.simpleMessage("Phone number"),
        "lblUser_PreferNotToAnswer":
            MessageLookupByLibrary.simpleMessage("Prefer not to answer"),
        "lblUser_ProfilePicture":
            MessageLookupByLibrary.simpleMessage("Profile picture"),
        "lblUser_RetypePassword":
            MessageLookupByLibrary.simpleMessage("Re-type Password"),
        "lbl_Address": MessageLookupByLibrary.simpleMessage("Address"),
        "lbl_Allergist": MessageLookupByLibrary.simpleMessage("Allergist"),
        "lbl_Camera": MessageLookupByLibrary.simpleMessage("Camera"),
        "lbl_Close": MessageLookupByLibrary.simpleMessage("Close"),
        "lbl_Confirm": MessageLookupByLibrary.simpleMessage("Xác nhận"),
        "lbl_Continue": MessageLookupByLibrary.simpleMessage("Tiếp theo"),
        "lbl_Email": MessageLookupByLibrary.simpleMessage("Email"),
        "lbl_Female": MessageLookupByLibrary.simpleMessage("Female"),
        "lbl_File": MessageLookupByLibrary.simpleMessage("File"),
        "lbl_Find": MessageLookupByLibrary.simpleMessage("Find"),
        "lbl_Gallery": MessageLookupByLibrary.simpleMessage("Gallery"),
        "lbl_Login": MessageLookupByLibrary.simpleMessage("Đăng nhập"),
        "lbl_Male": MessageLookupByLibrary.simpleMessage("Male"),
        "lbl_Message": MessageLookupByLibrary.simpleMessage("Message"),
        "lbl_Next": MessageLookupByLibrary.simpleMessage("Next"),
        "lbl_NotFoundData":
            MessageLookupByLibrary.simpleMessage("Not found data!"),
        "lbl_Other": MessageLookupByLibrary.simpleMessage("Other"),
        "lbl_Phone": MessageLookupByLibrary.simpleMessage("Số điện thoại"),
        "lbl_Primary": MessageLookupByLibrary.simpleMessage("Primary"),
        "lbl_Register": MessageLookupByLibrary.simpleMessage("Đăng ký"),
        "lbl_SavePhoto": MessageLookupByLibrary.simpleMessage("Save Photo"),
        "lbl_Secondary": MessageLookupByLibrary.simpleMessage("Secondary"),
        "lbl_Terms": MessageLookupByLibrary.simpleMessage(
            "I agree with VDONE Terms of Use"),
        "missedCall": MessageLookupByLibrary.simpleMessage("Cuộc gọi nhỡ"),
        "outcomingCall": MessageLookupByLibrary.simpleMessage("Cuộc gọi đi"),
        "pDonePage_emptyDatalist_Subtile": MessageLookupByLibrary.simpleMessage(
            "Đăng bài để trang của bạn phong phú hơn!"),
        "pDonePage_emptyDatalist_SubtileNoLogin":
            MessageLookupByLibrary.simpleMessage(
                "Kết thêm bạn để thấy nhiều bài đăng hơn!"),
        "pDonePage_emptyDatalist_Tile":
            MessageLookupByLibrary.simpleMessage("Chưa có bài đăng nào"),
        "pdoneAction_registerCollaboratorsAndLink":
            MessageLookupByLibrary.simpleMessage("Đăng ký JA"),
        "pdoneAction_registerPDone":
            MessageLookupByLibrary.simpleMessage("Đăng ký P-Done"),
        "pdoneAction_registerVShop":
            MessageLookupByLibrary.simpleMessage("Đăng ký V-Shop"),
        "signIn_Submit": MessageLookupByLibrary.simpleMessage("Sign in"),
        "transactionHistory":
            MessageLookupByLibrary.simpleMessage("Lịch sử giao dịch"),
        "transactionHistoryDetail":
            MessageLookupByLibrary.simpleMessage("Chi tiết giao dịch"),
        "validate_PasswordFormat": MessageLookupByLibrary.simpleMessage(
            "Mật khẩu phải bao gồm chữ hoa, chữ thường, số, ký tự đặc biệt"),
        "validate_PasswordMustLeastNumCharacter": m4,
        "validate_PleaseEnterAccountInfo": MessageLookupByLibrary.simpleMessage(
            "Vui lòng nhập thông tin tài khoản"),
        "validate_PleaseEnterCorrectEmail":
            MessageLookupByLibrary.simpleMessage("Vui lòng nhập đúng email"),
        "validate_PleaseEnterCorrectPhone":
            MessageLookupByLibrary.simpleMessage(
                "Vui lòng nhập đúng số điện thoại"),
        "validate_PleaseEnterEmail":
            MessageLookupByLibrary.simpleMessage("Vui lòng nhập email"),
        "validate_PleaseEnterEmailOrPhone":
            MessageLookupByLibrary.simpleMessage(
                "Vui lòng nhập email hoặc số điện thoại"),
        "validate_PleaseEnterInfo":
            MessageLookupByLibrary.simpleMessage("Vui lòng nhập thông tin"),
        "validate_PleaseEnterPassword":
            MessageLookupByLibrary.simpleMessage("Vui lòng nhập mật khẩu"),
        "validate_PleaseEnterPhone":
            MessageLookupByLibrary.simpleMessage("Vui lòng nhập số điện thoại"),
        "validate_PleaseEnterUsername":
            MessageLookupByLibrary.simpleMessage("Vui lòng nhập tên đăng nhập"),
        "validate_PleaseSelectFile": MessageLookupByLibrary.simpleMessage(
            "Vui lòng chọn tập tin trước khi tiếp tục"),
        "validate_UsernameMustLeast4Character":
            MessageLookupByLibrary.simpleMessage(
                "Tên đăng nhập phải có ít nhất 4 ký tự"),
        "validate_WrongFormat":
            MessageLookupByLibrary.simpleMessage("Sai định dạng"),
        "verifyOtp_resendSuccess":
            MessageLookupByLibrary.simpleMessage("Gửi lại mãi thành công."),
        "verifyOtp_subtitle": m5,
        "verifyOtp_title": m6
      };
}
