import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class CustomAnimatedWidget extends StatelessWidget {
  final Widget child;
  const CustomAnimatedWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return FadeIn(duration: const Duration(milliseconds: 500), child: child);
  }
}
