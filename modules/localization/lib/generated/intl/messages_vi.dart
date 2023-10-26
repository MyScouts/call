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
        "has_one_1_digit":
            MessageLookupByLibrary.simpleMessage("Có ít nhất 1 chữ số"),
        "lbl_Phone": MessageLookupByLibrary.simpleMessage("số điện thoại"),
        "lbl_password": MessageLookupByLibrary.simpleMessage("Mật khẩu"),
        "lbl_password_confirm":
            MessageLookupByLibrary.simpleMessage("Nhập lại mật khẩu"),
        "least_one_uppercase_character": MessageLookupByLibrary.simpleMessage(
            "Có ít nhất một ký tự viết hoa"),
        "messages_login_fail":
            MessageLookupByLibrary.simpleMessage("Đăng nhập không thành công."),
        "messages_resend_otp_success":
            MessageLookupByLibrary.simpleMessage("Gửi lại OTP thành công."),
        "messages_server_internal_error":
            MessageLookupByLibrary.simpleMessage("lỗi hệ thống."),
        "minium_8_character":
            MessageLookupByLibrary.simpleMessage("Tối thiểu 8 ký tự"),
        "phone_placeholder":
            MessageLookupByLibrary.simpleMessage("nhập số điện thoại"),
        "validation_invalid": m0,
        "validation_password_match": MessageLookupByLibrary.simpleMessage(
            "Mật khẩu xác nhận không khớp"),
        "validation_required": m1
      };
}
