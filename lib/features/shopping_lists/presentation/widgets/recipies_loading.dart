import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/widgets/custom_shimmer.dart';

class RecipiesLoading extends StatelessWidget {
  const RecipiesLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 150.h,
        child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomShimmer(
                  width: 90.w,
                  height: 90.h,
                ),
                smallVerticalSpace,
                CustomShimmer(
                  width: 90.w,
                  height: 10.h,
                ),
              ],
            );
          },
        ));
  }
}
