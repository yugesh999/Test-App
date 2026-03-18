import 'package:demo_project/shared/constants/fonts/font_constants.dart';
import 'package:flutter/material.dart';
import '../../../../shared/constants/fonts/size_config.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../text_widgets/build_text.dart';
import 'localization_constants.dart';

class CreateOptionDialog extends StatefulWidget {
  const CreateOptionDialog({Key? key, required this.onTap}) : super(key: key);

  final Function(String) onTap;

  @override
  State<CreateOptionDialog> createState() => _CreateOptionDialogState();
}

class _CreateOptionDialogState extends State<CreateOptionDialog> {
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [SizedBox(height: height * 3)],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
