import 'package:flutter/material.dart';

commonCloseButton({
  required BuildContext context,
  required double height,
}) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).pop();
    },
    child: Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey.shade300,
      ),
      padding: EdgeInsets.all(height),
      child: const Icon(Icons.close, size: 20),
    ),
  );
}
