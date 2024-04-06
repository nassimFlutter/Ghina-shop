class Validate {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "E-mail is required";
    } else if (!value.contains('@')) {
      return "E-mail must contains @";
    } else {
      final atIndex = value.indexOf('@');
      if (atIndex == value.length - 1) {
        return "E-mail must be\n a valid email address";
      }
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return "phone is required";
    } else if (value.length < 8) {
      return "The Mobile must be between 8\n and 15 digits";
    }
    return null;
  }

  static String? validateFullName(String? value) {
    if (value == null || value.isEmpty) {
      return "Full name is required";
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    } else if (value.length < 6) {
      return "The Password must be\n at least 6 characters.";
    }
    return null;
  }

  static String? validateFailed(String? value, String? title) {
    if (value == null || value.isEmpty) {
      return "$title is required";
    }
    return null;
  }

  static String? validateConfirmPassword(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return "Confirm password is required";
    } else if (value != password) {
      return "Passwords do not match";
    }
    return null;
  }
}
