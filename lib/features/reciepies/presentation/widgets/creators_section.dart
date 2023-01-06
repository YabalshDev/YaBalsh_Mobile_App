import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_layouts.dart';
import '../../../../core/widgets/sub_heading.dart';

class CreatorsSection extends StatelessWidget {
  const CreatorsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SubHeading(
          text: 'وصفات من طهاة و ماركات',
          isBold: false,
        ),
        mediumVerticalSpace,
        SizedBox(
          height: 90.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) {
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
            },
          ),
        )
      ],
    );
  }
}
