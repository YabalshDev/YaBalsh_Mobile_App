import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';
import 'package:yabalash_mobile_app/core/theme/light/app_colors_light.dart';

import '../constants/app_assets.dart';
import 'custom_svg_icon.dart';

class CustomToast extends StatelessWidget {
  final String message;
  const CustomToast({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        width: Get.width * 0.8,
        decoration: BoxDecoration(
          borderRadius: kDefaultBorderRaduis,
          color: AppColorsLight.kAppSecondaryColorLight,
          boxShadow: [
            BoxShadow(
              offset: const Offset(1, 2),
              blurRadius: 2,
              color: Colors.black.withOpacity(0.3),
            ),
          ],
        ),
        padding: EdgeInsets.fromLTRB(5.w, 18.h, 15.w, 18.h),
        child: Row(
          children: [
            CustomSvgIcon(
              iconPath: AppAssets.notAvailable,
              color: AppColorsLight.kAppPrimaryColorLight,
              width: 16.h,
              height: 16.h,
              boxFit: BoxFit.fill,
            ),
            mediumHorizontalSpace,
            Container(
              constraints: BoxConstraints(maxWidth: Get.width * 0.6),
              child: Text(
                message,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 13.sp,
                    color: AppColorsLight.kAppPrimaryColorLight,
                    fontWeight: FontWeight.w700),
              ),
            )
          ],
        ),
      ),
    );
  }
}
