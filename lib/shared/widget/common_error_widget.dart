import 'package:flutter/material.dart';
import '../../gen/assets.gen.dart';
import '../constants/fonts/font_constants.dart';
import '../constants/fonts/size_config.dart';
import '../text_widgets/build_text.dart';
import '../../gen/colors.gen.dart';

class CommonErrorWidget extends StatefulWidget {
  final String title;
  final double height;

  const CommonErrorWidget({Key? key, required this.title, this.height = 24.0}) : super(key: key);

  @override
  State<CommonErrorWidget> createState() => _CommonErrorWidgetState();
}

class _CommonErrorWidgetState extends State<CommonErrorWidget> {

  double height = 0.0;
  double width = 0.0;

  @override
  void initState() {
    super.initState();
    height = SizeConfig.safeBlockVertical!;
    width = SizeConfig.safeBlockHorizontal!;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: height * 2),
      child: Row(
        children: [
          Assets.svg.icError.svg(
            height: height * 0.8,
            width: height * 0.8,
          ),
          SizedBox(width: width * 2),
          BuildText(
            text: widget.title,
            weight: FontWeight.w400,
            fontSize: 13.0.small10px(),
            color: ColorName.colorErrorRed,
          ),
        ],
      ),
    );
  }
}
