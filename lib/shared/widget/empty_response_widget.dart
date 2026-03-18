import 'package:demo_project/shared/constants/fonts/font_constants.dart';
import 'package:flutter/material.dart';

import '../../gen/colors.gen.dart';
import '../constants/fonts/size_config.dart';
import '../text_widgets/build_text.dart';

class EmptyResponseWidget extends StatefulWidget {
  Widget? image;
  String? title;
  String description;
  double? height;
  MainAxisAlignment? mainAxisAlignment;

  EmptyResponseWidget({
    Key? key,
    this.image,
    this.title,
    this.description = '',
    this.height,
    this.mainAxisAlignment = MainAxisAlignment.center,
  }) : super(key: key);

  @override
  State<EmptyResponseWidget> createState() => _EmptyResponseWidgetState();
}

class _EmptyResponseWidgetState extends State<EmptyResponseWidget> {
  double height = 0.0;
  double width = 0.0;

  @override
  void initState() {
    height = SizeConfig.safeBlockVertical!;
    width = SizeConfig.safeBlockHorizontal!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: width * 100,
      child: Column(
        mainAxisAlignment: widget.mainAxisAlignment!,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          widget.image!,
          SizedBox(height: height * 4.0),
          BuildText(
            text: widget.title!,
            weight: FontWeight.w700,
            fontSize: 0.0.large28px(),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: height * 2.0),
          widget.description.isNotEmpty
              ? BuildText(
                text: widget.description,
                weight: FontWeight.w500,
                fontSize: 0.0.small14px(),
                textAlign: TextAlign.center,
                color: ColorName.colorGreyLightText,
              )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
