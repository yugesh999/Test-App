import 'package:demo_project/shared/constants/fonts/font_constants.dart';
import 'package:flutter/material.dart';

import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../constants/color_constants.dart';
import '../services/device_size_service.dart';
import '../text_widgets/build_text.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    this.buttonWidth,
    required this.title,
    this.fontSize,
    required this.backgroundColor,
    required this.textColor,
    this.weight = FontWeight.w500,
    this.verticalPadding,
    this.borderColor = Colors.transparent,
    this.onTap,
  }) : super(key: key);

  final double? buttonWidth;
  final String title;
  final Function()? onTap;
  final double? verticalPadding;
  final FontWeight weight;
  final double? fontSize;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: verticalPadding ?? getHeight() * 1.5,
          horizontal: getHeight() * 0.5,
        ),
        alignment: Alignment.center,
        width: buttonWidth,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(getHeight() * 0.8),
          border: Border.all(color: borderColor, width: 1),
        ),
        child: BuildText(
          family: FontFamily.biloMedium,
          weight: weight,
          text: title,
          fontSize: fontSize ?? 10.0.medium16px(),
          color: textColor,
          height: getHeight() * 0.17,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class AppButtonDialog extends StatelessWidget {
  const AppButtonDialog({
    Key? key,
    required this.buttonWidth,
    required this.title,
    required this.isValid,
    this.isCancel = false,
    this.onTap,
    required this.isGreenDialog,
  }) : super(key: key);

  final double buttonWidth;
  final String title;
  final Function()? onTap;
  final bool isValid;
  final bool isCancel;
  final bool isGreenDialog;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isValid || isCancel ? onTap : null,
      child: Container(
        padding: const EdgeInsets.all(16),
        alignment: Alignment.center,
        width: buttonWidth,
        decoration: BoxDecoration(
          color:
              isCancel
                  ? ColorName.colorErrorRed
                  : isValid
                  ? isGreenDialog
                      ? ColorName.colorPrimary
                      : ColorName.colorWhite
                  : ColorName.colorScaffoldBackground,
          borderRadius: BorderRadius.circular(6),
        ),
        child: BuildText(
          family: FontFamily.biloRegular,
          weight: FontWeight.w600,
          text: title,
          color:
              isValid
                  ? isGreenDialog
                      ? Colors.white
                      : ColorName.colorSecondary
                  : Colors.white,
        ),
      ),
    );
  }
}
