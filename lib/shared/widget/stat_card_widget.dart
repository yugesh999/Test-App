import 'package:demo_project/shared/constants/fonts/font_constants.dart';
import 'package:flutter/material.dart';

import '../../gen/colors.gen.dart';
import '../text_widgets/build_text.dart';

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorName.colorWhite,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          BuildText(
            text: title,
            color: color,
            fontSize: 12.0.medium15px(),
            weight: FontWeight.w800,
            height: 1.5,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20 ),
          BuildText(
            text: value,
            fontSize: 15.0.medium18px(),
            weight: FontWeight.w900,
            color: color,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}