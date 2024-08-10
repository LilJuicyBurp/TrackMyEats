class Validator {
  static bool isEmail(String? email) {
    if (email != null) {
      return RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(email);
    }
    return false;
  }

  static bool isStringNull(String? value) {
    if (value != null && value != "") {
      return true;
    }
    return false;
  }
}
