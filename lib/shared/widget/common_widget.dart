import 'package:flutter/material.dart';

import '../../main.dart';

void showCommonDialog(Widget widget, {bool isDismissible = true}) async {
  await showModalBottomSheet(
    isScrollControlled: true,
    context: navigatorKey.currentContext!,
    isDismissible: isDismissible,
    enableDrag: false,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return widget;
    },
  );
}

Color hexToColor(String hex) {
  hex = hex.replaceAll('#', '');
  if (hex.length == 6) hex = 'FF$hex'; // add alpha if not included
  return Color(int.parse(hex, radix: 16));
}
