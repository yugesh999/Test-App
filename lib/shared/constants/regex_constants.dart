class RegexConstants {
  static RegExp numberRegEx = RegExp(r'^(?=.*[0-9])');
  static RegExp specialRegEx = RegExp(r'^(?=.*[!@#\$&*~])');
  static RegExp uppercaseRegEx =  RegExp(r'^(?=.*[A-Z])');
  static RegExp lowercaseRegEx = RegExp(r'^(?=.*[a-z])');

}
