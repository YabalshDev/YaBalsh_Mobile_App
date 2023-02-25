import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSwitch extends StatelessWidget {
  final bool activeIndicator;
  final void Function(bool) onSwitchTap;

  const CustomSwitch(
      {super.key, required this.activeIndicator, required this.onSwitchTap});

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? Switch(
            value: activeIndicator,
            activeColor: Colors.green.shade400,
            onChanged: onSwitchTap,
          )
        : CupertinoSwitch(
            value: activeIndicator,
            activeColor: Colors.green.shade400,
            onChanged: onSwitchTap,
          );
  }
}
