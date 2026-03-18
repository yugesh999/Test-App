// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../feature/auth/sign_in/entity/sign_in.dart';
// import '../constants/shared_prefs_constant.dart';
//
// saveSignInDataInSharedPref(SignIn data) async {
//   final pref = await SharedPreferences.getInstance();
//   final userSignInData = json.encode({
//     SharedConstants.token: data.accessToken,
//     SharedConstants.expiresIn: data.expiresIn,
//     SharedConstants.fullName: data.fullName,
//     SharedConstants.role: data.role,
//     SharedConstants.isProfileSet: data.isProfileSet,
//     SharedConstants.status: data.status,
//     SharedConstants.isGeneratedPassword: data.isGeneratedPassword,
//     SharedConstants.refreshToken: data.refreshToken,
//     SharedConstants.refreshTokenExpiry: data.refreshTokenExpiry,
//     SharedConstants.issuedTime: DateTime.now().millisecondsSinceEpoch,
//   });
//   pref.setString(SharedConstants.userAuthData, userSignInData);
// }
//
//
// getAccessToken() async {
//   var accessToken = "";
//   var pref = await SharedPreferences.getInstance();
//   var userData = pref.get(SharedConstants.userAuthData);
//   if (userData != null && userData != "") {
//     var data = json.decode(userData.toString());
//     accessToken = data[SharedConstants.token] ?? "";
//     return accessToken;
//   }
//   return "";
// }
//
// getRefreshToken() async {
//   var refreshToken = "";
//   final pref = await SharedPreferences.getInstance();
//   final userData = pref.getString(SharedConstants.userAuthData);
//   if (userData != null && userData.isNotEmpty) {
//     var data = json.decode(userData);
//     refreshToken = data[SharedConstants.refreshToken];
//     return refreshToken;
//   }
//   return "";
// }
//
// getUserRole() async {
//   var userRole = "";
//   final pref = await SharedPreferences.getInstance();
//   final userData = pref.getString(SharedConstants.userAuthData);
//   if (userData != null && userData.isNotEmpty) {
//     var data = json.decode(userData);
//     userRole = data[SharedConstants.role] ?? "";
//     return userRole;
//   }
//   return "";
// }
//
// clearAuthData() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   prefs.setString(SharedConstants.userAuthData, "");
// }
