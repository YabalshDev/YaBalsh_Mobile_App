import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/product_loading_shimmer.dart';

class SearchProductsLoading extends StatelessWidget {
  const SearchProductsLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: 2,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5.w,
          crossAxisSpacing: 5.h,
          childAspectRatio: 133.w / 144.h),
      itemBuilder: (context, index) {
        return const ProductLoadingShimmer();
      },
    );
  }
}
