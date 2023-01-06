import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yabalash_mobile_app/core/theme/light/app_colors_light.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_layouts.dart';
import '../../../../core/widgets/custom_svg_icon.dart';

class RecipieDetailsSection extends StatelessWidget {
  const RecipieDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        Column(
          children: [
            Container(
                padding: kSecondaryPadding,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.grey.shade300),
                child: CustomSvgIcon(
                  height: 25.h,
                  width: 25.w,
                  iconPath: AppAssets.clockIcon,
                  color: AppColorsLight.kAppPrimaryColorLight,
                )),
            smallVerticalSpace,
            Text(
              '60 دقيقة',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColorsLight.kAppPrimaryColorLight,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
        mediumHorizontalSpace,
        Column(
          children: [
            Container(
                padding: kSecondaryPadding,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.grey.shade300),
                child: CustomSvgIcon(
                  height: 25.h,
                  width: 25.w,
                  iconPath: AppAssets.recipieIcon,
                  color: AppColorsLight.kAppPrimaryColorLight,
                )),
            smallVerticalSpace,
            Text('4 منتجات',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColorsLight.kAppPrimaryColorLight,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600))
          ],
        ),
        const Spacer()
      ],
    );
  }
}
