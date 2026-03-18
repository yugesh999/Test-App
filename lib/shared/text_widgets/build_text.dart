import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../constants/fonts/font_constants.dart';
import '../constants/fonts/size_config.dart';
import '../services/device_size_service.dart';

class BuildText extends StatelessWidget {
  const BuildText({
    Key? key,
    this.text = "",
    this.fontSize,
    this.color = ColorName.colorTextBlack,
    this.weight = FontWeight.w400,
    this.family,
    this.height = 1,
    this.decoration = TextDecoration.none,
    this.textAlign = TextAlign.start,
    this.maxLines = 4,
    this.italics = false,
  }) : super(key: key);

  final String text;
  final double? fontSize;
  final double height;
  final Color? color;
  final FontWeight weight;
  final TextDecoration decoration;
  final TextAlign textAlign;
  final int maxLines;
  final bool italics;
  final String? family;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontWeight: weight,
        fontSize: fontSize ?? 10.0.small14px(),
        height: height,
        color: color,
        fontStyle: italics ? FontStyle.italic : FontStyle.normal,
        decoration: decoration,
        fontFamily: family,
      ),
    );
  }
}

class BuildTextFieldLogin extends StatefulWidget {
  const BuildTextFieldLogin({
    Key? key,
    required this.width,
    this.label = '',
    this.hint = '',
    this.suffixIcon,
    this.prefixIcon,
    required this.containerWidth,
    this.containerHeight,
    required this.keyBoardType,
    this.trailingIcon = false,
    this.obscureText = false,
    this.validator,
    this.textAction = TextInputAction.done,
    this.readOnly = false,
    this.hasError = false,
    required this.controller,
    this.textInputFormatter = const <TextInputFormatter>[],
    this.fontSize,
    this.border,
    this.enableBorder,
    this.focusBorder,
    this.maxLength,
    this.weight = FontWeight.w400,
    this.floatingLabelBehavior = FloatingLabelBehavior.auto,
    this.enabled = true,
    this.onChanged,
    this.onSubmitted,
    this.underline = false,
    this.onTap,
  }) : super(key: key);

  final double width;
  final double? fontSize;
  final FontWeight weight;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final int? maxLength;
  final InputBorder? enableBorder;
  final InputBorder? focusBorder;
  final InputBorder? border;
  final double containerWidth;
  final double? containerHeight;
  final String label;
  final String hint;
  final TextInputType keyBoardType;
  final bool obscureText;
  final bool hasError;
  final bool trailingIcon;
  final TextEditingController controller;
  final TextInputAction textAction;
  final List<TextInputFormatter> textInputFormatter;
  final String? Function(String? val)? validator;
  final Function()? onChanged;
  final Function()? onSubmitted;
  final VoidCallback? onTap;
  final bool readOnly;
  final bool underline;
  final bool enabled;
  final FloatingLabelBehavior? floatingLabelBehavior;

  @override
  _BuildTextFieldLogin createState() => _BuildTextFieldLogin();
}

class _BuildTextFieldLogin extends State<BuildTextFieldLogin> {
  FocusNode _focusNode = FocusNode();
  bool? obscureText;
  double height = 0.0;

