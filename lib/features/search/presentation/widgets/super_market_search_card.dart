import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/routes/app_routes.dart';
import 'package:yabalash_mobile_app/features/search/domain/entities/store_search.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/theme/light/app_colors_light.dart';
import '../../../../core/theme/light/light_theme.dart';
import '../../../../core/widgets/custom_card.dart';

class SuperMarketSearchCard extends StatelessWidget {
  final StoreSearch store;
  const SuperMarketSearchCard({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Get.toNamed(RouteHelper.getStoreDetailsRoute(), arguments: store),
      child: Container(
        padding: kDefaultPadding,
        margin: EdgeInsets.only(top: 10.h),
        decoration: kDefaultBoxDecoration.copyWith(
            color: Colors.white, border: Border.all(color: Colors.transparent)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomCard(
                  imagePath: store.cardImagePath,
                  isAssetImage: false,
                  withBorder: true,
                ),
                smallHorizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      constraints: BoxConstraints(maxWidth: Get.width * 0.4),
                      child: Text(
                        '${store.name}-${store.location!.address != null ? store.location!.address!.split('-')[0] : 'غير متوفر'}',
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColorsLight.kAppPrimaryColorLight),
                      ),
                    ),
                    smallVerticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.place,
                          color: AppColorsLight.kAppPrimaryColorLight,
                          size: 18.h,
                        ),
                        Container(
                          constraints:
                              BoxConstraints(maxWidth: Get.width * 0.4),
                          child: Text(
                            store.location!.address ?? 'غير متوفر',
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: AppColorsLight.kAppPrimaryColorLight
                                        .withOpacity(0.6)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
            const Spacer(),
            Icon(Icons.arrow_forward_ios,
                size: 15.h, color: AppColorsLight.kDisabledButtonTextColor)
          ],
        ),
      ),
    );
  }
}
