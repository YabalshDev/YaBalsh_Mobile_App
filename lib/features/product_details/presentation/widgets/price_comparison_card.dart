import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_layouts.dart';
import '../../../../core/theme/light/app_colors_light.dart';
import '../../../../core/widgets/custom_card.dart';
import '../../../../core/widgets/custom_svg_icon.dart';
import '../../../home/domain/entities/store.dart';

class PriceComparisonCard extends StatelessWidget {
  final double price;
  final Store store;
  final bool isAvailable;

  const PriceComparisonCard({
    super.key,
    required this.store,
    required this.price,
    required this.isAvailable,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 15.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomCard(
                  height: 45.h,
                  width: 45.h,
                  withBorder: true,
                  isAssetImage: false,
                  imagePath: store.logoImagePath,
                ),
                mediumHorizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          store.name ?? '',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: AppColorsLight.kAppPrimaryColorLight),
                        ),
                        SizedBox(
                          width: 20.w,
                          height: 11.h,
                          child: Image.asset(
                            isAvailable
                                ? AppAssets.inStockIcon
                                : AppAssets.outOfStockIcon,
                            fit: BoxFit.cover,
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomSvgIcon(
                          iconPath: AppAssets.addressesIcon,
                          height: 16.h,
                          width: 12.w,
                          color: AppColorsLight.kAppPrimaryColorLight,
                        ),
                        smallHorizontalSpace,
                        SizedBox(
                          width: constraints.maxWidth * 0.4,
                          child: Text(
                            store.locations!.first.address!,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    fontSize: 10.sp,
                                    color: AppColorsLight.kDarkPurpleColor),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                SizedBox(
                  width: constraints.maxWidth * 0.36,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${price.toStringAsFixed(2)} جنيه',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18.sp,
                                    color:
                                        AppColorsLight.kAppPrimaryColorLight),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      );
    });
  }
}
