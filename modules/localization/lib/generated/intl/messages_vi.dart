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

  static String m0(field) => "${field} không hợp lệ.";

  static String m1(field) => "vui lòng nhập ${field}.";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "by_vdone": MessageLookupByLibrary.simpleMessage("của VDONE"),
        "confirm": MessageLookupByLibrary.simpleMessage("Xác nhận"),
        "confirmation_code_has_been_sent":
            MessageLookupByLibrary.simpleMessage("Mã xác nhận đã được gửi "),
        "congratulations_on_your_successful_registration":
            MessageLookupByLibrary.simpleMessage(
                "Chúc mừng bạn đã đăng ký thành công"),
        "enter_the_verification_code":
            MessageLookupByLibrary.simpleMessage("Nhập mã xác minh"),
        "forgot_password":
            MessageLookupByLibrary.simpleMessage("Quên mật khẩu?"),
        "has_one_1_digit":
            MessageLookupByLibrary.simpleMessage("Có ít nhất 1 chữ số"),
        "lbl_Phone": MessageLookupByLibrary.simpleMessage("số điện thoại"),
        "lbl_continue": MessageLookupByLibrary.simpleMessage("Tiếp tục"),
        "lbl_password": MessageLookupByLibrary.simpleMessage("Mật khẩu"),
        "lbl_password_confirm":
            MessageLookupByLibrary.simpleMessage("Nhập lại mật khẩu"),
        "least_one_uppercase_character": MessageLookupByLibrary.simpleMessage(
            "Có ít nhất một ký tự viết hoa"),
        "login": MessageLookupByLibrary.simpleMessage("Đăng nhập"),
        "messages_login_fail":
            MessageLookupByLibrary.simpleMessage("Đăng nhập không thành công."),
        "messages_resend_otp_success":
            MessageLookupByLibrary.simpleMessage("Gửi lại OTP thành công."),
        "messages_server_internal_error":
            MessageLookupByLibrary.simpleMessage("lỗi hệ thống."),
        "minium_8_character":
            MessageLookupByLibrary.simpleMessage("Tối thiểu 8 ký tự"),
        "note_about_passwords":
            MessageLookupByLibrary.simpleMessage("Lưu ý về mật khẩu"),
        "phone_placeholder":
            MessageLookupByLibrary.simpleMessage("nhập số điện thoại"),
        "register": MessageLookupByLibrary.simpleMessage("Đăng ký"),
        "registration_is_consent_to": MessageLookupByLibrary.simpleMessage(
            "Bằng việc đăng ký là đồng ý với"),
        "resend": MessageLookupByLibrary.simpleMessage("Gửi lại"),
        "resend_the_code_later":
            MessageLookupByLibrary.simpleMessage("Gửi lại mã sau?"),
        "terms_of_service_and_policies": MessageLookupByLibrary.simpleMessage(
            "Điều khoản dịch vụ và Chính sách"),
        "validation_invalid": m0,
        "validation_password_match": MessageLookupByLibrary.simpleMessage(
            "Mật khẩu xác nhận không khớp"),
        "validation_required": m1,
        "wish_you_have_great_experiences_on_our_products":
            MessageLookupByLibrary.simpleMessage(
                "Chúc bạn có những trải nghiệm tuyệt vời trên sản phẩm của chúng tôi")
      };
}
