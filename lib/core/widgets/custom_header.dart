import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../theme/light/app_colors_light.dart';
import 'custom_svg_icon.dart';

class CustomHeader extends StatelessWidget {
  final String title;
  final String? iconPath;
  final VoidCallback? onIconTap;
  const CustomHeader(
      {super.key, this.onIconTap, required this.title, this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 15.h,
        right: 6.w,
      ),
      child: Row(
        children: [
          iconPath != null
              ? InkWell(
                  onTap: onIconTap ?? () => Get.back(),
                  child: CustomSvgIcon(
                    iconPath: iconPath!,
                    color: AppColorsLight.kAppPrimaryColorLight,
                    height: 20.h,
                    width: 23.w,
                  ),
                )
              : const SizedBox(),
          const Spacer(),
          Center(
            child: Container(
              constraints: BoxConstraints(maxWidth: Get.width * 0.7),
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColorsLight.kAppPrimaryColorLight,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1,
                      fontSize: 17.sp),
                ),
              ),
            ),
          ),
          const Spacer()
        ],
      ),
    );
  }
}
