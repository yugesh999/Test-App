import 'package:demo_project/shared/constants/fonts/font_constants.dart';
import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../services/device_size_service.dart';
import '../text_widgets/build_text.dart';

createDisableBorder() {
  return OutlineInputBorder(
    gapPadding: getHeight() * 1.0,
    borderRadius: BorderRadius.all(Radius.circular(getHeight() * 0.6)),
    borderSide: BorderSide(
      color: ColorName.colorWhite,
      width: getHeight() * 0.1,
    ),
  );
}

createFocusBorder() {
  return OutlineInputBorder(
    gapPadding: getHeight() * 1.0,
    borderRadius: BorderRadius.all(Radius.circular(getHeight() * 0.6)),
    borderSide: BorderSide(
      color: ColorName.colorPrimary,
      width: getHeight() * 0.1,
    ),
  );
}

createErrorBorder() {
  return OutlineInputBorder(
    gapPadding: getHeight() * 1.0,
    borderRadius: BorderRadius.all(Radius.circular(getHeight() * 0.6)),
    borderSide: BorderSide(
      color: ColorName.colorErrorRed,
      width: getHeight() * 0.1,
    ),
  );
}

createEnableBorder() {
  return OutlineInputBorder(
    gapPadding: getHeight() * 1.0,
    borderRadius: BorderRadius.all(Radius.circular(getHeight() * 0.6)),
    borderSide: BorderSide(
      color: ColorName.colorWhite,
      width: getHeight() * 0.1,
    ),
  );
}

createErrorWidget(String errorMessage, double height) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: height * 0.3),
      Row(
        children: [
          Assets.svg.icIncorrectCheck.svg(),
          SizedBox(width: height * 0.5),
          BuildText(
            text: errorMessage,
            weight: FontWeight.w500,
            color: ColorName.colorErrorRed,
            fontSize: 13.0.small10px(),
            family: FontFamily.biloRegular,
          ),
        ],
      ),
    ],
  );
}
