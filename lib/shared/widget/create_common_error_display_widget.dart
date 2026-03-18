import 'package:demo_project/shared/constants/fonts/font_constants.dart';
import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../main.dart';
import '../services/device_size_service.dart';
import '../text_widgets/build_text.dart';
import 'app_button.dart';
import 'empty_response_widget.dart';
import 'localization_constants.dart';

createCommonErrorDisplayWidget(
  Function() onTap, {
  String? type,
  double? widgetHeight,
}) {
  var height = getHeight();
  var width = getWidth();
  return SingleChildScrollView(
    child: SizedBox(
      height: widgetHeight ?? getHeight() * 80,
      width: getWidth() * 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          type == "error"
              ? Assets.svg.icSomethingWentWrong.svg(height: height * 35)
              : Assets.svg.icNoInternet.svg(),
          SizedBox(height: height * 5.2),
          BuildText(
            textAlign: TextAlign.center,
            text: getTranslated(navigatorKey.currentContext!, "whoops") ?? "",
            fontSize: 10.0.large28px(),
            family: FontFamily.biloBold,
            weight: FontWeight.w600,
            color: ColorName.colorTextBlack,
          ),
          SizedBox(height: height * 1.8),
          BuildText(
            textAlign: TextAlign.center,
            text:
                type == "error"
                    ? getTranslated(
                          navigatorKey.currentContext!,
                          "somethingWentWrong",
                        ) ??
                        ""
                    : getTranslated(
                          navigatorKey.currentContext!,
                          "noInternetConnection",
                        ) ??
                        "",
            height: 1.5,
            fontSize: 10.0.small14px(),
            family: FontFamily.biloRegular,
            weight: FontWeight.w400,
            color: ColorName.colorHintText,
          ),
          SizedBox(height: height * 3.2),
          AppButton(
            buttonWidth: width * 40,
            fontSize: 10.1.medium16px(),
            weight: FontWeight.w500,
            title: getTranslated(navigatorKey.currentContext!, "reload") ?? "",
            onTap: () => onTap(),
            textColor: ColorName.colorWhite,
            backgroundColor: ColorName.colorPrimary,
          ),
        ],
      ),
    ),
  );
}

createScrollableEmptyResponseWidget(
  Widget image,
  String title, {
  double? widgetHeight,
}) {
  return SingleChildScrollView(
    physics: const AlwaysScrollableScrollPhysics(),
    child: EmptyResponseWidget(
      image: image,
      title: title,
      height: widgetHeight ?? getHeight() * 80,
    ),
  ); //
}
