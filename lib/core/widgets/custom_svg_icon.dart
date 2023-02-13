import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSvgIcon extends StatelessWidget {
  final String iconPath;
  final double? height;
  final double? width;
  final Color? color;
  final BoxFit? boxFit;
  const CustomSvgIcon(
      {super.key,
      required this.iconPath,
      this.height,
      this.width,
      this.color,
      this.boxFit});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: SvgPicture.asset(
        iconPath,
        color: color,
        fit: boxFit ?? BoxFit.contain,
      ),
    );
  }
}
