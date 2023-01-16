import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/widgets/custom_shimmer.dart';

class CreatorsLoading extends StatelessWidget {
  const CreatorsLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      child: ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomShimmer(
              width: 60.w,
              height: 60.h,
            ),
            mediumVerticalSpace,
            CustomShimmer(
              width: 60.w,
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }
}
