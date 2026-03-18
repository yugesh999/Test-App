import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final Color backgroundColor;
  final Widget icon;
  final VoidCallback? onTap;

  const ActionButton({
    super.key,
    required this.icon,
    required this.backgroundColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: icon,
        )
    );
  }
}