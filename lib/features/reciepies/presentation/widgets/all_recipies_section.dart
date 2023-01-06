import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/constants/app_assets.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';
import 'package:yabalash_mobile_app/core/routes/app_routes.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_card.dart';
import 'package:yabalash_mobile_app/core/widgets/sub_heading.dart';

import '../../../../core/theme/light/app_colors_light.dart';

class AllRecipiesSection extends StatelessWidget {
  const AllRecipiesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SubHeading(text: 'طبختك علي قد ايدك!'),
        smallVerticalSpace,
        ListView.builder(
          itemCount: 5,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Get.toNamed(RouteHelper.getRecipieDetailsRoute());
              },
              child: Container(
                margin: EdgeInsets.only(top: 15.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomCard(
                          withBorder: false,
                          height: 70.h,
                          width: 70.w,
                          imagePath: AppAssets.ulker,
                        ),
                        mediumHorizontalSpace,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              constraints:
                                  BoxConstraints(maxWidth: Get.width * 0.4),
                              child: Text(
                                'بروتين بان كيك',
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w600,
                                        color: AppColorsLight
                                            .kAppPrimaryColorLight),
                              ),
                            ),
                            smallVerticalSpace,
                            Row(
                              children: [
                                Text(
                                  '3 منتجات',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600,
                                          color: AppColorsLight
                                              .kAppPrimaryColorLight
                                              .withOpacity(0.6)),
                                ),
                                smallHorizontalSpace,
                                Text(
                                  '.',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w800,
                                          color: AppColorsLight
                                              .kAppPrimaryColorLight
                                              .withOpacity(0.6)),
                                ),
                                smallHorizontalSpace,
                                Text(
                                  'omar cooks',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600,
                                          color: AppColorsLight
                                              .kAppPrimaryColorLight),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    Icon(
                      Icons.add,
                      size: 20.h,
                      color:
                          AppColorsLight.kAppPrimaryColorLight.withOpacity(0.8),
                    )
                  ],
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
