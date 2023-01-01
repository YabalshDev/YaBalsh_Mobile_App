import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_shimmer.dart';

import '../../../../core/theme/light/app_colors_light.dart';

class ProductKewordCards extends StatelessWidget {
  final String productName;
  const ProductKewordCards({
    super.key,
    required this.productName,
  });

  @override
  Widget build(BuildContext context) {
    final data = productName.split(RegExp(r'-')).join().split(' ');
    data.removeWhere(
      (element) => element == '',
    );
    return SizedBox(
        height: 50.h,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: data.length,
          itemBuilder: (context, index) {
            final keword = data[index];

            return Card(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
                child: Text(
                  keword,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColorsLight.kDisabledButtonTextColor),
                ),
              ),
            );
          },
        ));
  }
}

class ProductKewordsSectionLoading extends StatelessWidget {
  const ProductKewordsSectionLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50.h,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (context, index) {
            return CustomShimmer(
              width: 60.w,
              height: 24.h,
            );
          },
        ));
  }
}
