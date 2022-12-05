import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_assets.dart';
import '../theme/light/app_colors_light.dart';
import 'custom_svg_icon.dart';

class CustomHeader extends StatelessWidget {
  final bool isWithNotification;
  final String title;
  const CustomHeader(
      {super.key, required this.isWithNotification, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        isWithNotification
            ? CustomSvgIcon(
                iconPath: AppAssets.notificationIcon,
                color: AppColorsLight.kAppPrimaryColorLight,
                height: 27.h,
                width: 23.w,
              )
            : const SizedBox(),
        const Spacer(),
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: AppColorsLight.kAppPrimaryColorLight),
        ),
        const Spacer()
      ],
    );
  }
}
