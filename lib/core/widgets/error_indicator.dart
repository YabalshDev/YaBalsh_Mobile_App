import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_assets.dart';
import '../constants/app_layouts.dart';
import 'custom_svg_icon.dart';

class ErrorIndicator extends StatelessWidget {
  final String errorMessage;
  const ErrorIndicator({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomSvgIcon(
          iconPath: AppAssets.error,
          width: 130.w,
          height: 130.h,
          boxFit: BoxFit.fill,
        ),
        largeVerticalSpace,
        Text(
          errorMessage,
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(fontSize: 17.sp, fontWeight: FontWeight.w700),
        )
      ],
    );
  }
}
