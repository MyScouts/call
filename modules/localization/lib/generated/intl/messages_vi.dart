// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a vi locale. All the
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
  String get localeName => 'vi';

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
        "cta_Accept": MessageLookupByLibrary.simpleMessage("Xác nhận"),
        "cta_Add": MessageLookupByLibrary.simpleMessage("VI - Add"),
        "cta_Cancel": MessageLookupByLibrary.simpleMessage("Huỷ"),
        "cta_Checkout": MessageLookupByLibrary.simpleMessage("VI - Check out"),
        "cta_Decline": MessageLookupByLibrary.simpleMessage("VI - Decline"),
        "cta_No": MessageLookupByLibrary.simpleMessage("VI - No"),
        "cta_Open": MessageLookupByLibrary.simpleMessage("VI - Open"),
        "cta_Reschedule":
            MessageLookupByLibrary.simpleMessage("VI - Reschedule"),
        "cta_Save": MessageLookupByLibrary.simpleMessage("VI - Save"),
        "cta_Yes": MessageLookupByLibrary.simpleMessage("VI - Yes"),
        "dashboard_TabExplore":
            MessageLookupByLibrary.simpleMessage("Khám phá"),
        "dashboard_TabLive": MessageLookupByLibrary.simpleMessage("Live"),
        "dashboard_TabNews": MessageLookupByLibrary.simpleMessage("News"),
        "dashboard_TabPDone": MessageLookupByLibrary.simpleMessage("P-Done"),
        "error_PHONE_OR_PASSWORD_NOT_MATCH":
            MessageLookupByLibrary.simpleMessage(
                "Tài khoản hoặc mật khẩu không đúng!"),
        "error_USER_NOT_FOUND":
            MessageLookupByLibrary.simpleMessage("Tài khoản không tồn tại!"),
        "formatDateDDmmYYYY": m0,
        "formatDateDDmmYYYYhhMM": m1,
        "formatPrice": m2,
        "formatPriceShort": m3,
        "helloWorld": MessageLookupByLibrary.simpleMessage("Xin Chào!"),
        "incomingCall": MessageLookupByLibrary.simpleMessage("Cuộc gọi đến"),
        "lblAddress_City": MessageLookupByLibrary.simpleMessage("VI - City"),
        "lblAddress_State": MessageLookupByLibrary.simpleMessage("VI - State"),
        "lblAddress_StateOrCity":
            MessageLookupByLibrary.simpleMessage("VI - State/city (optional)"),
        "lblAddress_StreetName":
            MessageLookupByLibrary.simpleMessage("VI - Street name"),
        "lblAddress_StreetNumber":
            MessageLookupByLibrary.simpleMessage("VI - Street number"),
        "lblAddress_Suite": MessageLookupByLibrary.simpleMessage("VI - Suite"),
        "lblAddress_ZipCode":
            MessageLookupByLibrary.simpleMessage("VI - Zip code"),
        "lblUser_CoverPhoto":
            MessageLookupByLibrary.simpleMessage("VI - Cover photo"),
        "lblUser_DayOfBirth":
            MessageLookupByLibrary.simpleMessage("VI - Day of birth"),
        "lblUser_Email": MessageLookupByLibrary.simpleMessage("VI - Email"),
        "lblUser_FirstName":
            MessageLookupByLibrary.simpleMessage("VI - First name"),
        "lblUser_GeneralInfo":
            MessageLookupByLibrary.simpleMessage("VI - General information"),
        "lblUser_LastName":
            MessageLookupByLibrary.simpleMessage("VI - Last name"),
        "lblUser_Password":
            MessageLookupByLibrary.simpleMessage("VI - Password"),
        "lblUser_PhoneNumber":
            MessageLookupByLibrary.simpleMessage("VI - Phone number"),
        "lblUser_PreferNotToAnswer":
            MessageLookupByLibrary.simpleMessage("VI - Prefer not to answer"),
        "lblUser_ProfilePicture":
            MessageLookupByLibrary.simpleMessage("VI - Profile picture"),
        "lblUser_RetypePassword":
            MessageLookupByLibrary.simpleMessage("VI - Re-type Password"),
        "lbl_Address": MessageLookupByLibrary.simpleMessage("VI - Address"),
        "lbl_Allergist": MessageLookupByLibrary.simpleMessage("VI - Allergist"),
        "lbl_Camera": MessageLookupByLibrary.simpleMessage("Máy ảnh"),
        "lbl_Close": MessageLookupByLibrary.simpleMessage("Đóng"),
        "lbl_Confirm": MessageLookupByLibrary.simpleMessage("Xác nhận"),
        "lbl_Continue": MessageLookupByLibrary.simpleMessage("Tiếp theo"),
        "lbl_Email": MessageLookupByLibrary.simpleMessage("Email"),
        "lbl_Female": MessageLookupByLibrary.simpleMessage("VI - Female"),
        "lbl_File": MessageLookupByLibrary.simpleMessage("Tệp"),
        "lbl_Find": MessageLookupByLibrary.simpleMessage("VI - Find"),
        "lbl_Gallery": MessageLookupByLibrary.simpleMessage("Bộ sưu tập ảnh"),
        "lbl_Login": MessageLookupByLibrary.simpleMessage("Đăng nhập"),
        "lbl_Male": MessageLookupByLibrary.simpleMessage("VI - Male"),
        "lbl_Message": MessageLookupByLibrary.simpleMessage("VI - Message"),
        "lbl_Next": MessageLookupByLibrary.simpleMessage("VI - Next"),
        "lbl_NotFoundData":
            MessageLookupByLibrary.simpleMessage("VI - Not found data!"),
        "lbl_Other": MessageLookupByLibrary.simpleMessage("VI - Other"),
        "lbl_Phone": MessageLookupByLibrary.simpleMessage("Số điện thoại"),
        "lbl_Primary": MessageLookupByLibrary.simpleMessage("VI - Primary"),
        "lbl_Register": MessageLookupByLibrary.simpleMessage("Đăng ký"),
        "lbl_SavePhoto": MessageLookupByLibrary.simpleMessage("Lưu Ảnh"),
        "lbl_Secondary": MessageLookupByLibrary.simpleMessage("VI - Secondary"),
        "lbl_Terms": MessageLookupByLibrary.simpleMessage(
            "VI - I agree with VDONE Terms of Use"),
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
        "signIn_Submit": MessageLookupByLibrary.simpleMessage("VI - Sign in"),
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
            MessageLookupByLibrary.simpleMessage("Gửi lại mã thành công."),
        "verifyOtp_subtitle": m5,
        "verifyOtp_title": m6
      };
}
