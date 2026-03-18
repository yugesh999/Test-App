import 'package:demo_project/shared/constants/fonts/font_constants.dart';
import 'package:flutter/material.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../constants/fonts/size_config.dart';
import '../text_widgets/build_text.dart';

class ResponseBottomSheet extends StatefulWidget {
  const ResponseBottomSheet({
    Key? key,
    required this.type,
    required this.title,
    required this.crossFunction,
    this.message = "",
  }) : super(key: key);

  final String type;
  final String title;
  final String message;

  final Function() crossFunction;

  @override
  State<ResponseBottomSheet> createState() => _ResponseBottomSheetState();
}

class _ResponseBottomSheetState extends State<ResponseBottomSheet> {
  double width = 0.0;
  double height = 0.0;

  @override
  void initState() {
    height = SizeConfig.safeBlockVertical!;
    width = SizeConfig.safeBlockHorizontal!;
    super.initState();
  }

  Future<bool> _onWillPop() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Wrap(
        children: [
          Container(
            width: width * 100,
            padding: MediaQuery.of(context).viewInsets,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              color: ColorName.colorWhite,
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                height * 3.0,
                height * 2.0,
                height * 3.0,
                0,
              ),
              child: Column(
                children: [
                  widget.type == "success"
                      ? Assets.svg.icSuccess.svg()
                      : widget.type == "error"
                      ? Assets.svg.icError.svg(height: height * 10.0)
                      : const SizedBox.shrink(),
                  widget.title.isNotEmpty
                      ? Padding(
                        padding: EdgeInsets.only(top: height * 2.4),
                        child: BuildText(
                          text: widget.title,
                          textAlign: TextAlign.center,
                          color: ColorName.colorTextBlack,
                          fontSize: 10.0.medium20px(),
                          weight: FontWeight.w600,
                          family: FontFamily.biloRegular,
                        ),
                      )
                      : const SizedBox.shrink(),
                  widget.message.isNotEmpty
                      ? Padding(
                        padding: EdgeInsets.only(
                          top: height * 1.2,
                          left: height * 3.6,
                          right: height * 3.6,
                        ),
                        child: BuildText(
                          text: widget.message,
                          textAlign: TextAlign.center,
                          color: ColorName.colorTextBlack,
                          fontSize: 10.0.medium16px(),
                          height: height * 0.2,
                          weight: FontWeight.w400,
                          family: FontFamily.biloRegular,
                        ),
                      )
                      : const SizedBox(),
                  SizedBox(height: height * 6.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
