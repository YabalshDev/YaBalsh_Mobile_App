import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/theme/light/app_colors_light.dart';
import '../../../../core/theme/light/light_theme.dart';

class BackToTopCard extends StatelessWidget {
  final ScrollController scrollController;
  const BackToTopCard({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        scrollController.animateTo(0,
            duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
      },
      child: Container(
        padding: kSmallPadding.copyWith(
            left: 4.w, right: 4.w, bottom: 1.h, top: 1.h),
        decoration: kDefaultBoxDecoration.copyWith(
            border: Border.all(color: Colors.transparent),
            color: AppColorsLight.kAppPrimaryColorLight),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            smallHorizontalSpace,
            Container(
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.white),
              child: Icon(
                Icons.keyboard_arrow_up,
                size: 15.h,
                color: AppColorsLight.kAppPrimaryColorLight,
              ),
            ),
            smallHorizontalSpace,
            Text(
              'الرجوع للاعلى',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(fontWeight: FontWeight.w700, color: Colors.white),
            ),
            smallHorizontalSpace,
          ],
        ),
      ),
    );
  }
}
