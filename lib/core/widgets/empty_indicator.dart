import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yabalash_mobile_app/core/constants/app_assets.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';

class EmptyIndicator extends StatelessWidget {
  final String title;
  const EmptyIndicator({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          AppAssets.emptyIllustrator,
          width: 203.w,
          height: 207.h,
          fit: BoxFit.contain,
        ),
        mediumVerticalSpace,
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(fontSize: 17.sp, fontWeight: FontWeight.w700),
        )
      ],
    );
  }
}
