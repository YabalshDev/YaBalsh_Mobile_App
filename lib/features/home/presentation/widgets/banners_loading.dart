import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/constants/app_layouts.dart';

class BannersLoading extends StatelessWidget {
  const BannersLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 133.h,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[800]!,
        highlightColor: Colors.grey[850]!,
        child: ClipRRect(
          borderRadius: kDefaultBorderRaduis,
        ),
      ),
    );
  }
}
