import 'package:demo_project/shared/constants/fonts/font_constants.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../main.dart';
import '../text_widgets/build_text.dart';
import '../widget/localization_constants.dart';
import 'device_size_service.dart';

class PermissionService {
  requestCameraPermission() async {
    bool hasPermission = false;
    Map<Permission, PermissionStatus> statuses;
    statuses = await [
      Permission.camera,
    ].request();
    if (Platform.isIOS) {
      if (statuses[Permission.camera]!.isGranted) {
        hasPermission = true;
        return hasPermission;
      } else if (statuses[Permission.camera]!.isDenied ||
          statuses[Permission.camera]!.isPermanentlyDenied) {
        var permission = await Permission.camera.request();
        if (permission.isDenied || permission.isPermanentlyDenied) {
          showAppSettings(
              navigatorKey.currentContext!,
              getTranslated(navigatorKey.currentContext!, "cameraPermission") ??
                  "",
              "camera");
        }
      }
    } else if (Platform.isAndroid) {
      if (statuses[Permission.camera]!.isGranted) {
        hasPermission = true;
      } else if ((statuses[Permission.camera]!.isDenied ||
          statuses[Permission.camera]!.isPermanentlyDenied)) {
        var permission = await Permission.camera.request();
        if (permission.isDenied || permission.isPermanentlyDenied) {
          showAppSettings(
              navigatorKey.currentContext!,
              getTranslated(navigatorKey.currentContext!, "cameraPermission") ??
                  "",
              "camera");
        }
      }
    }
    return hasPermission;
  }

  Future<bool> requestStoragePermission() async {
    bool hasPermission = false;
    Map<Permission, PermissionStatus> statuses;
    if (Platform.isAndroid) {
      statuses = await [Permission.storage, Permission.photos].request();
    } else {
      statuses = await [
        Permission.photos,
      ].request();
    }
    if (Platform.isIOS) {
      if (statuses[Permission.photos]!.isGranted ||
          statuses[Permission.photos]!.isLimited) {
        hasPermission = true;
      } else {
        if (statuses[Permission.photos]!.isPermanentlyDenied) {
          hasPermission = false;
          showAppSettings(
              navigatorKey.currentContext!,
              getTranslated(
                      navigatorKey.currentContext!, "storagePermission") ??
                  "",
              "storage");
        }
      }
    } else if (Platform.isAndroid) {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      if (androidInfo.version.sdkInt >= 33) {
        if (statuses[Permission.photos]!.isDenied ||
            statuses[Permission.photos]!.isPermanentlyDenied) {
          var permission = await Permission.photos.request();

          if (permission.isDenied || permission.isPermanentlyDenied) {
            hasPermission = false;

            showAppSettings(
                navigatorKey.currentContext!,
                getTranslated(
                        navigatorKey.currentContext!, "storagePermission") ??
                    "",
                "storage");
          }
        } else {
          hasPermission = true;
        }
      } else {
        if (statuses[Permission.storage]!.isDenied ||
            statuses[Permission.storage]!.isPermanentlyDenied) {
          var permission = await Permission.storage.request();

          if (permission.isDenied || permission.isPermanentlyDenied) {
            hasPermission = false;

            showAppSettings(
                navigatorKey.currentContext!,
                getTranslated(
                        navigatorKey.currentContext!, "storagePermission") ??
                    "",
                "storage");
          }
        } else {
          hasPermission = true;
        }
      }
    }
    return hasPermission;
  }

