import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../constants/app_assets.dart';
import '../theme/light/app_colors_light.dart';
import 'custom_svg_icon.dart';

class CustomHeader extends StatelessWidget {
  final bool isWithNotification;
  final String title;
  final String? iconPath;
  final VoidCallback? onIconTap;
  const CustomHeader(
      {super.key,
      this.onIconTap,
      required this.isWithNotification,
      required this.title,
      this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 12.h, right: 6.5.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isWithNotification
              ? InkWell(
                  onTap: onIconTap ?? () => Get.back(),
                  child: CustomSvgIcon(
                    iconPath: iconPath ?? AppAssets.notificationIcon,
                    color: AppColorsLight.kAppPrimaryColorLight,
                    height: 20.h,
                    width: 23.w,
                  ),
                )
              : const SizedBox(),
          isWithNotification
              ? SizedBox(
                  width: Get.width * 0.35,
                )
              : const Spacer(),
          Center(
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColorsLight.kAppPrimaryColorLight,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1,
                  fontSize: 17.sp),
            ),
          ),
          const Spacer()
        ],
      ),
    );
  }
}
