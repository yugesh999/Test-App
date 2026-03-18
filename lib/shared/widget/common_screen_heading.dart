import 'package:demo_project/shared/text_widgets/build_text.dart';
import 'package:flutter/material.dart';
import '../constants/fonts/font_constants.dart';

commonScreenHeading(
    String pageName,
  ){
  return Row(
    children: [
      BuildText(
        text: pageName,
        fontSize: 10.0.large22px(),
      ),
    ],
  );
}




