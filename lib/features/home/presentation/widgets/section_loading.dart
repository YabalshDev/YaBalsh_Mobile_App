import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/widgets/product_loading_shimmer.dart';

class SectionLoading extends StatelessWidget {
  const SectionLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10.h),
        SizedBox(
          height: 200.h,
          child: ListView.builder(
            padding: kScaffoldPadding,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) {
              return const ProductLoadingShimmer();
            },
          ),
        ),
      ],
    );
  }
}
