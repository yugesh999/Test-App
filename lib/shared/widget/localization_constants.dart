import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../main.dart';
import 'demolocalization.dart';

const String langCode = 'languageCode';

//languages code
const String english = 'en';

setLocale(context, String languageCode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(langCode, languageCode);
  MyApp.setLocale(context,const Locale(english, 'US'));
}

Future<String> getLocale() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String languageCode = _prefs.getString(langCode) ?? "en";
  return languageCode;
}

String? getTranslated(BuildContext context, String key) {
  return DemoLocalization.of(context)!.translate(key);
}


