import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_layouts.dart';

class CreatorCard extends StatelessWidget {
  const CreatorCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 60.w,
            height: 60.h,
            child: ClipRRect(
              borderRadius: kSecondaryBorderRaduis,
              child: Image.asset(
                AppAssets.ulker,
                fit: BoxFit.cover,
              ),
            ),
          ),
          smallVerticalSpace,
          Container(
            constraints: BoxConstraints(maxWidth: 60.w),
            child: Text(
              'اولكر',
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
