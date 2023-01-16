import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yabalash_mobile_app/core/theme/light/app_colors_light.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_network_image.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../domain/entities/brand.dart';

class BrandCard extends StatelessWidget {
  final Brand brand;
  const BrandCard({
    Key? key,
    required this.brand,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 65.h,
            width: 65.w,
            decoration: BoxDecoration(
                borderRadius: kDefaultBorderRaduis,
                border: Border.all(color: AppColorsLight.kDefaultBorderColor)),
            child: ClipRRect(
              borderRadius: kDefaultBorderRaduis,
              child: AppImage(
                path: brand.imagePath,
                fit: BoxFit.fill,
              ),
            ),
          ),
          smallVerticalSpace,
          Container(
            constraints: BoxConstraints(maxWidth: 60.w),
            child: Text(
              brand.name!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 11.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
