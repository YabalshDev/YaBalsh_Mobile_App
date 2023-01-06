import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_shimmer.dart';

import '../../../../core/constants/app_layouts.dart';
import 'price_comparison_section.dart';
import 'product_kewords_card.dart';

class ProductDetailsLoading extends StatelessWidget {
  const ProductDetailsLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: CustomShimmer(
            height: 196.h,
            width: 164.w,
          ),
        ),
        smallVerticalSpace,
        CustomShimmer(
          height: 20.h,
          width: Get.width,
        ),
        smallVerticalSpace,
        const ProductKewordsSectionLoading(),
        mediumVerticalSpace,
        const PriceComparisonSectionLoading(),
        mediumVerticalSpace,
      ],
    );
  }
}
