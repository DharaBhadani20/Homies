class Validators {
  //For Email Verification we using RegEx.
  static String validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value == null || value.length <= 0) {
      return "Email is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Email Formate is Invalid";
    } else {
      return null;
    }
  }

//For Password validation
  static String validatePassword(String value) {
    String pattern =
        r'^.*(?=.{8,})((?=.*[!@#$%^&*()\-_=+{};:,<.>]){1})(?=.*\d)((?=.*[a-z]){1})((?=.*[A-Z]){1}).*$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Password is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Minimum 8 characters password required with a combination of\nuppercase and lowercase letter and number are required.";
    } else {
      return null;
    }
  }
}
