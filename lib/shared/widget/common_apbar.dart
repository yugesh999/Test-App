import 'package:demo_project/shared/constants/fonts/font_constants.dart';
import 'package:flutter/material.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../text_widgets/build_text.dart';

createCommonAppBar({
  String? title,
  bool isCenterTitle = true,
  bool isElevation = true,
  Function()? onPressed,
  Color backgroundColor = Colors.white,
  Widget? leadingIcon,
  List<Widget>? action,
  double? fontSize,
}) {
  return AppBar(
    backgroundColor: backgroundColor,
    automaticallyImplyLeading: false,
    scrolledUnderElevation: isElevation ? 0.8 : 0.0,
    surfaceTintColor: Colors.transparent,
    centerTitle: isCenterTitle,
    leading:
        leadingIcon == null
            ? null
            : InkWell(onTap: onPressed, child: leadingIcon),
    title: BuildText(
      text: title ?? "",
      fontSize: fontSize ?? 10.0.medium20px(),
      family: FontFamily.biloMedium,
      color: ColorName.colorWhite,
      weight: FontWeight.w700,
    ),
    actions: action,
    elevation: isElevation ? 0.8 : 0.0,
    shadowColor: Colors.black.withOpacity(0.6),
  );
}
