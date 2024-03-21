class Validate {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "E-mail is required";
    } else if (value.contains('@')) {
      return "E-mail must contains @";
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return "phone is required";
    }
    return null;
  }
}
