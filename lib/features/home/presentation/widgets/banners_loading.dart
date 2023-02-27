import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_shimmer.dart';

class BannersLoading extends StatelessWidget {
  const BannersLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kDefaultPadding,
      child: CustomShimmer(
        height: 133.h,
      ),
    );
  }
}