  Future<bool> requestAudioPermission() async {
    bool hasPermission = false;
    Map<Permission, PermissionStatus> statuses;
    if (Platform.isAndroid) {
      statuses = await [Permission.microphone].request();
    } else {
      statuses = await [
        Permission.microphone,
      ].request();
    }
    if (Platform.isIOS) {
      if (statuses[Permission.microphone]!.isGranted ||
          statuses[Permission.microphone]!.isLimited) {
        hasPermission = true;
      } else {
        if (statuses[Permission.microphone]!.isPermanentlyDenied) {
          hasPermission = false;

          showAppSettings(
              navigatorKey.currentContext!,
              getTranslated(
                      navigatorKey.currentContext!, "audioPermissionMessage") ??
                  "",
              "audio");
        }
      }
    } else if (Platform.isAndroid) {
      if (statuses[Permission.microphone]!.isDenied ||
          statuses[Permission.microphone]!.isPermanentlyDenied) {
        var permission = await Permission.microphone.request();

        if (permission.isDenied || permission.isPermanentlyDenied) {
          hasPermission = false;

          showAppSettings(
              navigatorKey.currentContext!,
              getTranslated(
                      navigatorKey.currentContext!, "audioPermissionMessage") ??
                  "",
              "audio");
        }
      } else {
        hasPermission = true;
      }
    }
    return hasPermission;
  }

  Future<bool> requestLocationPermission() async {
    bool hasPermission = false;
    Map<Permission, PermissionStatus> statuses;
    if (Platform.isAndroid) {
      statuses = await [
        Permission.location,
      ].request();
    } else {
      statuses = await [Permission.locationAlways, Permission.locationWhenInUse]
          .request();
    }
    if (Platform.isAndroid) {
      if (statuses[Permission.location]!.isGranted) {
        hasPermission = true;
      } else if (statuses[Permission.location]!.isDenied) {
        if (statuses[Permission.location]!.isPermanentlyDenied) {
          hasPermission = false;
          var permission = await Permission.location.request();
          if (permission.isDenied || permission.isPermanentlyDenied) {
            hasPermission = false;
            // showAppSettings(context, "Needs storage permission", "camera");
          } else {
            hasPermission = true;
          }
        }
      } else {
        if (statuses[Permission.location]!.isPermanentlyDenied) {
          hasPermission = false;
          // showAppSettings(context, "Needs storage permission", "camera");
        }
      }
    } else if (Platform.isIOS) {
      if (statuses[Permission.locationAlways]!.isGranted ||
          statuses[Permission.locationWhenInUse]!.isGranted) {
        hasPermission = true;
      } else {
        hasPermission = false;
      }
    }
    return hasPermission;
  }

  Future<bool> requestStorageOnlyPermission() async {
    var storage = await Permission.storage.status;
    bool value = false;
    if (storage.isGranted) {
      value = true;
    } else {
      var permission = await Permission.storage.request();
      if (permission.isGranted || permission.isLimited) {
        value = true;
      } else if (permission.isPermanentlyDenied || permission.isDenied) {
        await showAppSettings(
            navigatorKey.currentContext!,
            "This app needs storage permission to upload Files.",
            "Permission Required");
      }
    }
    return value;
  }

  showAppSettings(BuildContext context, String message, String type) {
    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
              child: Column(
            children: [
              SizedBox(
                height: getHeight() * 2.0,
              ),
              Assets.svg.icError.svg(),
              SizedBox(
                height: getHeight() * 3.0,
              ),
              BuildText(
                text: getTranslated(context, "error") ?? "",
                textAlign: TextAlign.center,
                color: ColorName.colorTextBlack,
                fontSize: 10.0.medium20px(),
                weight: FontWeight.w600,
                height: 1.5,
                family: FontFamily.biloRegular,
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: getHeight() * 1.2,
                    left: getHeight() * 3.6,
                    right: getHeight() * 3.6),
                child: BuildText(
                  text: message,
                  textAlign: TextAlign.center,
                  color: ColorName.colorTextBlack,
                  fontSize: 10.0.medium16px(),
                  height: 1.5,
                  weight: FontWeight.w400,
                  family: FontFamily.biloRegular,
                ),
              ),
            ],
          )),
          actions: <Widget>[
            Builder(builder: (BuildContext outerContext) {
              return TextButton(
                child: Text(getTranslated(context, "ok") ?? ""),
                onPressed: () async {
                  Navigator.of(context).pop();
                  await openAppSettings();
                },
              );
            }),
          ],
        );
      },
    );
  }
}
