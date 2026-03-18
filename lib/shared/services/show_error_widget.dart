import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../main.dart';
import '../constants/shared_prefs_constant.dart';
import '../widget/api_response_bottom_sheet.dart';
import '../widget/localization_constants.dart';

Widget showErrorMessage(
  String? message,
  BuildContext context, {
  String type = "",
}) {
  Future.delayed(const Duration(milliseconds: 100), () {
    if (message != null && message.isNotEmpty) {
      return type != "auth"
          ? showMessageBottomSheet(
            "error",
            getTranslated(context, "error") ?? "",
            message,
          )
          : showDialog<void>(
            context: context,
            barrierDismissible: false, // user must tap button!
            builder: (BuildContext context) {
              return AlertDialog(
                title:
                    type == "" || type == "auth"
                        ? Text(getTranslated(context, "error") ?? "")
                        : Text(getTranslated(context, "success") ?? ""),
                content: SingleChildScrollView(child: Text(message)),
                actions: <Widget>[
                  Builder(
                    builder: (BuildContext outerContext) {
                      return TextButton(
                        child: Text(getTranslated(context, "ok") ?? ""),
                        onPressed: () async {
                          Navigator.of(context).pop();
                          if (type == "auth") {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            prefs.setString(SharedConstants.userAuthData, "");
                            Navigator.of(
                              context,
                            ).popUntil((route) => route.isFirst);
                            // Navigator.of(
                            //   context,
                            // ).pushReplacementNamed(SignInScreen.routeName);
                          }
                        },
                      );
                    },
                  ),
                ],
              );
            },
          );
    }
  });

  return const SizedBox.shrink();
}

Widget showSuccessPasswordChange(
  String? message,
  BuildContext context,
  String email,
) {
  Future.delayed(const Duration(milliseconds: 100), () {
    if (message != null && message.isNotEmpty) {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Success"),
            content: SingleChildScrollView(child: Text(message)),
            actions: <Widget>[
              Builder(
                builder: (BuildContext outerContext) {
                  return TextButton(
                    child: const Text("OK"),
                    onPressed: () {
                      // Navigator.of(context).pushReplacementNamed(
                      //     ResetPasswordScreen.routeName,
                      //     arguments: ResetPasswordScreen(email: email));
                    },
                  );
                },
              ),
            ],
          );
        },
      );
    }
  });

  return const SizedBox.shrink();
}

showMessageBottomSheet(String type, String title, String message) async {
  Future.delayed(const Duration(seconds: 2)).then((value) {
    Navigator.of(navigatorKey.currentContext!).pop();
  });
  await showModalBottomSheet(
    isScrollControlled: true,
    context: navigatorKey.currentContext!,
    isDismissible: false,
    enableDrag: false,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return ResponseBottomSheet(
        type: type,
        title: title,
        message: message,
        crossFunction: () {
          Navigator.of(context).pop();
        },
      );
    },
  );
}

Widget showSuccessMessage(
  String? message,
  BuildContext context,
  Function() ok,
) {
  Future.delayed(const Duration(milliseconds: 100), () {
    if (message != null && message.isNotEmpty) {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Success"),
            content: SingleChildScrollView(child: Text(message)),
            actions: <Widget>[
              Builder(
                builder: (BuildContext outerContext) {
                  return TextButton(
                    child: const Text("OK"),
                    onPressed: () {
                      Navigator.of(context).pop();
                      ok();
                    },
                  );
                },
              ),
            ],
          );
        },
      );
    }
  });

  return const SizedBox.shrink();
}
