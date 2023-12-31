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

  static String m1(field) => "${field} invalid.";

  static String m2(field) => "${field} is required.";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "account_profile":
            MessageLookupByLibrary.simpleMessage("Account profile"),
        "by_vdone": MessageLookupByLibrary.simpleMessage("by VDONE"),
        "community": MessageLookupByLibrary.simpleMessage("Cộng đồng"),
        "community_charity":
            MessageLookupByLibrary.simpleMessage("Từ thiện cộng đồng"),
        "community_group":
            MessageLookupByLibrary.simpleMessage("Nhóm cộng đồng"),
        "community_survey":
            MessageLookupByLibrary.simpleMessage("Khảo sát cộng đồng"),
        "community_training":
            MessageLookupByLibrary.simpleMessage("Đào tạo cộng đồng"),
        "confirm": MessageLookupByLibrary.simpleMessage("Confirm"),
        "confirmation_code_has_been_sent": MessageLookupByLibrary.simpleMessage(
            "Confirmation code has been sent"),
        "congratulations_on_your_successful_registration":
            MessageLookupByLibrary.simpleMessage(
                "Congratulations, you have successfully registered!"),
        "enter_the_verification_code":
            MessageLookupByLibrary.simpleMessage("Enter the verification code"),
        "forgot_password":
            MessageLookupByLibrary.simpleMessage("Forgot password?"),
        "formatDateDDmmYYYYhhMM": m0,
        "gift": MessageLookupByLibrary.simpleMessage("Gift"),
        "gift_hint": MessageLookupByLibrary.simpleMessage(
            "Cổ vũ cho chủ phòng để tăng exp"),
        "has_one_1_digit":
            MessageLookupByLibrary.simpleMessage("Has at least 1 digit"),
        "latest": MessageLookupByLibrary.simpleMessage("Mới nhất"),
        "lbl_Camera": MessageLookupByLibrary.simpleMessage("Camera"),
        "lbl_File": MessageLookupByLibrary.simpleMessage("File"),
        "lbl_Gallery": MessageLookupByLibrary.simpleMessage("Gallery"),
        "lbl_Phone": MessageLookupByLibrary.simpleMessage("phone number"),
        "lbl_continue": MessageLookupByLibrary.simpleMessage("Continue"),
        "lbl_password": MessageLookupByLibrary.simpleMessage("password"),
        "lbl_password_confirm":
            MessageLookupByLibrary.simpleMessage("Password Confirm"),
        "least_one_uppercase_character": MessageLookupByLibrary.simpleMessage(
            "Contains at least one uppercase character"),
        "live": MessageLookupByLibrary.simpleMessage("Live"),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "marShop": MessageLookupByLibrary.simpleMessage("MarShop"),
        "message_otp_not_match":
            MessageLookupByLibrary.simpleMessage("OTP invalid."),
        "message_password_invalid":
            MessageLookupByLibrary.simpleMessage("password invalid."),
        "message_register_fail":
            MessageLookupByLibrary.simpleMessage("register fail."),
        "message_user_exits":
            MessageLookupByLibrary.simpleMessage("User exits"),
        "message_user_not_found":
            MessageLookupByLibrary.simpleMessage("User not found."),
        "messages_invalid_login_information":
            MessageLookupByLibrary.simpleMessage("Invalid login information."),
        "messages_login_fail":
            MessageLookupByLibrary.simpleMessage("Login failed."),
        "messages_resend_otp_fail":
            MessageLookupByLibrary.simpleMessage("resend OTP fail."),
        "messages_resend_otp_success":
            MessageLookupByLibrary.simpleMessage("Resend OTP success."),
        "messages_server_internal_error":
            MessageLookupByLibrary.simpleMessage("server internal error"),
        "minium_8_character":
            MessageLookupByLibrary.simpleMessage("Minimum of 8 characters"),
        "note_about_passwords":
            MessageLookupByLibrary.simpleMessage("Note about passwords"),
        "pdoneAction_registerCollaboratorsAndLink":
            MessageLookupByLibrary.simpleMessage("Register JA"),
        "pdoneAction_registerPDone":
            MessageLookupByLibrary.simpleMessage("Register P-Done"),
        "pdoneAction_registerVShop":
            MessageLookupByLibrary.simpleMessage("Đăng ký V-Shop"),
        "phone_placeholder":
            MessageLookupByLibrary.simpleMessage("enter phone number"),
        "popular": MessageLookupByLibrary.simpleMessage("Phổ biến"),
        "register": MessageLookupByLibrary.simpleMessage("Register"),
        "registration_is_consent_to":
            MessageLookupByLibrary.simpleMessage("Registration is consent to"),
        "resend": MessageLookupByLibrary.simpleMessage("Resend"),
        "resend_the_code_later":
            MessageLookupByLibrary.simpleMessage("Resend the code later?"),
        "search": MessageLookupByLibrary.simpleMessage("search"),
        "setting": MessageLookupByLibrary.simpleMessage("setting"),
        "terms_of_service_and_policies": MessageLookupByLibrary.simpleMessage(
            "terms_of_service_and_policies"),
        "tv_live": MessageLookupByLibrary.simpleMessage("TV Live"),
        "validate_PleaseEnterInfo":
            MessageLookupByLibrary.simpleMessage("Please enter info"),
        "validation_invalid": m1,
        "validation_password_match":
            MessageLookupByLibrary.simpleMessage("Password confirm not match"),
        "validation_required": m2,
        "vip": MessageLookupByLibrary.simpleMessage("VIP"),
        "vote": MessageLookupByLibrary.simpleMessage("Vote"),
        "wish_you_have_great_experiences_on_our_products":
            MessageLookupByLibrary.simpleMessage(
                "Wish you have great experiences on our products")
      };
}
