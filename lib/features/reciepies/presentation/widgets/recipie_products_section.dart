import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_card.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_layouts.dart';
import '../../../../core/theme/light/app_colors_light.dart';

class RecipieProductsSection extends StatelessWidget {
  const RecipieProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: kDefaultPadding,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(top: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Expanded(
                flex: 1,
                child: CustomCard(
                  withBorder: true,
                  isAssetImage: true,
                  imagePath: AppAssets.mix,
                ),
              ),
              mediumHorizontalSpace,
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'دقيق فاخر من ريحانة',
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColorsLight.kAppPrimaryColorLight,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600),
                    ),
                    mediumVerticalSpace,
                    Text(
                      '300 مل',
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 9.sp,
                          color: AppColorsLight.kAppPrimaryColorLight,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              smallHorizontalSpace,
              Expanded(
                flex: 1,
                child: Text(
                  '70 جنيه',
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 17.sp,
                      color: AppColorsLight.kAppPrimaryColorLight),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
