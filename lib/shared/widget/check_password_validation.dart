import 'package:demo_project/shared/constants/fonts/font_constants.dart';
import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../main.dart';
import '../constants/regex_constants.dart';
import '../text_widgets/build_text.dart';
import 'localization_constants.dart';

Widget checkValidation(
    double width, double height, TextEditingController controller) {
  return Container(
    padding:
        EdgeInsets.symmetric(horizontal: height * 1.2, vertical: height * 1.2),
    decoration: BoxDecoration(
      color: ColorName.colorWhite,
      borderRadius: BorderRadius.all(Radius.circular(height * 0.8)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BuildText(
          fontSize: 13.0.small12px(),
          family: FontFamily.biloRegular,
          weight: FontWeight.w400,
          color: ColorName.colorTextBlack,
          text: getTranslated(
                  navigatorKey.currentContext!, "passwordMustContain") ??
              "",
        ),
        SizedBox(height: height * 0.8),
        Column(children: [
          CustomCircle(
            height: height,
            text: getTranslated(
                    navigatorKey.currentContext!, "atLeast7Character") ??
                "",
            icon: controller.text.isNotEmpty
                ? controller.text.length < 7
                    ? Assets.svg.icIncorrectCheck.svg()
                    : Assets.svg.icCorrectCheck.svg()
                : Assets.svg.icUncheck.svg(),
            textColor: controller.text.length < 7
                ? ColorName.colorDarkGrey
                : ColorName.colorTextBlack,
          ),
          CustomCircle(
            height: height,
            text:
                getTranslated(navigatorKey.currentContext!, "atLeastNumber") ??
                    "",
            icon: controller.text.isNotEmpty
                ? RegexConstants.numberRegEx.hasMatch(controller.text)
                    ? Assets.svg.icCorrectCheck.svg()
                    : Assets.svg.icIncorrectCheck.svg()
                : Assets.svg.icUncheck.svg(),
            textColor: RegexConstants.numberRegEx.hasMatch(controller.text)
                ? ColorName.colorTextBlack
                : ColorName.colorDarkGrey,
          ),
          CustomCircle(
            height: height,
            text: getTranslated(
                    navigatorKey.currentContext!, "atLeastLowerCharacter") ??
                "",
            icon: controller.text.isNotEmpty
                ? RegexConstants.lowercaseRegEx.hasMatch(controller.text)
                    ? Assets.svg.icCorrectCheck.svg()
                    : Assets.svg.icIncorrectCheck.svg()
                : Assets.svg.icUncheck.svg(),
            textColor: RegexConstants.lowercaseRegEx.hasMatch(controller.text)
                ? ColorName.colorTextBlack
                : ColorName.colorDarkGrey,
          ),
          CustomCircle(
            height: height,
            text: getTranslated(
                    navigatorKey.currentContext!, "atLeastUpperCharacter") ??
                "",
            icon: controller.text.isNotEmpty
                ? RegexConstants.uppercaseRegEx.hasMatch(controller.text)
                    ? Assets.svg.icCorrectCheck.svg()
                    : Assets.svg.icIncorrectCheck.svg()
                : Assets.svg.icUncheck.svg(),
            textColor: RegexConstants.uppercaseRegEx.hasMatch(controller.text)
                ? ColorName.colorTextBlack
                : ColorName.colorDarkGrey,
          ),
          CustomCircle(
            height: height,
            text: getTranslated(
                    navigatorKey.currentContext!, "atLeastSpecialCharacter") ??
                "",
            icon: controller.text.isNotEmpty
                ? RegexConstants.specialRegEx.hasMatch(controller.text)
                    ? Assets.svg.icCorrectCheck.svg()
                    : Assets.svg.icIncorrectCheck.svg()
                : Assets.svg.icUncheck.svg(),
            textColor: RegexConstants.specialRegEx.hasMatch(controller.text)
                ? ColorName.colorTextBlack
                : ColorName.colorDarkGrey,
          ),
        ]),
      ],
    ),
  );
}

class CustomCircle extends StatelessWidget {
  const CustomCircle(
      {Key? key,
      required this.height,
      required this.text,
      required this.icon,
      required this.textColor})
      : super(key: key);
  final double height;
  final String text;
  final Widget icon;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: height * 0.8),
      child: Row(
        children: [
          icon,
          // Icon(Icons.circle, size: height * 1.5, color: iconColor),
          const SizedBox(width: 5),
          BuildText(
            color: textColor,
            textAlign: TextAlign.center,
            text: text,
            fontSize: 10.0.small10px(),
          )
        ],
      ),
    );
  }
}
