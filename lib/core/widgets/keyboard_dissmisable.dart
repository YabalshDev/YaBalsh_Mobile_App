import 'package:flutter/material.dart';

class KeyboardDissmisable extends StatelessWidget {
  final Widget child;
  const KeyboardDissmisable({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: child,
    );
  }
}
