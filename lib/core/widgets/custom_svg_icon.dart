import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSvgIcon extends StatelessWidget {
  final String iconPath;
  final double? height;
  final double? width;
  const CustomSvgIcon(
      {super.key, required this.iconPath, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: SvgPicture.asset(
        iconPath,
        fit: BoxFit.cover,
      ),
    );
  }
}
