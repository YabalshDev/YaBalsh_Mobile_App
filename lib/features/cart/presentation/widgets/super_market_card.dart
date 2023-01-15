import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yabalash_mobile_app/core/depedencies.dart';
import 'package:yabalash_mobile_app/features/cart/domain/entities/supermarket_card_model.dart';
import 'package:yabalash_mobile_app/features/cart/presentation/blocs/cubit/super_markets_cubit.dart';
import 'package:yabalash_mobile_app/features/home/data/models/location_model.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_layouts.dart';
import '../../../../core/services/zone_service.dart';
import '../../../../core/theme/light/app_colors_light.dart';
import '../../../../core/widgets/custom_card.dart';
import '../../../../core/widgets/custom_svg_icon.dart';

class SuperMarketCard extends StatelessWidget {
  final SuperMarketCardModel superMarket;
  final int index;
  final int selectedSupermarketIndex;
  final bool isAvailable;
  const SuperMarketCard({
    super.key,
    required this.superMarket,
    required this.index,
    required this.selectedSupermarketIndex,
    required this.isAvailable,
  });

  @override
  Widget build(BuildContext context) {
    final location = superMarket.store!.locations!.firstWhere(
      (element) => element.subZoneId == getIt<ZoneService>().currentSubZone!.id,
      orElse: () => const LocationModel(),
    );
    return Container(
      margin: EdgeInsets.only(top: 10.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isAvailable
              ? InkWell(
                  onTap: () => BlocProvider.of<SuperMarketsCubit>(context)
                      .setSuperMarketIndex(index: index),
                  child: Container(
                    width: 18.w,
                    height: 18.w,
                    margin: EdgeInsets.only(top: 25.h),
                    decoration: BoxDecoration(
                        color: selectedSupermarketIndex == index
                            ? AppColorsLight.kAppPrimaryColorLight
                            : Colors.transparent,
                        shape: BoxShape.circle,
                        border:
                            Border.all(color: Colors.grey.shade400, width: 2)),
                  ),
                )
              : SizedBox(
                  width: 18.w,
                ),
          mediumHorizontalSpace,
          SizedBox(
            width: 210.w,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomCard(
                  isAssetImage: false,
                  withBorder: true,
                  imagePath: superMarket.store!.cardImagePath,
                ),
                mediumHorizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          superMarket.store!.name!,
                          overflow: TextOverflow.ellipsis,
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
                      children: [
                        const CustomSvgIcon(
                          iconPath: AppAssets.clockIcon,
                          color: AppColorsLight.kAppPrimaryColorLight,
                        ),
                        smallHorizontalSpace,
                        Text(
                          location.deliveryTime != null
                              ? '${location.deliveryTime} دقيقة'
                              : '30 دقيقة',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w700,
                                  color: AppColorsLight.kAppPrimaryColorLight
                                      .withOpacity(0.6)),
                        ),
                        largeHorizontalSpace,
                        CustomSvgIcon(
                          iconPath: AppAssets.truckIcon,
                          height: 15.h,
                          width: 15.w,
                          color: AppColorsLight.kAppPrimaryColorLight,
                        ),
                        smallHorizontalSpace,
                        Text(
                          location.deliveryFees != null
                              ? '${double.parse(location.deliveryFees!).round()} جنيه'
                              : '30 جنيه',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w700,
                                  color: AppColorsLight.kAppPrimaryColorLight
                                      .withOpacity(0.6)),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: superMarket.saving! <= 0
                    ? EdgeInsets.only(left: 7.w)
                    : null,
                child: Text(
                  '${superMarket.price!.toStringAsFixed(0)} جنيه',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 18.sp,
                      color: AppColorsLight.kAppPrimaryColorLight),
                ),
              ),
              superMarket.saving! > 0
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomSvgIcon(
                          iconPath: AppAssets.priceTagIcon,
                          color: Colors.green.shade500,
                        ),
                        smallHorizontalSpace,
                        Text(
                          'توفير ${superMarket.saving!.toStringAsFixed(0)} جنيه ',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontSize: 9.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.green.shade500,
                                  ),
                        ),
                      ],
                    )
                  : const SizedBox()
            ],
          )
        ],
      ),
    );
  }
}
