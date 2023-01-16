import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/features/reciepies/domain/entities/recipie.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/theme/light/app_colors_light.dart';
import '../../../../core/widgets/custom_card.dart';

class RecipieCard extends StatelessWidget {
  final Recipie recipie;
  const RecipieCard({
    Key? key,
    required this.recipie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(RouteHelper.getRecipieDetailsRoute(), arguments: recipie);
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
                  isAssetImage: false,
                  imagePath: recipie.imagePath,
                ),
                mediumHorizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      constraints: BoxConstraints(maxWidth: Get.width * 0.4),
                      child: Text(
                        recipie.title!,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColorsLight.kAppPrimaryColorLight),
                      ),
                    ),
                    smallVerticalSpace,
                    Row(
                      children: [
                        Text(
                          '${recipie.products!.length} منتجات',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColorsLight.kAppPrimaryColorLight
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
                                  color: AppColorsLight.kAppPrimaryColorLight
                                      .withOpacity(0.6)),
                        ),
                        smallHorizontalSpace,
                        Text(
                          recipie.brand!.name!,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColorsLight.kAppPrimaryColorLight),
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
              color: AppColorsLight.kAppPrimaryColorLight.withOpacity(0.8),
            )
          ],
        ),
      ),
    );
  }
}
