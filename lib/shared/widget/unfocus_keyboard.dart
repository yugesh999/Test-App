import 'package:flutter/material.dart';

class UnfocusKeyboard extends StatelessWidget {
  final Widget child;

  const UnfocusKeyboard({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: child,
    );
  }
}