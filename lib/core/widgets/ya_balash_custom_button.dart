import 'package:flutter/material.dart';

class YaBalashCustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const YaBalashCustomButton(
      {super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Text(title),
    );
  }
}
