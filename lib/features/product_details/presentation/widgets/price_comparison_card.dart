import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yabalash_mobile_app/features/home/domain/entities/price_model.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_layouts.dart';
import '../../../../core/theme/light/app_colors_light.dart';
import '../../../../core/widgets/custom_card.dart';
import '../../../../core/widgets/custom_svg_icon.dart';

class PriceComparisonCard extends StatelessWidget {
  final MapEntry<String, PriceModel> priceModel;
  final int pricesLength;
  final int index;
  const PriceComparisonCard({
    super.key,
    required this.index,
    required this.priceModel,
    required this.pricesLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 15.h),
          padding: EdgeInsets.only(left: 15.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomCard(
                height: 45.h,
                width: 45.h,
                withBorder: true,
                imagePath: priceModel.value.storeImagePath,
              ),
              mediumHorizontalSpace,
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          priceModel.key,
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
                            priceModel.value.isAvailable!
                                ? AppAssets.inStockIcon
                                : AppAssets.outOfStockIcon,
                            fit: BoxFit.cover,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        CustomSvgIcon(
                          iconPath: AppAssets.addressesIcon,
                          height: 7.h,
                          width: 8.w,
                        ),
                        smallHorizontalSpace,
                        Text(
                          'كايرو فيستفال سيتي',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  fontSize: 10.sp,
                                  color: AppColorsLight.kDarkPurpleColor),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${priceModel.value.price} جنيه',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 18.sp,
                          color: AppColorsLight.kAppPrimaryColorLight),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const CustomSvgIcon(
                          iconPath: AppAssets.warningIcon,
                          color: AppColorsLight.warningColor,
                        ),
                        smallHorizontalSpace,
                        Text(
                          'ينتهي في 10 يونيو',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColorsLight.warningColor),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        pricesLength == 2 && index == pricesLength - 1
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'عرض كل الاسعار',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColorsLight.kAppPrimaryColorLight,
                        fontWeight: FontWeight.w700),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColorsLight.kAppPrimaryColorLight,
                  )
                ],
              )
            : const SizedBox()
      ],
    );
  }
}
