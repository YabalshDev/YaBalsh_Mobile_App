import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_layouts.dart';
import 'ya_balash_custom_button.dart';

class CustomNavBar extends StatelessWidget {
  final double? height;
  final void Function()? mainButtonTap;
  final String title;
  final bool? isDisabled;
  final String? iconPath;

  final bool isButtonSecondary;
  const CustomNavBar(
      {super.key,
      this.height,
      this.isDisabled = false,
      this.iconPath,
      this.mainButtonTap,
      required this.isButtonSecondary,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 70.h,
      padding: EdgeInsets.only(bottom: 21.h, right: 15.w, left: 15.w),
      child: YaBalashCustomButton(
        isDisabled: isDisabled,
        isWithIcon: iconPath != null,
        iconPath: iconPath,
        isSecondaryButton: isButtonSecondary,
        onTap: mainButtonTap ?? () {},
        child: Text(title),
      ),
    );
  }
}
