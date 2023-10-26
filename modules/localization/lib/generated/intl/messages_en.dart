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

  static String m0(field) => "${field} invalid.";

  static String m1(field) => "${field} is required.";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "has_one_1_digit":
            MessageLookupByLibrary.simpleMessage("Has at least 1 digit"),
        "lbl_Phone": MessageLookupByLibrary.simpleMessage("phone number"),
        "lbl_password": MessageLookupByLibrary.simpleMessage("password"),
        "lbl_password_confirm":
            MessageLookupByLibrary.simpleMessage("Password Confirm"),
        "least_one_uppercase_character": MessageLookupByLibrary.simpleMessage(
            "Contains at least one uppercase character"),
        "messages_login_fail":
            MessageLookupByLibrary.simpleMessage("Login failed."),
        "messages_resend_otp_success":
            MessageLookupByLibrary.simpleMessage("Resend OTP success."),
        "messages_server_internal_error":
            MessageLookupByLibrary.simpleMessage("server internal error"),
        "minium_8_character":
            MessageLookupByLibrary.simpleMessage("Minimum of 8 characters"),
        "phone_placeholder":
            MessageLookupByLibrary.simpleMessage("enter phone number"),
        "validation_invalid": m0,
        "validation_password_match":
            MessageLookupByLibrary.simpleMessage("Password confirm not match"),
        "validation_required": m1
      };
}
