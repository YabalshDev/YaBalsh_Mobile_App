import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../constants/app_layouts.dart';
import '../theme/light/app_colors_light.dart';

class CustomShimmer extends StatelessWidget {
  final double? height;
  final double? widht;

  const CustomShimmer({super.key, this.height, this.widht});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[800]!,
      highlightColor: Colors.grey[850]!,
      child: Container(
        width: widht ?? 60.w,
        height: height ?? 60.h,
        margin: EdgeInsets.only(left: 10.w, top: 10.h),
        decoration: BoxDecoration(
            color: AppColorsLight.kMainCategoryCardColor,
            borderRadius: kDefaultBorderRaduis),
      ),
    );
  }
}