  @override
  void initState() {
    super.initState();
    obscureText = widget.obscureText;
    height = SizeConfig.safeBlockVertical!;
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: height * 1.6,
        vertical: height * 0.2,
      ),
      width: widget.containerWidth,
      decoration: BoxDecoration(
        color: ColorName.colorWhite,
        // borderRadius: BorderRadius.circular(height * 0.8),
        border: Border.all(
          color:
              !widget.hasError ? ColorName.colorWhite : ColorName.colorErrorRed,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BuildText(
              text: widget.label,
              fontSize: 14.0.medium15px(),
              weight: FontWeight.w500,
              family: FontFamily.biloRegular,
              color: ColorName.colorBlack,
            ),
          SizedBox(height: getHeight() * 1.0),
          SizedBox(
            width: widget.containerWidth,
            child: TextFormField(
              enabled: widget.enabled,
              controller: widget.controller,
              validator: widget.validator,
              maxLength: widget.maxLength,
              textInputAction: widget.textAction,
              focusNode: _focusNode,
              keyboardType: widget.keyBoardType,
              obscureText: widget.obscureText,
              obscuringCharacter: '●',
              // Filled circle
              onTap: widget.onTap ?? () {
                setState(() {
                  FocusScope.of(context).requestFocus(_focusNode);
                });
              },
              onEditingComplete: () {
                widget.onSubmitted!();
              },
              style: TextStyle(
                color: ColorName.colorTextBlack,
                fontSize: 0.0.small14px(),
              ),
              readOnly: widget.readOnly,
              decoration: InputDecoration(
                isDense: true,
                fillColor: ColorName.colorWhite,
                border: widget.border!,
                focusedBorder: widget.focusBorder!,
                enabledBorder: widget.enableBorder!,
                disabledBorder: widget.enableBorder!,
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                hintText: widget.hint,
                hintStyle: TextStyle(
                  fontSize: widget.fontSize ?? 10.0.small14px(),
                  fontWeight: widget.weight,
                  fontFamily: FontFamily.biloRegular,
                  fontStyle: FontStyle.italic,
                  color: ColorName.colorHintText,
                ),
                suffixIcon: Focus(
                  canRequestFocus: false,
                  descendantsAreFocusable: false,
                  child: widget.suffixIcon ?? const SizedBox.shrink(),
                ),
                prefixIcon: widget.prefixIcon,
                suffixStyle: TextStyle(
                  color: ColorName.colorHintText,
                  fontWeight: FontWeight.w400,
                  fontSize: 10.0.small14px(),
                  fontFamily: FontFamily.biloRegular,
                ),
                focusColor: ColorName.colorPrimary,
              ),
              inputFormatters: widget.textInputFormatter,
              onChanged: (value) {
                value = widget.controller.text;
                if (widget.onChanged != null) {
                  widget.onChanged!();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    String digitsOnly = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');
    String formatted = '';

    for (int i = 0; i < digitsOnly.length && i < 8; i++) {
      formatted += digitsOnly[i];
      if ((i == 1 || i == 3) && i != digitsOnly.length - 1) {
        formatted += '/';
      }
    }

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}

class BuildTextFormFieldSearch extends StatefulWidget {
  const BuildTextFormFieldSearch({
    Key? key,
    required this.width,
    this.label = '',
    this.hint = '',
    this.suffixText,
    required this.keyBoardType,
    this.trailingIcon = false,
    this.color = ColorName.colorTextBlack,
    this.obscureText = false,
    this.validator,
    this.textAction = TextInputAction.done,
    this.readOnly = false,
    required this.controller,
    this.textInputFormatter = const <TextInputFormatter>[],
    this.fontSize = 14,
    this.maxLines,
    this.weight = FontWeight.w300,
    this.floatingLabelBehavior = FloatingLabelBehavior.auto,
    this.prefixIcon,
    this.suffixIcon,
    this.enabled = true,
    this.onChanged,
    this.onSubmitted,
    this.underline = false,
    required this.family,
  }) : super(key: key);

  final double width;
  final double fontSize;
  final FontWeight weight;
  final String label;
  final Color color;
  final String hint;
  final String? suffixText;
  final TextInputType keyBoardType;
  final bool obscureText;
  final bool trailingIcon;
  final int? maxLines;
  final TextEditingController controller;
  final TextInputAction textAction;
  final List<TextInputFormatter> textInputFormatter;
  final String? Function(String? val)? validator;
  final String family;
  final Function(String)? onChanged;
  final Function()? onSubmitted;
  final bool readOnly;
  final bool underline;
  final bool enabled;
  final Widget? suffixIcon;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final Widget? prefixIcon;

  @override
  _BuildTextFormFieldSearch createState() => _BuildTextFormFieldSearch();
}

class _BuildTextFormFieldSearch extends State<BuildTextFormFieldSearch> {
  FocusNode _focusNode = FocusNode();
  bool? obscureText;

  @override
  void initState() {
    super.initState();
    obscureText = widget.obscureText;
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.enabled,
      controller: widget.controller,
      validator: widget.validator,
      textInputAction: widget.textAction,
      onTap: () {
        setState(() {
          FocusScope.of(context).requestFocus(_focusNode);
        });
      },
      focusNode: _focusNode,
      keyboardType: widget.keyBoardType,
      obscureText: widget.obscureText,
      readOnly: widget.readOnly,
      onEditingComplete: widget.onSubmitted,
      maxLines: widget.maxLines!,
      decoration: InputDecoration(
        isDense: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding: EdgeInsets.symmetric(horizontal: getHeight() * 2.0),
        suffixIcon: widget.suffixIcon,
        prefixIcon: widget.prefixIcon,
        prefixIconConstraints: BoxConstraints(
          minWidth: widget.width * 0.12,
          minHeight: widget.width * 0.12,
        ),
        border: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorName.colorTeal),
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorName.colorBlack),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorName.colorBlack),
        ),
        labelText: widget.label,
        labelStyle: TextStyle(
          fontSize: 16.0.medium16px(),
          fontWeight: widget.weight,
          fontFamily: widget.family,
          color: widget.color,
        ),
        suffixStyle: TextStyle(
          color: const Color(0xFF999999),
          fontWeight: FontWeight.w400,
          fontSize: widget.width,
          fontFamily: widget.family,
        ),
        focusColor: Theme.of(context).primaryColor,
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
      inputFormatters: widget.textInputFormatter,
      onChanged: (value) {
        value = widget.controller.text;
        if (widget.onChanged != null) {
          widget.onChanged!(value);
        }
      },
    );
  }
}
