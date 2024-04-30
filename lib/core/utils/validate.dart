import 'package:best_price/generated/l10n.dart';

class Validate {
  // todo : finish translates
  static String? validateEmail(context, String? value) {
    if (value == null || value.isEmpty) {
      return S.of(context).email_required_validation; //"E-mail is required";
    } else if (!value.contains('@')) {
      return S.of(context).email_contain_validation; //"E-mail must contains @";
    } else {
      final atIndex = value.indexOf('@');
      if (atIndex == value.length - 1) {
        return S
            .of(context)
            .email_address_validation; //"E-mail must be\n a valid email address";
      }
    }
    return null;
  }

  static String? validatePhoneNumber(context, String? value) {
    if (value == null || value.isEmpty) {
      return S.of(context).phone_required_validation; //"phone is required";
    } else if (value.length < 8) {
      return S
          .of(context)
          .phone_length_validation; //"The Mobile must be between 8\n and 15 digits";
    }
    return null;
  }

  static String? validateFullName(context, String? value) {
    if (value == null || value.isEmpty) {
      return S.of(context).name_required_validation; // "Full name is required";
    }
    return null;
  }

  static String? validatePassword(context, String? value) {
    if (value == null || value.isEmpty) {
      return S
          .of(context)
          .password_required_validation; //"Password is required";
    } else if (value.length < 6) {
      return S
          .of(context)
          .password_length_validation; //"The Password must be\n at least 6 characters.";
    }
    return null;
  }

  static String? validateFailed(context, String? value) {
    if (value == null || value.isEmpty) {
      return S.of(context).this_required_validations; //"this is required";
    }
    return null;
  }

  static String? validateConfirmPassword(
      context, String? value, String? password) {
    if (value == null || value.isEmpty) {
      return S
          .of(context)
          .password_confirm_validation; //"Confirm password is required";
    } else if (value != password) {
      return S.of(context).passwords_do_not_match; //"Passwords do not match";
    }
    return null;
  }
}
