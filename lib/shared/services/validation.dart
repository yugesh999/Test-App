import '../constants/regex_constants.dart';

bool validateEmail(String? value) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = RegExp(pattern);
  if (value == null || value.isEmpty || !regex.hasMatch(value)) {
    return false;
  } else {
    return true;
  }
}

bool validPassword(String password) {
  if (password.isEmpty) {
    return false;
  } else if (password.length < 8) {
    return false;
  } else if (password.length > 40) {
    return false;
  } else if (!validatePasswordStrength(password)) {
    return false;
  } else {
    return true;
  }
}

bool passwordMatches(String password, String confirmPassword) {
  if (password == confirmPassword) {
    return true;
  }
  return false;
}

bool nameValidation(String name) {
  if (name.length > 2) {
    return true;
  }
  return false;
}

bool textFieldLengthValidation(String name) {
  if (name.length > 2) {
    return true;
  }
  return false;
}

bool emptyFieldLengthValidation(String fieldName) {
  if (fieldName.isNotEmpty) {
    return true;
  }
  return false;
}

bool hasValidUrl(String value) {
  String pattern =
      r'(http|https)://[\w-]+(\.[\w-]+)+([\w.,@?^=%&amp;:/~+#-]*[\w@?^=%&amp;/~+#-])?';
  RegExp regExp = RegExp(pattern);

  if (!regExp.hasMatch(value)) {
    return false;
  }
  return true;
}

bool urlValidation(String link) {
  return Uri.tryParse(link)?.hasAbsolutePath ?? false;
}

bool isPhoneNumberValid(String phoneNumber) {
  if (phoneNumber.length == 10) {
    return true;
  }
  return false;
}

bool isPasswordValid(String password) {
  if (password.length > 7 && validatePasswordRegex(password)) {
    return true;
  }
  return false;
}

bool passwordRegexValidation(String password) {
  if (validatePasswordStrength(password)) {
    return true;
  }
  return false;
}

bool validatePasswordStrength(String value) {
  String pattern =
      r'^(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#\$&*~`)\%\-(_+=;:,.<>/?"[{\]}\|^]).{8,}$';
  RegExp regExp = RegExp(pattern);
  return regExp.hasMatch(value);
}

bool validatePasswordRegex(String value) {
  return value.length >= 7 &&
      RegexConstants.numberRegEx.hasMatch(value) &&
      RegexConstants.lowercaseRegEx.hasMatch(value) &&
      RegexConstants.uppercaseRegEx.hasMatch(value) &&
      RegexConstants.specialRegEx.hasMatch(value);
}
