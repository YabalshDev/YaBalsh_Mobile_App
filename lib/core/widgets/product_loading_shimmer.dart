import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../constants/app_layouts.dart';
import '../theme/light/app_colors_light.dart';

class ProductLoadingShimmer extends StatelessWidget {
  const ProductLoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade400,
      child: Container(
        width: 126.w,
        height: 133.h,
        margin: EdgeInsets.only(left: 10.w, bottom: 10.h),
        decoration: BoxDecoration(
            color: AppColorsLight.kMainCategoryCardColor,
            borderRadius: kDefaultBorderRaduis),
      ),
    );
  }
}
