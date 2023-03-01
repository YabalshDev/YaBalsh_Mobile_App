import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';

import 'ya_balash_custom_button.dart';

class CustomNavBar extends StatelessWidget {
  final double? height;
  final void Function()? mainButtonTap;
  final String title;
  final bool? isDisabled;
  final String? iconPath;
  final Widget? customChild;

  final bool isButtonSecondary;
  const CustomNavBar(
      {super.key,
      this.height,
      this.isDisabled = false,
      this.iconPath,
      this.mainButtonTap,
      required this.isButtonSecondary,
      required this.title,
      this.customChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 80.h,
      padding: kNavBarPadding,
      child: YaBalashCustomButton(
        isDisabled: isDisabled,
        isWithIcon: iconPath != null,
        iconPath: iconPath,
        isSecondaryButton: isButtonSecondary,
        onTap: mainButtonTap ?? () {},
        child: customChild ?? Text(title),
      ),
    );
  }
}
