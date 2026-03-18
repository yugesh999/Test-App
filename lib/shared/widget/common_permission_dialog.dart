import 'package:demo_project/shared/constants/fonts/font_constants.dart';
import 'package:flutter/material.dart';
import '../../../../shared/constants/fonts/size_config.dart';
import '../../../gen/colors.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../text_widgets/build_text.dart';
import 'app_button.dart';
import 'localization_constants.dart';

class CommonPermissionDialog extends StatefulWidget {
  const CommonPermissionDialog({
    Key? key,
    required this.onTap,
    required this.type,
    required this.title,
    required this.message,
    required this.image,
  }) : super(key: key);

  final Function(String) onTap;
  final String type;
  final Widget image;
  final String title;
  final String message;

  @override
  State<CommonPermissionDialog> createState() => _CommonPermissionDialogState();
}

class _CommonPermissionDialogState extends State<CommonPermissionDialog> {
  double height = 0.0;
  double width = 0.0;

  Future<bool> _onWillPop() async {
    Navigator.of(context).pop();
    return false;
  }

  @override
  void initState() {
    height = SizeConfig.safeBlockVertical!;
    width = SizeConfig.safeBlockHorizontal!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Wrap(
        children: [
          SizedBox(
            width: width * 100,
            child: Container(
              width: width * 100,
              padding: MediaQuery.of(context).viewInsets,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: height * 2.4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: height * 3.8),
                    widget.image,
                    SizedBox(height: height * 1.2),
                    BuildText(
                      text: widget.title,
                      fontSize: 10.1.medium20px(),
                      family: FontFamily.biloMedium,
                      weight: FontWeight.w600,
                      height: 1.3,
                      color: ColorName.colorTextBlack,
                    ),
                    SizedBox(height: height * 0.8),
                    BuildText(
                      text: widget.message,
                      fontSize: 10.1.medium16px(),
                      family: FontFamily.biloRegular,
                      weight: FontWeight.w400,
                      height: 1.3,
                      color: ColorName.colorTextBlack,
                    ),
                    SizedBox(height: height * 2.8),
                    Row(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AppButtonDialog(
                              title: getTranslated(context, "cancel") ?? "",
                              buttonWidth: width * 43,
                              isValid: false,
                              isCancel: true,
                              isGreenDialog: false,
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: width * 2.5),
                              child: AppButtonDialog(
                                title: getTranslated(context, "yes") ?? "",
                                buttonWidth: width * 43,
                                isValid: true,
                                isGreenDialog: true,
                                onTap: () {
                                  Navigator.of(context).pop();
                                  widget.onTap(widget.type);
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: height * 3.8),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
