import 'package:flutter/material.dart';
import 'package:yabalash_mobile_app/core/theme/light/app_colors_light.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_svg_icon.dart';

class NavIcon extends StatelessWidget {
  final String iconPath;
  final int itemIndex;
  final int activeIndex;
  const NavIcon(
      {super.key,
      required this.activeIndex,
      required this.iconPath,
      required this.itemIndex});

  @override
  Widget build(BuildContext context) {
    return CustomSvgIcon(
      iconPath: iconPath,
      color: activeIndex == itemIndex
          ? AppColorsLight.kAppPrimaryColorLight
          : Colors.black,
    );
  }
}
