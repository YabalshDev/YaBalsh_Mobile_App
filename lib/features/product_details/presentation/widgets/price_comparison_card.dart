import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yabalash_mobile_app/core/depedencies.dart';
import 'package:yabalash_mobile_app/features/home/data/models/location_model.dart';
import 'package:yabalash_mobile_app/features/product_details/presentation/blocs/cubit/product_details_cubit.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_layouts.dart';
import '../../../../core/services/zone_service.dart';
import '../../../../core/theme/light/app_colors_light.dart';
import '../../../../core/widgets/custom_card.dart';
import '../../../../core/widgets/custom_svg_icon.dart';
import '../../../home/domain/entities/location.dart';
import '../../../home/domain/entities/store.dart';

class PriceComparisonCard extends StatelessWidget {
  final double price;
  final Store store;
  final bool isAvailable;
  final int pricesLength;
  final int index;
  final bool isNear;
  const PriceComparisonCard({
    super.key,
    required this.index,
    required this.store,
    required this.price,
    required this.isNear,
    required this.isAvailable,
    required this.pricesLength,
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
                  imagePath: store.cardImagePath,
                ),
                mediumHorizontalSpace,
                SizedBox(
                  width: constraints.maxWidth * 0.50,
                  child: Column(
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
                                    color:
                                        AppColorsLight.kAppPrimaryColorLight),
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
                          Text(
                            getStoreAddress(store, isNear),
                            overflow: TextOverflow.ellipsis,
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
                const Spacer(),
                SizedBox(
                  width: constraints.maxWidth * 0.34,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '$price جنيه',
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
          PriceCardShowMore(pricesLength: pricesLength, index: index)
        ],
      );
    });
  }
}

String getStoreAddress(Store store, bool isNearStores) {
  String address = '';
  Location? storeLocation = store.locations!.firstWhere(
      (element) => element.subZoneId != getIt<ZoneService>().currentSubZone!.id,
      orElse: () => const LocationModel());
  if (isNearStores ||
      storeLocation.subZoneId == null && store.locations!.isNotEmpty) {
    address = store.locations!
        .firstWhere((element) =>
            element.subZoneId == getIt<ZoneService>().currentSubZone!.id)
        .address!;
  } else {
    if (storeLocation.address != null) {
      address = storeLocation.address!;
    } else {
      address = 'غير متوفر';
    }
  }

  return address;
}

class PriceCardShowMore extends StatelessWidget {
  const PriceCardShowMore({
    Key? key,
    required this.pricesLength,
    required this.index,
  }) : super(key: key);

  final int pricesLength;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      builder: (context, state) {
        return pricesLength <= 5
            ? const SizedBox()
            : pricesLength < 5 && index == pricesLength - 1
                ? InkWell(
                    onTap: () => BlocProvider.of<ProductDetailsCubit>(context)
                        .changeShowMore(false),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'عرض كل الاسعار',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  color: AppColorsLight.kAppPrimaryColorLight,
                                  fontWeight: FontWeight.w700),
                        ),
                        const Icon(
                          Icons.keyboard_arrow_down,
                          color: AppColorsLight.kAppPrimaryColorLight,
                        )
                      ],
                    ),
                  )
                : pricesLength > 5 && index == pricesLength - 1
                    ? InkWell(
                        onTap: () =>
                            BlocProvider.of<ProductDetailsCubit>(context)
                                .changeShowMore(true),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'عرض اسعار اقل',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      color:
                                          AppColorsLight.kAppPrimaryColorLight,
                                      fontWeight: FontWeight.w700),
                            ),
                            const Icon(
                              Icons.keyboard_arrow_up,
                              color: AppColorsLight.kAppPrimaryColorLight,
                            )
                          ],
                        ),
                      )
                    : const SizedBox();
      },
    );
  }
}
